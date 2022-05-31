public enum Act {
  public typealias Go = () -> Void
  public typealias Do<T1> = () -> T1
  public enum Of<T1> {
    public typealias Go = (T1) -> Void
    public typealias Do<T2> = (T1) -> T2
    public enum Of<T2> {
      public typealias Go = (T1, T2) -> Void
      public typealias Do<T3> = (T1, T2) -> T3
    }
  }
  public enum In<T1> {
    public typealias Go = (inout T1) -> Void
    public typealias Do<T2> = (inout T1) -> T2
    public enum Of<T2> {
      public typealias Go = (inout T1, T2) -> Void
      public typealias Do<T3> = (inout T1, T2) -> T3
    }
  }
  public enum By<T1> {
    public typealias Go = (T1) -> () -> Void
    public typealias Do<T2> = (T1) -> () -> T2
    public enum Of<T2> {
      public typealias Go = (T1) -> (T2) -> Void
      public typealias Do<T3> = (T1) -> (T2) -> T3
      public enum Of<T3> {
        public typealias Go = (T1) -> (T2, T3) -> Void
        public typealias Do<T4> = (T1) -> (T2, T3) -> T4
      }
    }
    public enum In<T2> {
      public typealias Go = (T1) -> (inout T2) -> Void
      public typealias Do<T3> = (T1) -> (inout T2) -> T3
      public enum Of<T3> {
        public typealias Go = (T1) -> (inout T2, T3) -> Void
        public typealias Do<T4> = (T1) -> (inout T2, T3) -> T4
      }
    }
  }
  public typealias Reply<T: Query> = (T) -> T.Reply
}
