# The Four Pillars

The primary ``Element``s.

## Overview

There are four primary ``Element``s in Forge that comprise its architecture. 
All modules extend from one of these ``Element``s.

![The Four Pillars](TheFourPillars.svg)

#### Relationships

- <doc:Environments> contain <doc:Components>
- <doc:Features> ascribe <doc:Environments> and <doc:Components>
- <doc:Mechanics> guide <doc:Environments> and <doc:Components>

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

### Elements

- <doc:Components>
- <doc:Environments>
- <doc:Features>
- <doc:Mechanics>
