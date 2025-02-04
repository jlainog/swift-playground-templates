
public func curry<A, B, C>(
    _ f: @escaping (A, B) -> C
) -> (A) -> (B) -> C {
    return { a in { b in f(a, b) } }
}

public func uncurry<A, B, C>(
    _ f: @escaping (A) -> (B) -> C
) -> (A, B) -> C {
    return { a, b in f(a)(b) }
}
