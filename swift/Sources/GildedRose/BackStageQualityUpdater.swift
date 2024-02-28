enum BackStageQualityUpdater: UpdatableItemQuality {
  static let itemIdentifier = ItemIdentifier.backstage
  static let qualityChangeRate: Int = 1
  
  static func updateQuality(item: Item) {
    guard case ItemIdentifier(item) = itemIdentifier else { return }
    item.quality += qualityChangeRate
    if item.sellIn < 11 { item.quality += qualityChangeRate }
    if item.sellIn < 6 { item.quality += qualityChangeRate }
    item.sellIn -= 1
    if item.sellIn < 0 { item.quality = qualityRange.lowerBound }
    qualityController(item: item)
  }
}
