public import Pair_Primitives

public enum Polarity: Sendable, Hashable, CaseIterable {

    case positive

    case negative

    case neutral
}

extension Polarity {

    @inlinable
    public static func opposite(of polarity: Polarity) -> Polarity {
        switch polarity {
        case .positive: return .negative
        case .negative: return .positive
        case .neutral: return .neutral
        }
    }

    @inlinable
    public var opposite: Polarity {
        Self.opposite(of: self)
    }

    @inlinable
    public static prefix func ! (value: Polarity) -> Polarity {
        value.opposite
    }
}

extension Polarity {

    @inlinable
    public var isCharged: Bool { self != .neutral }

    @inlinable
    public var isPositive: Bool { self == .positive }

    @inlinable
    public var isNegative: Bool { self == .negative }

    @inlinable
    public var isNeutral: Bool { self == .neutral }
}

extension Polarity {

    public typealias Value<Payload> = Pair<Polarity, Payload>
}

#if !hasFeature(Embedded)
    extension Polarity: Codable {}
#endif
