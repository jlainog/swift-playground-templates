import Foundation

public func get<Root, Value>(
    _ keyPath: KeyPath<Root, Value>
) -> (Root) -> Value {
    return { root in
        root[keyPath: keyPath]
    }
}

public func prop<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>
)
    -> (@escaping (Value) -> Value)
    -> (Root) -> Root {
        
        return { update in
            { root in
                var copy = root
                copy[keyPath: keyPath] = update(copy[keyPath: keyPath])
                return copy
            }
        }
}

public func over<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>,
    _ update: (@escaping (Value) -> Value)
) -> (Root) -> Root {
    return update |> prop(keyPath)
}

public func set<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>,
    _ value: Value
) -> (Root) -> Root {
    return value |> prop(keyPath) <<< const
}

public func set<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>
) -> (Value) -> (Root) -> Root {
    return prop(keyPath) <<< const
}

// MARK: Mutation

public func mprop<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>
)
    -> (@escaping (inout Value) -> Void)
    -> (inout Root) -> Void {
        
        return { update in
            { root in
                update(&root[keyPath: keyPath])
            }
        }
}

public func mprop<Root, Value>(
    _ keyPath: ReferenceWritableKeyPath<Root, Value>
)
    -> (@escaping (inout Value) -> Void)
    -> (Root) -> Void {
        return { update in
            { root in
                update(&root[keyPath: keyPath])
            }
        }
}

public func mprop<Root, Value>(
    _ keyPath: ReferenceWritableKeyPath<Root, Value>
)
    -> (@escaping (Value) -> Void)
    -> (Root) -> Void {
        return { update in
            { root in
                update(root[keyPath: keyPath])
            }
        }
}

public func mver<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>,
    _ update: @escaping (inout Value) -> Void
)
    -> (inout Root) -> Void {
        return mprop(keyPath)(update)
}

public func mver<Root, Value>(
    _ keyPath: ReferenceWritableKeyPath<Root, Value>,
    _ update: @escaping (Value) -> Void
)
    -> (Root) -> Void {
        return mprop(keyPath)(update)
}

public func mver<Root, Value>(
    _ keyPath: ReferenceWritableKeyPath<Root, Value>,
    _ update: @escaping (inout Value) -> Void
)
    -> (Root) -> Void {
        return mprop(keyPath)(update)
}

public func mut<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>,
    _ value: Value
)
    -> (inout Root) -> Void {
        return mver(keyPath) { $0 = value }
}

public func mut<Root, Value>(
    _ keyPath: ReferenceWritableKeyPath<Root, Value>,
    _ value: Value
)
    -> (Root) -> Void {
        return mver(keyPath) { $0 = value }
}

// MARK: Operator

prefix operator ^

extension KeyPath {
    public static prefix func ^ (kp: KeyPath) -> (Root) -> Value {
        return get(kp)
    }
}

extension WritableKeyPath {
    public static prefix func ^ (kp: WritableKeyPath)
        -> (@escaping (Value) -> Value)
        -> (Root) -> Root {
            return prop(kp)
    }
    
    public static prefix func ^ (kp: WritableKeyPath)
        -> (@escaping (inout Value) -> Void)
        -> (inout Root) -> Void {
            return mprop(kp)
    }
}

extension ReferenceWritableKeyPath where Root: AnyObject {
    public static prefix func ^ (kp: ReferenceWritableKeyPath)
        -> (@escaping (inout Value) -> Void)
        -> (Root) -> Void {
            return mprop(kp)
    }
}
