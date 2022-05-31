extension RangeReplaceableCollection where Self: BidirectionalCollection {
  public var end: Element {
    get { self[index(before: endIndex)] }
    set { replaceSubrange(index(before: endIndex)..<endIndex, with: [newValue]) }
  }
  public func mapEmpty(_ make: @autoclosure Try.Do<Element>) rethrows -> Self {
    try isEmpty.then(Self([make()])).or(self)
  }
  public func mapEmpty(make: Try.Do<Element>) rethrows -> Self {
    try isEmpty.then(Self([make()])).or(self)
  }
  public func flatMapEmpty(_ make: @autoclosure Try.Do<Self>) rethrows -> Self {
    try isEmpty.then(make()).or(self)
  }
  public func flatMapEmpty(make: Try.Do<Self>) rethrows -> Self {
    try isEmpty.then(make()).or(self)
  }
}
