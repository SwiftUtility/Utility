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
      try dialect[type].get(type.init(from:))(self)
    }
    static func make(dialect: Dialect, anyCodable: AnyCodable) -> Self {
      .init(anyCodable: anyCodable, codingPath: [], dialect: dialect)
    }
    func make(anyCodable: AnyCodable, chip: Chip? = nil) -> Reader { .init(
      anyCodable: anyCodable,
      codingPath: codingPath + chip.array,
      dialect: dialect
    )}
    func rethrow<T>(
      what: String = "\(T.self) not decoded",
      chip: Chip = .hash(""),
      make: Try.Do<T>
    ) throws -> T {
      let path = (codingPath + chip.stringValue.isEmpty.else([chip]).get([]))
        .map { $0.intValue.map(\.description).get($0.stringValue) }
        .joined(separator: ".")
      do { return try make() } catch { throw Thrown("\(path): \(what)") }
    }
  }
}
