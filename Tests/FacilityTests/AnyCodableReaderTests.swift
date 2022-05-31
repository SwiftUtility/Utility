import XCTest
@testable import Facility
struct Testable: Codable, Equatable {
  var url: URL? = .init(string: "http://net.net.net")
  var data: Data = .init("Hello".utf8)
  var float: Float = 1.3453453
  var int16: UInt16 = 12323
  var listOptionalInt: [Int?] = [1, 2, 3, nil, 4, nil, nil, 5]
  var listListable: [Listable?] = [
    .init(int: 1, bool: true, string: "Hello"),
    nil,
    nil,
    nil,
    .init(int: nil, bool: false, string: "World"),
    nil,
    nil,
    nil,
  ]
  var mappable: Mappable? = .init(strung: "some string")
  struct Mappable: Codable, Equatable {
    var strung: String
  }
  struct Listable: Codable, Equatable {
    var int: Int?
    var bool: Bool
    var string: String
  }
}
final class AnyCodableReaderTests: XCTestCase {
  func testDecode() throws {
    let testable = Testable()
    let codable = try AnyCodable.Notation.json.write(testable)
    let readable = try AnyCodable.Dialect.json.read(Testable.self, from: codable)
    XCTAssertEqual(testable, readable)
  }
  func testInt() throws {
    let testable = 234234
    let codable = try AnyCodable.Notation.json.write(testable)
    let readable = try AnyCodable.Dialect.json.read(Int.self, from: codable)
    XCTAssertEqual(testable, readable)
  }
  func testDate() throws {
    let testable = Date()
    let codable = try AnyCodable.Notation.json.write(testable)
    let readable = try AnyCodable.Dialect.json.read(Date.self, from: codable)
    XCTAssertEqual(testable.timeIntervalSince1970, readable.timeIntervalSince1970)
  }
}
