public enum Try {
  public typealias Go = () throws -> Void
  public typealias Do<T1> = () throws -> T1
  public enum Of<T1> {
    public typealias Go = (T1) throws -> Void
    public typealias Do<T2> = (T1) throws -> T2
    public enum Of<T2> {
      public typealias Go = (T1, T2) throws -> Void
      public typealias Do<T3> = (T1, T2) throws -> T3
    }
  }
  public enum In<T1> {
    public typealias Go = (inout T1) throws -> Void
    public typealias Do<T2> = (inout T1) throws -> T2
    public enum Of<T2> {
      public typealias Go = (inout T1, T2) throws -> Void
      public typealias Do<T3> = (inout T1, T2) throws -> T3
    }
  }
  public enum By<T1> {
    public typealias Go = (T1) -> () throws -> Void
    public typealias Do<T2> = (T1) -> () throws -> T2
    public enum Of<T2> {
      public typealias Go = (T1) -> (T2) throws -> Void
      public typealias Do<T3> = (T1) -> (T2) throws -> T3
      public enum Of<T3> {
        public typealias Go = (T1) -> (T2, T3) throws -> Void
        public typealias Do<T4> = (T1) -> (T2, T3) throws -> T4
      }
    }
    public enum In<T2> {
      public typealias Go = (T1) -> (inout T2) throws -> Void
      public typealias Do<T3> = (T1) -> (inout T2) throws -> T3
      public enum Of<T3> {
        public typealias Go = (T1) -> (inout T2, T3) throws -> Void
        public typealias Do<T4> = (T1) -> (inout T2, T3) throws -> T4
      }
    }
  }
  public typealias Reply<T: Query> = (T) throws -> T.Reply
}
