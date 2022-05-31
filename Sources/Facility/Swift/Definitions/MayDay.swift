/// An error to be handled via sideEffect
public final class MayDay: Error, CustomStringConvertible {
  public let what: String
  public let file: StaticString
  public let line: UInt
  public init(_ what: String = "", file: StaticString = #fileID, line: UInt = #line) {
    self.what = what
    self.file = file
    self.line = line
    Self.sideEffect(self)
  }
  public var description: String {
    what
  }
  public static func assert(
    _ condition: @autoclosure Act.Do<Bool>,
    _ what: @autoclosure Act.Do<String> = "",
    file: StaticString = #fileID,
    line: UInt = #line
  ) {
    guard !condition() else { return }
    sideEffect(.init(what(), file: file, line: line))
  }
  public static func report(
    _ what: @autoclosure Act.Do<String> = "",
    file: StaticString = #fileID,
    line: UInt = #line
  ) {
    sideEffect(.init(what(), file: file, line: line))
  }
  /// Action to perform when MayDay is instantiated
  /// ```
  /// MayDay.sideEffect = { mayDay in
  ///   #if DEBUG
  ///   assertionFailure(mayDay.what, file: mayDay.file, line: mayDay.line)
  ///   #else
  ///   Crashlytics.crashlytics().record(error: "\(mayDay.file):\(mayDay.line) \(mayDay.what)")
  ///   #endif
  /// }
  /// ```
  /// - Warning: Race condition candidate. Change it once when application starts.
  public static var sideEffect: Act.Of<MayDay>.Go = { mayDay in
    assertionFailure(mayDay.what, file: mayDay.file, line: mayDay.line)
  }
}
