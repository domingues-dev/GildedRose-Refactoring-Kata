public class GildedRose {
  var items: [Item]
  
  public init(items: [Item]) {
    self.items = items
  }
  
  public func updateQuality() {
    for item in items {
      AgedBrieQualityUpdater.updateQuality(item: item)
      BackStageQualityUpdater.updateQuality(item: item)
      ConjuredItemQualityUpdater.updateQuality(item: item)
      CommonItemQualityUpdater.updateQuality(item: item)
    }
  }
}
