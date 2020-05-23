
precedencegroup ForwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication
    lowerThan: CastingPrecedence
}

precedencegroup SingleTypeComposition {
    associativity: left
    higherThan: ForwardComposition
    lowerThan: CastingPrecedence
}

precedencegroup BackwardsComposition {
    associativity: right
    higherThan: SingleTypeComposition
}
