# ``Forge/Component``

## Overview

A `Component` is one of the <doc:TheFourPillars> that comprise <doc:Forge>'s
primary architecture. It is a unit that resides in <doc:Environments>, and 
operates them or other `Components`. It can be ascribed its own <doc:Features>,
and apply <doc:Mechanics> to regulate its conditions. All beings, <doc:Tools>, 
<doc:Technologies>, etc. extend from it.

![Component](Component.svg)

### Example

```swift
// Environment
class CardGame: Game {
    
    // Component
    let card: PlayingCard

    init() {
        
        // Feature
        let suit = Suit.hearts

        // Mechanic
        let isHigh = AceRule.isHigh

        self.card = Ace(of: suit, and: isHigh)
    }
}
```
