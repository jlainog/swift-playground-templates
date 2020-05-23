
public func map<A,B>(
    _ f: @escaping (A) -> B
) -> ([A]) -> [B] {
    return { $0.map(f) }
}

public func map<A,B>(
    _ f: @escaping (A) -> B
) -> (A?) -> B? {
    return { $0.map(f) }
}

public func filter<A>(
    _ f: @escaping (A) -> Bool
) -> ([A]) -> [A] {
    return { $0.filter(f) }
}

public func mutEach<A>(
    _ f: @escaping (inout A) -> Void
) -> (inout [A]) -> Void {
    return { array in
        for index in array.indices {
            f(&array[index])
        }
    }
}
