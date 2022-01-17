//=============================================================================//
//                                                                             //
//  PlayingCardDeck.swift                                                      //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/03/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//

import Foundation
import SwiftUI

/// A standard French-suited `Deck` of `PlayingCard`s.
public class PlayingCardDeck: Deck<PlayingCard> {

    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//

    /// True if `Joker`s allowed, else false.
    public let jokersAllowed: Bool

    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//

    // TODO: Add unit tests for constructor below

    /// Creates a standard French-suited`PlayingCardDeck` along with `Joker`s, if allowed.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Deck` can hold 0-54 `PlayingCard`s if `Jokers` allowed, else 0-52.
    ///   - The `Deck` contains a `PlayingCard` for each standard `PlayingCard Rank` &
    ///    `Suit` along with `Jokers`s if allowed.
    ///   - The `Deck`'s title is set to "Playing Card Deck".
    ///   - `jokersAllowed` is set to the given `Joker`s status.
    /// - Parameter jokers: True if allow `Jokers`, else false.
    public init(with jokers: Bool = false) {

        let min = 0
        let max = jokers ? 54 : 52
        let cards = PlayingCards.getCards(with: jokers)

        self.jokersAllowed = jokers
        
        super.init(min, max, cards)
    }
}
