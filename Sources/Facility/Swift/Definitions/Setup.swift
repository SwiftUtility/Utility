import Foundation
public final class SideEffects {
  let reportMayDay: Act.Of<MayDay>.Go
  let printDebug: Act.Of<String>.Go
  init() {
    self.reportMayDay = Self.reportMayDay
    self.printDebug = Self.printDebug
  }
  static public var reportMayDay: Act.Of<MayDay>.Go = { mayDay in
    assertionFailure(mayDay.what, file: mayDay.file, line: mayDay.line)
  }
  static public var printDebug: Act.Of<String>.Go = { print($0) }
  static let shared: SideEffects = .init()
}
