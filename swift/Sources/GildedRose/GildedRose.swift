public class GildedRose {
  var items: [GoblinItem]
  
  public init(items: [Item]) {
    self.items = items.map { item -> GoblinItem in
      switch item.name {
        case "Sulfuras, Hand of Ragnaros":
          return SulfurasItem(name: item.name, sellIn: item.sellIn, quality: item.quality)
        case "Aged Brie":
          return AgedBrieItem(name: item.name, sellIn: item.sellIn, quality: item.quality)
        case "Backstage passes to a TAFKAL80ETC concert":
          return BackStageItem(name: item.name, sellIn: item.sellIn, quality: item.quality)
        default:
          return CommonItem(name: item.name, sellIn: item.sellIn, quality: item.quality)
      }
    }
  }
  
  public func updateQuality() {
    for item in items {
      item.updateQuality()
    }
  }
}
