# Polarity Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

`Polarity` — a three-valued positive/negative/neutral sign primitive for Swift, where neutral is distinct from zero magnitude.

---

## Quick Start

`Polarity` classifies a value as `.positive`, `.negative`, or `.neutral`. Unlike a two-valued sign, neutral is a first-class case — "uncharged" is not "zero magnitude" — so physics and electrical contexts (electric charge, magnetic poles, electrode designation) can model the absence of polarity honestly. `opposite` swaps positive and negative while leaving neutral fixed.

```swift
import Polarity_Primitives

let charge: Polarity = .positive

print(charge.opposite)    // negative
print(charge.isCharged)   // true
print((!charge))          // negative — prefix ! is opposite
print(Polarity.neutral.opposite)  // neutral — neutral is its own opposite
```

`Polarity.Value<Payload>` pairs a polarity with a payload, so a measurement can travel with its sign as one value:

```swift
import Pair_Primitives
import Polarity_Primitives

// A charge magnitude tagged with its polarity.
let reading: Polarity.Value<Double> = Pair(.negative, 1.6e-19)

print(reading.first)   // negative
print(reading.second)  // 1.6e-19
```

`Polarity` is `Hashable`, `CaseIterable`, `Sendable`, and (outside Embedded) `Codable`, and exposes `isCharged`, `isPositive`, `isNegative`, and `isNeutral` for case queries.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-polarity-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Polarity Primitives", package: "swift-polarity-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. Depends only on the `Pair` primitive, which it re-exports for `Polarity.Value`.

| Product | Target | Purpose |
|---------|--------|---------|
| `Polarity Primitives` | `Sources/Polarity Primitives/` | The `Polarity` enum (`.positive` / `.negative` / `.neutral`), `opposite` and the prefix `!` operator, the `isCharged` / `isPositive` / `isNegative` / `isNeutral` queries, and the `Polarity.Value<Payload>` tagged-pair typealias. |
| `Polarity Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
