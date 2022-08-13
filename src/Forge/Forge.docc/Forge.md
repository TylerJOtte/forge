# ``Forge``

Create game elements for your apps.

## Overview

Forge provides game objects for building or extending your app's infrastructure.
You can forge ``Element``s from the "Four Pillars" to manage game interactivity,
and/or construct an entire ecosystem.

#### Example

Forge ``Cards`` for a game.

```swift
import Forge

struct Game {
    
    // Forge Elements
    var deck = Deck()
    var hand = Hand()
    
    func start() {
        
        // Manage game interactivity
        deck.deal(cards: 5, to: hand)
    }
}
```

## Topics

### Base

- ``Element``

### The Four Pillars

- <doc:Components>
- <doc:Environments>
- <doc:Features>
- <doc:Mechanics>
- <doc:System>
