# ``Forge/Mechanic``

<!--@START_MENU_TOKEN@-->Summary<!--@END_MENU_TOKEN@-->

## Overview

A ``Mechanic`` is one of the <doc:TheFourPillars> that comprise
<doc:Forge>'s primary architecture. It is a guideline or principle that
regulates <doc:Environments> and <doc:Components>, and may have <doc:Features>
ascribed to it. All rules, directions, procedures, etc. extend from it.

![Mechanic](Mechanic.svg)

### Example

```swift
// Environment
class CardGame: Game {
    
    // Component
    let deck: PlayingCardDeck
    let hand: Hand

    // Regulate Environment
    let rules = [
        PlayingCardRule.aceIsHigh, 
        PlayingCardRule.jokersAllowed
    ]

    init() {
        
        // Regulate Component
        self.deck = Deck(rules: rules)
    }
}
```
