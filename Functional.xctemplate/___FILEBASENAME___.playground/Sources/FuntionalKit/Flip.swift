
public func flip<A, B>(
    _ f: @escaping (A) -> () -> B
) -> () -> (A) -> B {
    return { { a in f(a)() } }
}

public func flip<A,B,C>(
    _ f: @escaping (A) -> (B) -> C
) -> (B) -> (A) -> C {
    return { b in { a in f(a)(b) } }
}
