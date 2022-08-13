# ``Forge``

Create game elements for your apps.

## Overview

Forge provides game objects for building or extending your app's infrastructure.
You can forge ``Element``s from the <doc:TheFourPillars> to manage game activity,
or construct an entire ecosystem.

#### Example

Forge ``Cards`` for a game.

```swift
import Forge

struct Game {
    
    // Forge Elements
    var deck = Deck()
    var hand = Hand()
    
    func start() {
        
        // Manage game activity
        deck.deal(cards: 5, to: hand)
    }
}
```

## Topics

### Essentials

- ``Element``
- <doc:TheFourPillars>
