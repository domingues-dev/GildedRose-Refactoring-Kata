public class CommonItem: Item, GoblinItem {
  public func updateQuality() {
    quality -= 1
    sellIn -= 1
    if sellIn < 0 { quality -= 1 }
    quality = min(50, quality)
    quality = max(0, quality)
  }
}
