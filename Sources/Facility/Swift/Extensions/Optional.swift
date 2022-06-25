import Foundation
extension Optional {
  public func get(_ make: @autoclosure Try.Do<Wrapped>) rethrows -> Wrapped {
    try self ?? make()
  }
  public func get(make: Try.Do<Wrapped>) rethrows -> Wrapped {
    try self ?? make()
  }
  public func mapNil(_ make: @autoclosure Try.Do<Wrapped>) rethrows -> Optional {
    try self ?? make()
  }
  public func mapNil(make: Try.Do<Wrapped>) rethrows -> Optional {
    try self ?? make()
  }
  public func flatMapNil(_ make: @autoclosure Try.Do<Optional>) rethrows -> Optional {
    try self ?? make()
  }
  public func flatMapNil(make: Try.Do<Optional>) rethrows -> Optional {
    try self ?? make()
  }
  public func filter(isIncluded: Try.Of<Wrapped>.Do<Bool>) rethrows -> Optional {
    if let wrapped = self { return try isIncluded(wrapped) ? wrapped : nil } else { return nil }
  }
  public func reduce<T, U>(
    _ seed: @autoclosure Try.Do<T>,
    _ transform: Try.Of<T>.Of<Wrapped>.Do<U>
  ) rethrows -> U? {
    if let value = self { return try transform(seed(), value) } else { return nil }
  }
  public func reduce<T, U>(
    invert seed: @autoclosure Try.Do<T>,
    _ transform: Try.Of<Wrapped>.Of<T>.Do<U>
  ) rethrows -> U? {
    if let value = self { return try transform(value, seed()) } else { return nil }
  }
  public func reduce<T, U>(
    curry seed: @autoclosure Try.Do<T>,
    _ transform: Act.By<Wrapped>.Of<T>.Do<U>
  ) rethrows -> U? {
    if let value = self { return try transform(value)(seed()) } else { return nil }
  }
  public func reduce<T, U>(
    tryCurry seed: @autoclosure Try.Do<T>,
    _ transform: Try.By<Wrapped>.Of<T>.Do<U>
  ) throws -> U? {
    if let value = self { return try transform(value)(seed()) } else { return nil }
  }
  public var array: [Wrapped] {
    if let wrapped = self { return [wrapped] } else { return [] }
  }
  public static func get(or error: Error, value: Self) throws -> Wrapped {
    if let value = value { return value } else { throw error }
  }
  public static prefix func ?! (value: Self) throws -> Wrapped {
    if let value = value { return value } else { throw Thrown() }
  }
}
