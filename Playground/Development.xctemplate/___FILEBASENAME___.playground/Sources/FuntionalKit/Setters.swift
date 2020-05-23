import Foundation

public typealias Setter<S, T, A, B> = (@escaping (A) -> B) -> (S) -> T

public func over<S, T, A, B>(
    _ setter: Setter<S, T, A, B>,
    _ set: @escaping (A) -> B
) -> (S) -> T {
    return setter(set)
}

public func set<S, T, A, B>(
    _ setter: Setter<S, T, A, B>,
    _ value: B
) -> (S) -> T {
    return over(setter, const(value))
}

public func <><S, A>(
    _ f: @escaping Setter<S, S, A, A>,
    _ g: @escaping Setter<S, S, A, A>
) -> Setter<S, S, A, A> {
    return { update in
        return { source in
            let f = over(f, update)
            let g = over(g, update)
            return g(f(source))
        }
    }
}

// MARK: Mutation

public typealias MutableSetter<S, A> = (@escaping (inout A) -> Void) -> (inout S) -> Void

public func mver<S, A>(
    _ setter: MutableSetter<S, A>,
    _ set: @escaping (inout A) -> Void
) -> (inout S) -> Void {
    return setter(set)
}

public func mut<S, A>(
    _ setter: MutableSetter<S, A>,
    _ value: A
) -> (inout S) -> Void {
    return mver(setter) { $0 = value }
}
