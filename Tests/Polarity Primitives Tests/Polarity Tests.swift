// Polarity Tests.swift

import Pair_Primitives
import Polarity_Primitives_Test_Support
import Testing

@Suite
struct `Polarity Tests` {
    @Suite struct Unit {}
}

// MARK: - Unit

extension `Polarity Tests`.Unit {

    @Test
    func `Polarity Value typealias resolves through Pair_Primitives`() {
        let value: Polarity.Value<Int> = Pair(.positive, 4)
        #expect(value.first == .positive)
        #expect(value.second == 4)
    }
}
