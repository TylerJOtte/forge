# ``Forge/Environment``

<!--@START_MENU_TOKEN@-->Summary<!--@END_MENU_TOKEN@-->

## Overview

An `Environment` is one of the <doc:TheFourPillars> that comprise
<doc:Forge>'s primary architecture. It is an overall structure in which 
<doc:Components> reside or operate. It can be asribed its own <doc:Features>,
and apply <doc:Mechanics> to regulate its conditions. All ecosystems, worlds,
locales, etc. extend from it.

![Environment](Environment.svg)

### Example

```swift
// Environment
struct Expanse: Space {
    
    // Components
    let spaceship = Spaceship(name: "Rocinante")
    let captain = Captain(name: "Jim Gordon")

    // Features
    let color = Color.black
    let temperature = Temperature.freezing

    // Mechanics
    let ftlTravel = FTLRule.requiresProtomolecule
}
```
## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
