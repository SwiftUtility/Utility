import Foundation
extension AnyCodable {
  public struct Notation {
    private var map: [ObjectIdentifier: Any] = [:]
    public subscript<T>(_ meta: T.Type = T.self) -> Try.By<T>.Of<Encoder>.Go? {
      get { map[.init(meta as Any.Type)] as? Try.By<T>.Of<Encoder>.Go }
      set { map[.init(meta as Any.Type)] = newValue }
    }
    public static var empty: Self { .init() }
    public static var json: Self {
      var this = Self()
      this[URL.self] = { value in value.absoluteString.encode(to:) }
      this[Data.self] = { value in value.base64EncodedString().encode(to:) }
      this[Date.self] = { value in value.timeIntervalSince1970.encode(to:) }
      return this
    }
    public func write(_ value: Encodable) throws -> AnyCodable {
      try Writer.write(value, notation: self)
    }
  }
}
