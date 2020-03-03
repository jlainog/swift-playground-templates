
public func first<A, B, C>(
    _ a2c: @escaping (A) -> C
) -> ((A, B)) -> (C, B) {
    return { ab in
        (a2c(ab.0), ab.1)
    }
}

public func second<A, B, C>(
    _ b2c: @escaping (B) -> C
) -> ((A, B)) -> (A, C) {
    return { ab in
        (ab.0, b2c(ab.1))
    }
}

public func first<A, B>(_ x: (A, B)) -> A {
    return x.0
}

public func second<A, B>(_ x: (A, B)) -> B {
    return x.1
}
