enum ItemIdentifier: String {
  case sulfuras = "Sulfuras, Hand of Ragnaros"
  case agedBrie = "Aged Brie"
  case backstage = "Backstage passes to a TAFKAL80ETC concert"
  case conjured = "Conjured Mana Cake"
  case commonItem
  
  init(_ item: Item) {
    self = Self(rawValue: item.name) ?? .commonItem
  }
}
