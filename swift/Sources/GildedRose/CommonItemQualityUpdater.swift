
enum CommonItemQualityUpdater: UpdatableItemQuality {
  static let itemIdentifier = ItemIdentifier.commonItem
  static let qualityChangeRate: Int = -1
  
  static func updateQuality(item: Item) {
    guard case ItemIdentifier(item) = itemIdentifier else { return }
    defaultQualityUpdater(item: item)
  }
}
