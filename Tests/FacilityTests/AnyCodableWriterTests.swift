import XCTest
@testable import Facility
final class AnyCodableWriterTests: XCTestCase {
  func testNil() throws {
    let codable = nil as Int?
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testBool() throws {
    let codable = true
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testInt() throws {
    let codable = 1 as Int
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testInt64() throws {
    let codable = 1 as Int64
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testInt32() throws {
    let codable = 1 as Int32
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testInt16() throws {
    let codable = 1 as Int16
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testInt8() throws {
    let codable = 1 as Int8
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testUInt() throws {
    let codable = 1 as UInt
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testUInt64() throws {
    let codable = 1 as UInt64
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testUInt32() throws {
    let codable = 1 as UInt32
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testUInt16() throws {
    let codable = 1 as UInt16
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testUInt8() throws {
    let codable = 1 as UInt8
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testDouble() throws {
    let codable = 1.1 as Double
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testFloat() throws {
    let codable = 1.1 as Float
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testString() throws {
    let codable = "Hello World!"
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testEmptyListInt() throws {
    let codable = [] as [Int]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testListInt() throws {
    let codable = [1, 2]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testListListInt() throws {
    let codable = [[], [1], [2, 2]]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testListListListInt() throws {
    let codable = [[], [[]], [[1]], [[2, 2], [3, 3, 3]]]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testListMapStringString() throws {
    let codable = [1: 2]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testListMapMapStringString() throws {
    let codable = [1: [2: 3], 4: [5: 6], 7: [8: 9]]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testEmptyMapStringString() throws {
    let codable = [:] as [String: String]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testEmptyMapIntInt() throws {
    let codable = [:] as [Int: Int]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testEmptyMapStringListInt() throws {
    let codable = [:] as [String: [Int]]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testMapStringListOptionalString() throws {
    let codable: [String: [String?]] = ["zero": [], "one": [nil], "two": ["two", nil]]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testMapStringMapStringInt() throws {
    let codable = ["one": ["1": 1], "two": ["2": 2]]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testMapStringListString() throws {
    let codable = ["zero": [], "one": ["one"], "two": ["two"]]
    let anyCodable = try AnyCodable.Notation.json.write(codable)
    let any = try AnyCodable(any: codable)
    XCTAssertEqual(anyCodable, any)
  }
  func testAny() throws {
    let codable = 1.1
    let any1 = try AnyCodable(any: codable)
    let any2 = try AnyCodable(any: NSNumber(value: codable) as Any?)
    XCTAssertEqual(any1, any2)
  }
}
