
public func zurry<A>(
    _ f: () -> A
) -> A {
    return f()
}

public func unzurry<A>(
    _ value: @autoclosure @escaping () -> A
) -> () -> A {
    return value
}

public func unzurry<A>(
    _ value: @autoclosure @escaping () throws -> A
) -> () throws -> A {
    return value
}
