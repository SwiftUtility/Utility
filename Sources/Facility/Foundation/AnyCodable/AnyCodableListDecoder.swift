import Foundation
extension AnyCodable {
  public struct ListDecoder: UnkeyedDecodingContainer {
    public private(set) var currentIndex: Int = 0
    private let reader: Reader
    public init(reader: Reader) {
      self.reader = reader
    }
    public var count: Int? { reader.anyCodable.list?.count }
    public var isAtEnd: Bool { currentIndex >= count.or(0) }
    public var codingPath: [CodingKey] { reader.codingPath + [Chip.index(currentIndex)] }
    public mutating func decodeNil() throws -> Bool {
      try reader.rethrow(what: "not a list", chip: .index(currentIndex)) {
        let list = try ?!reader.anyCodable.list
        return list[currentIndex].value?.isNull.then { currentIndex += 1 } != nil
      }
    }
    public mutating func decode(_ type: Bool.Type) throws -> Bool {
      try advanceAfter { try ?!$0.value?.bool }
    }
    public mutating func decode(_ type: Int.Type) throws -> Int {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: Int64.Type) throws -> Int64 {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: Int32.Type) throws -> Int32 {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: Int16.Type) throws -> Int16 {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: Int8.Type) throws -> Int8 {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: UInt.Type) throws -> UInt {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: UInt64.Type) throws -> UInt64 {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: UInt32.Type) throws -> UInt32 {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: UInt16.Type) throws -> UInt16 {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: UInt8.Type) throws -> UInt8 {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: Double.Type) throws -> Double {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: Float.Type) throws -> Float {
      try advanceAfter { try ?!.init(exactly: ?!$0.value?.number) }
    }
    public mutating func decode(_ type: String.Type) throws -> String {
      try advanceAfter { try ?!$0.value?.string }
    }
    public mutating func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
      let result = try reader.rethrow(chip: .index(currentIndex)) { try reader
        .make(anyCodable: ?!reader.anyCodable.list?[currentIndex], chip: .index(currentIndex))
        .read(type)
      }
      currentIndex += 1
      return result
    }
    public mutating func nestedContainer<NestedKey>(
      keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey>
    where NestedKey : CodingKey {
      let result = try reader.rethrow(what: "not a list") { try reader
        .make(anyCodable: ?!reader.anyCodable.list?[currentIndex], chip: .index(currentIndex))
        .container(keyedBy: type)
      }
      currentIndex += 1
      return result
    }
    public mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
      let result = try reader.rethrow(what: "not a list") { try reader
        .make(anyCodable: ?!reader.anyCodable.list?[currentIndex], chip: .index(currentIndex))
        .unkeyedContainer()
      }
      currentIndex += 1
      return result
    }
    public mutating func superDecoder() throws -> Decoder { throw Thrown("supper not supported") }
    private mutating func advanceAfter<T>(make: Try.Of<AnyCodable>.Do<T>) throws -> T {
      let list = try reader.rethrow(what: "not a list") {
        try ?!reader.anyCodable.list?[currentIndex]
      }
      let result = try reader.rethrow(chip: .index(currentIndex)) {
        try make(list)
      }
      currentIndex += 1
      return result
    }
  }
}
