public struct Id<Value> {
  private var value: Value
  public init(_ value: Value) { self.value = value }
  public static func make(_ value: Value) -> Self { .init(value) }
  public func map<T>(_ call: Try.Of<Value>.Do<T>) rethrows -> Id<T> {
    try .init(call(value))
  }
  public func flatMap<T>(_ call: Try.Of<Value>.Do<Id<T>>) rethrows -> Id<T> {
    try call(value)
  }
  public func reduce<T, U>(_ seed: T, _ call: Try.Of<T>.Of<Value>.Do<U>) rethrows -> Id<U> {
    try .init(call(seed, value))
  }
  public func reduce<T, U>(invert seed: T, _ call: Try.Of<Value>.Of<T>.Do<U>) rethrows -> Id<U> {
    try .init(call(value, seed))
  }
  public func reduce<T, U>(curry seed: T, _ call: Act.By<Value>.Of<T>.Do<U>) -> Id<U> {
    .init(call(value)(seed))
  }
  public func reduce<T, U>(tryCurry seed: T, _ call: Try.By<Value>.Of<T>.Do<U>) throws -> Id<U> {
    try .init(call(value)(seed))
  }
  public func get() -> Value { value }
}
extension Id: CustomDebugStringConvertible {
  public var debugDescription: String { return "Id(\(String(reflecting: value)))" }
}
