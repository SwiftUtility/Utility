import Foundation
extension AnyCodable {
  enum Chip: CodingKey {
    case index(Int)
    case hash(String)
    init?(stringValue: String) { self = .hash(stringValue) }
    init?(intValue: Int) { self = .index(intValue) }
    var intValue: Int? { if case .index(let value) = self { return value } else { return nil } }
    var stringValue: String {
      switch self {
      case .index(let value): return "\(value)"
      case .hash(let value): return value
      }
    }
  }
}
