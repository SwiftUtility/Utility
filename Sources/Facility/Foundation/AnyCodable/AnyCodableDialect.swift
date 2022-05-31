import Foundation
extension AnyCodable {
  public struct Dialect {
    private var map: [ObjectIdentifier: Any] = [:]
    public subscript<T>(_ meta: T.Type = T.self) -> Try.Of<Decoder>.Do<T>? {
      get { map[.init(meta as Any.Type)] as? Try.Of<Decoder>.Do<T> }
      set { map[.init(meta as Any.Type)] = newValue }
    }
    public static var empty: Self { return .init() }
    public static var json: Self {
      var this = Self()
      this[URL.self] = { decoder in
        try Thrown.rethrow("not URL") {
          try ?!URL(string: decoder.singleValueContainer().decode(String.self))
        }
      }
      this[Data.self] = { decoder in
        try Thrown.rethrow("not Data") {
          try ?!Data(base64Encoded: decoder.singleValueContainer().decode(String.self))
        }
      }
      this[Date.self] = { decoder in
        try Thrown.rethrow("not Date") {
          try Date(timeIntervalSince1970: decoder.singleValueContainer().decode(Double.self))
        }
      }
      return this
    }
    public func read<T>(_ value: T.Type, from anyCodable: AnyCodable) throws -> T
    where T: Decodable { try Reader
      .make(dialect: self, anyCodable: anyCodable)
      .read(value)
    }
  }
}
