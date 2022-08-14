# The Four Pillars

The primary ``Element``s.

## Overview

There are four primary ``Element``s in Forge that comprise its architecture. 
All modules extend from one of these ``Element``s.

![The Four Pillars](TheFourPillars.svg)

#### Example

```swift
class PlayingCard {
    ...
    // Features
    let rank: Rank
    let suit: Suit
    ...
}
```

## Topics

### Pillars

- <doc:Components>
- <doc:Environments>
- <doc:Features>
- <doc:Mechanics>
