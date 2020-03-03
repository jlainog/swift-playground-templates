
public func const<A, B>(
    _ a: A
) -> (B) -> A {
    return { _ in a }
}

public func absurd<A>(_ never: Never) -> A {}

public func id<A>(_ a: A) -> A { a }

public func |> <A,B>(_ a: A, _ f: (A) -> B) -> B { f(a) }

public func |> <A,B>(_ a: inout A, _ f: (inout A) -> B) -> B { f(&a) }

public func |> <A>(_ a: A, _ f: (inout A) -> Void) -> A {
    var a = a
    f(&a)
    return a
}

public func <><A>(
    _ f: @escaping (A) -> A,
    _ g: @escaping (A) -> A
) -> (A) -> A {
    return { a in g(f(a)) }
}

public func <><A>(
    _ f: @escaping (inout A) -> Void,
    _ g: @escaping (inout A) -> Void
) -> (inout A) -> Void {
    return { a in
        f(&a)
        g(&a)
    }
}

public func <><A: AnyObject>(
    _ f: @escaping (A) -> Void,
    _ g: @escaping (A) -> Void
) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}

public func <><S, A>(
    _ f: @escaping (A) -> (S) -> S,
    _ g: @escaping (A) -> (S) -> S
) -> (A) -> (S) -> S {
    return { value in
        return { source in
            let f = value |> f
            let g = value |> g
            return g(f(source))
        }
    }
}

public func >>><A, B, C>(
    _ a2b: @escaping (A) -> B,
    _ b2c: @escaping (B) -> C
) -> (A) -> C {
    return { a in b2c(a2b(a)) }
}

public func <<<<A, B, C>(
    _ b2c: @escaping (B) -> C,
    _ a2b: @escaping (A) -> B
) -> (A) -> C {
    return { a in b2c(a2b(a)) }
}
