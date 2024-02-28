enum AgedBrieQualityUpdater: UpdatableItemQuality {
  static let itemIdentifier = ItemIdentifier.agedBrie
  static let qualityChangeRate: Int = 1
  
  static func updateQuality(item: Item) {
    guard case ItemIdentifier(item) = itemIdentifier else { return }
    item.quality += qualityChangeRate
    item.sellIn -= 1
    if item.sellIn < 0 { item.quality += qualityChangeRate }
    qualityController(item: item)
  }
}
