protocol UpdatableItemQuality {
  static var itemIdentifier: ItemIdentifier { get }
  static var qualityChangeRate: Int { get }
  static var qualityRange: ClosedRange<Int> { get }
  static func updateQuality(item: Item)
  
  static func qualityController(item: Item)
  
}

extension UpdatableItemQuality {

  static var qualityRange: ClosedRange<Int> { (0...50) }
  
  static func qualityController(item: Item) {
    item.quality = max(qualityRange.lowerBound, item.quality)
    item.quality = min(qualityRange.upperBound, item.quality)
  }
  
  static func defaultQualityUpdater(item: Item) {
    item.quality += qualityChangeRate
    item.sellIn -= 1
    if item.sellIn < 0 { item.quality += qualityChangeRate }
    qualityController(item: item)
  }
}
