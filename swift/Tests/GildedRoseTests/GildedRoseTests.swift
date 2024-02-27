@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
  
  func test_updateQuality_doesNotChangeSulfurasItems() {
    let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)]
    let app = GildedRose(items: items)
    app.updateQuality()
    XCTAssertEqual(app.items[0].name, items[0].name)
    XCTAssertEqual(app.items[0].sellIn, items[0].sellIn)
    XCTAssertEqual(app.items[0].quality, items[0].quality)
  }
}
