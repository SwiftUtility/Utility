import Foundation

extension Collection {
  mutating func mutate<T>(as _: T.Type = T.self, _ mutate: (inout Self) -> T) -> T { mutate(&self) }
}
