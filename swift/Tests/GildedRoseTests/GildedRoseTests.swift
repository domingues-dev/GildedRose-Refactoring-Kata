@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
  
  func test_updateQuality_itemQualityAndSellInDecreases() {
    let item = Item(name: "any-item", sellIn: 10, quality: 10)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "any-item", expectedSellIn: 9, expectedQuality: 9, when: {
      sut.updateQuality()
    })
  }
  
  func test_updateQuality_itemQualityDecreasesTwiceAsFastForNegativeSellIn() {
    let item = Item(name: "any-item", sellIn: -1, quality: 2)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "any-item", expectedSellIn: -2, expectedQuality: 0, when: {
      sut.updateQuality()
    })
  }
  
  func test_updateQuality_itemQualityIsNeverNegative() {
    let item = Item(name: "any-item", sellIn: -1, quality: 0)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "any-item", expectedSellIn: -2, expectedQuality: 0, when: {
      sut.updateQuality()
    })
  }

  func test_updateQuality_agedBrieQualityIncreasesByOne() {
    let item = Item(name: "Aged Brie", sellIn: 1, quality: 0)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "Aged Brie", expectedSellIn: 0, expectedQuality: 1, when: {
      sut.updateQuality()
    })
  }
  
  func test_updateQuality_itemQualityCanNotBeIncreasedAboveFifty() {
    let item = Item(name: "Aged Brie", sellIn: 1, quality: 50)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "Aged Brie", expectedSellIn: 0, expectedQuality: 50, when: {
      sut.updateQuality()
    })
  }
  
  func test_updateQuality_doesNotChangeSulfurasItems() {
    let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "Sulfuras, Hand of Ragnaros", expectedSellIn: 0, expectedQuality: 80, when: {
      sut.updateQuality()
    })
  }
  
  func test_updateQualityBackstage_increseasQualityByOneAsItsSellInValueApproachesZero() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 40, quality: 10)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "Backstage passes to a TAFKAL80ETC concert", expectedSellIn: 39, expectedQuality: 11, when: {
      sut.updateQuality()
    })
  }
  
  func test_updateQualityBackstage_increseasQualityByTwoAsForSellInUnderOrEqualTenAndAboveZero() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 10)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "Backstage passes to a TAFKAL80ETC concert", expectedSellIn: 9, expectedQuality: 12, when: {
      sut.updateQuality()
    })
  }
  
  func test_updateQualityBackstage_increseasQualityByThreeForSellInUnderOrEqualFiveAndAboveZero() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 10)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "Backstage passes to a TAFKAL80ETC concert", expectedSellIn: 4, expectedQuality: 13, when: {
      sut.updateQuality()
    })
  }
  
  func test_updateQualityBackstage_qualityDropsToZeroForNegativeSellIn() {
    let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 10)
    let sut = makeSUT(items: [item])
    assert(sut, expectedName: "Backstage passes to a TAFKAL80ETC concert", expectedSellIn: -1, expectedQuality: 0, when: {
      sut.updateQuality()
    })
  }
}

// MARK: Helpers

private func makeSUT(items: [Item]) -> GildedRose {
  GildedRose(items: items)
}

private func assert(
  _ sut: GildedRose,
  expectedName: String,
  expectedSellIn: Int,
  expectedQuality: Int,
  at index: Int = 0,
  when action: @escaping () -> Void,
  file: StaticString = #filePath,
  line: UInt = #line
) {
  action()
  XCTAssertEqual(sut.items[index].name, expectedName, file: file, line: line)
  XCTAssertEqual(sut.items[index].quality, expectedQuality, file: file, line: line)
  XCTAssertEqual(sut.items[index].sellIn, expectedSellIn, file: file, line: line)
}
