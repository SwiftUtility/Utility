extension Bool {
  public var not: Self { !self }
  public func and(other: Self) -> Self { self && other }
  public func or(other: Self) -> Self { self || other }
  public func xor(other: Self) -> Self { self != other }
  public func then<T>(_ make: @autoclosure Try.Do<T>) rethrows -> T? {
    guard self else { return nil }
    return try make()
  }
  public func then<T>(make: Try.Do<T>) rethrows -> T? {
    guard self else { return nil }
    return try make()
  }
  public func `else`<T>(_ make: @autoclosure Try.Do<T>) rethrows -> T? {
    guard !self else { return nil }
    return try make()
  }
  public func `else`<T>(make: Try.Do<T>) rethrows -> T? {
    guard !self else { return nil }
    return try make()
  }
}
