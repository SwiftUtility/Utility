import Foundation
extension AnyCodable {
  public struct Reader: Decoder {
    public let anyCodable: AnyCodable
    public let codingPath: [CodingKey]
    private let dialect: Dialect
    public var userInfo: [CodingUserInfoKey : Any] { [:] }
    public func singleValueContainer() throws -> SingleValueDecodingContainer {
      ValueDecoder(reader: self)
    }
    public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
      ListDecoder(reader: self)
    }
    public func container<Key>(
      keyedBy type: Key.Type
    ) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
      .init(MapDecoder(reader: self))
    }
    public func read<T>(_ type: T.Type) throws -> T where T : Decodable {
      try dialect[type].or(type.init(from:))(self)
    }
    static func make(dialect: Dialect, anyCodable: AnyCodable) -> Self {
      .init(anyCodable: anyCodable, codingPath: [], dialect: dialect)
    }
    func make(anyCodable: AnyCodable, chip: Chip? = nil) -> Reader { .init(
      anyCodable: anyCodable,
      codingPath: codingPath + chip.makeArray(),
      dialect: dialect
    )}
    func rethrow<T>(
      what: String = "\(T.self) not decoded",
      chip: Chip = .hash(""),
      make: Try.Do<T>
    ) throws -> T {
      let path = (codingPath + chip.stringValue.isEmpty.else([chip]).or([]))
        .map { $0.intValue.map(\.description).or($0.stringValue) }
        .joined(separator: ".")
      return try Thrown.rethrow("\(path): \(what)", make: make)
    }
  }
}
