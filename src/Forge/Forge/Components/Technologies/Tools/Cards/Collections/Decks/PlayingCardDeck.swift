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
public class PlayingCardDeck: Deck {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// True if incldues `joker PlayingCard`s, else false.
    public let includesJokers: Bool
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a standard French-suited`PlayingCardDeck`with a `PlayingCard` for each
    /// `PlayingCard Rank` & `Suit`, along with `joker Card`s if specified.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Deck` can hold zero to 54 `PlayingCard`s if `jokers` included, else zero to 52.
    ///   - The `Deck` contains a `PlayingCard` for each standard `PlayingCard Rank` &
    ///    `Suit`, along with `joker Card`s if specified.
    ///   - The `Deck`'s title is set to "Playing Card Deck".
    /// - Parameters:
    ///   - cards: The `Card`s to create `Deck` with.
    ///   - max: The maximum # of `Card`s allowed in the `Deck.`
    public init(with jokers: Bool = false) throws {
        
        let min = 0
        let max = jokers ? 54 : 52
        let cards = jokers ? try PlayingCards.getAllCards() :
            try PlayingCards.getStandardCards()
        
        self.includesJokers = jokers
        try super.init(of: min, to: max, cards)
    }
}
