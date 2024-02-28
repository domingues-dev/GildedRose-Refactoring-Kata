enum ConjuredItemQualityUpdater: UpdatableItemQuality {
  static var itemIdentifier = ItemIdentifier.conjured
  static let qualityChangeRate: Int = CommonItemQualityUpdater.qualityChangeRate * 2
  static func updateQuality(item: Item) {
    guard case ItemIdentifier(item) = itemIdentifier else { return }
    defaultQualityUpdater(item: item)
  }
}
