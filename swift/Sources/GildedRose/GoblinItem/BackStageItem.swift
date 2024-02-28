public class BackStageItem: Item, GoblinItem {
  public func updateQuality() {
    quality += 1
    if sellIn < 11 { quality += 1 }
    if sellIn < 6 { quality += 1 }
    sellIn -= 1
    quality = min(50, quality)
    quality = max(0, quality)
    if sellIn < 0 { quality = 0 }
  }
}
