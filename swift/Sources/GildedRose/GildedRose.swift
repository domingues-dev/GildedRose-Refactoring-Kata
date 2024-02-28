public class GildedRose {
  var items: [Item]
  
  public init(items: [Item]) {
    self.items = items
  }
  
  public func updateQuality() {
    for item in items {
      item.updateQuality()
    }
  }
}

private extension Item {
  var maxQuality: Int { 50 }
  var minQuality: Int { 0 }
    
  func updateQuality() {
    switch name {
      case "Sulfuras, Hand of Ragnaros": break
      case "Aged Brie": updateAgedBrieItem()
      case "Backstage passes to a TAFKAL80ETC concert": updateBackStageItem()
      case "Conjured Mana Cake": updateManaCakeItem()
      default: updateCommonItem()
    }
  }
  
  private func updateAgedBrieItem() {
    quality += 1
    sellIn -= 1
    if sellIn < 0 { quality += 1 }
    quality = min(maxQuality, quality)
    quality = max(minQuality, quality)
  }
  
  private func updateBackStageItem() {
    quality += 1
    if sellIn < 11 { quality += 1 }
    if sellIn < 6 { quality += 1 }
    sellIn -= 1
    if sellIn < 0 { quality = minQuality }
    quality = min(maxQuality, quality)
    quality = max(minQuality, quality)
  }
  
  private func updateManaCakeItem() {
    updateCommonItem(at: 2)
  }
  
  private func updateCommonItem(at rate: Int = 1) {
    quality -= rate
    sellIn -= 1
    if sellIn < 0 { quality -= rate }
    quality = min(maxQuality, quality)
    quality = max(minQuality, quality)
  }
}
