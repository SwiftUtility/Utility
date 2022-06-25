import Foundation
public enum Lossy<Value> {
  case value(Value)
  case error(Error)
  public init(_ value: @autoclosure Try.Do<Value>) {
    do { self = try .value(value()) } catch { self = .error(error) }
  }
  public init(file: StaticString = #fileID, line: UInt = #line) {
    self = .error(Thrown(file: file, line: line))
  }
  public static func make(_ perform: Try.Do<Value>) -> Self {
    do { return try .value(perform()) } catch { return .error(error) }
  }
  public var result: Result<Value, Error> {
    switch self {
    case .value(let value): return .success(value)
    case .error(let error): return .failure(error)
    }
  }
  public func map<T>(_ transform: Try.Of<Value>.Do<T>) -> Lossy<T> {
    switch self {
    case .value(let value):
      do { return try .value(transform(value)) } catch { return .error(error) }
    case .error(let error): return .error(error)
    }
  }
  public func mapError(_ transform: Try.Of<Error>.Do<Value>) -> Self {
    guard case .error(let error) = self else { return self }
    do { return try .value(transform(error)) } catch { return .error(error) }
  }
  public func reduceError<T>(
    _ seed: @autoclosure Try.Do<T>,
    _ transform: Try.Of<T>.Of<Error>.Do<Value>
  ) -> Self {
    guard case .error(let error) = self else { return self }
    do { return try .value(transform(seed(), error)) } catch { return .error(error) }
  }
  public func flatMap<T>(_ transform: Try.Of<Value>.Do<Lossy<T>>) -> Lossy<T> {
    switch self {
    case .value(let value):
      do { return try transform(value) } catch { return .error(error) }
    case .error(let error): return .error(error)
    }
  }
  public func flatMapError(_ transform: Try.Of<Error>.Do<Lossy<Value>>) -> Self {
    guard case .error(let error) = self else { return self }
    do { return try transform(error) } catch { return .error(error) }
  }
  public func reduce<T, U>(
    _ seed: @autoclosure Try.Do<T>,
    _ transform: Try.Of<T>.Of<Value>.Do<U>
  ) -> Lossy<U> {
    switch self {
    case .value(let value):
      do { return try .value(transform(seed(), value)) } catch { return .error(error) }
    case .error(let error): return .error(error)
    }
  }
  public func flatReduce<T, U>(
    _ seed: @autoclosure Try.Do<T>,
    _ transform: Try.Of<T>.Of<Value>.Do<Lossy<U>>
  ) -> Lossy<U> {
    switch self {
    case .value(let value):
      do { return try .value(transform(seed(), value).get()) } catch { return .error(error) }
    case .error(let error): return .error(error)
    }
  }
  public func reduce<T, U>(
    invert seed: @autoclosure Try.Do<T>,
    _ transform: Try.Of<Value>.Of<T>.Do<U>
  ) -> Lossy<U> {
    switch self {
    case .value(let value):
      do { return try .value(transform(value, seed())) } catch { return .error(error) }
    case .error(let error): return .error(error)
    }
  }
  public func flatReduce<T, U>(
    invert seed: @autoclosure Try.Do<T>,
    _ transform: Try.Of<Value>.Of<T>.Do<Lossy<U>>
  ) -> Lossy<U> {
    switch self {
    case .value(let value):
      do { return try .value(transform(value, seed()).get()) } catch { return .error(error) }
    case .error(let error): return .error(error)
    }
  }
  public func reduce<T, U>(
    curry seed: @autoclosure Try.Do<T>,
    _ transform: Try.By<Value>.Of<T>.Do<U>
  ) -> Lossy<U> {
    switch self {
    case .value(let value):
      do { return try .value(transform(value)(seed())) } catch { return .error(error) }
    case .error(let error): return .error(error)
    }
  }
  public func flatReduce<T, U>(
    curry seed: @autoclosure Try.Do<T>,
    _ transform: Try.By<Value>.Of<T>.Do<Lossy<U>>
  ) -> Lossy<U> {
    switch self {
    case .value(let value):
      do { return try .value(transform(value)(seed()).get()) } catch { return .error(error) }
    case .error(let error): return .error(error)
    }
  }
  public func get() throws -> Value {
    switch self {
    case .value(let value): return value
    case .error(let error): throw error
    }
  }
  public func flatten<T>() -> Lossy<T> where Value == Lossy<T> {
    switch self {
    case .value(let value): return value
    case .error(let error): return .error(error)
    }
  }
}
extension Lossy: CustomDebugStringConvertible {
  public var debugDescription: String {
    switch self {
    case .value(let value): return "Lossy<\(Value.self)>.value(\(String(reflecting: value)))"
    case .error(let error): return "Lossy<\(Value.self)>.error(\(String(reflecting: error)))"
    }
  }
}
