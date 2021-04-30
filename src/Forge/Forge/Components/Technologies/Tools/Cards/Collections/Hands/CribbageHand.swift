//=============================================================================//
//                                                                             //
//  CribbageHand.swift                                                         //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/04/21.                                       //
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

/// A `PlayingCard Hand` for a game of Cribbage.
public class CribbageHand: Hand {
    
    /// The `Deck`'s cut `Card`.
    public let cutCard: PlayingCard
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`CribbageHand`with the given `Card`s and cut `Card`.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain at zero to four `Card`s.
    ///   - The given `Card`s must not contain any `Joker`s.
    ///   - The given cut `Card` must not be a `Joker`.
    /// - Postcondition:
    ///   - The `Hand` can hold zero to five `Card`s.
    ///   - The `Hand` contains the given `Card`s.
    ///   - The `Hand`'s cut `Card` is set to the given cut `Card`.
    /// - Parameters:
    ///    - cards: The `Card`s to create the `Hand` with.
    ///    - cutCard: The `Deck`'s cut `Card`.
    /// - Throws:
    ///   - `ElementsError.excessiveElements` if the given `Card`'s contain more than four
    ///     `Card`s.
    ///   - `PlayingCardError.jokersNotAllowed` if
    ///      - The given `Card`s contains a `Joker`, or
    ///      - The given cut `Card` is a `Joker`.
    public init(with cards: [PlayingCard], and cutCard: PlayingCard) throws {
        
        let max = 4
        let joker = try Joker()
        
        guard (cards.contains(joker)) else {
            
            print("The given Cards must not contain any Jokers.")
            throw FeatureError.jokersNotAllowed
        }
        
        guard (cutCard != joker) else {
            
            print("The given cut Card must not be a Joker.")
            throw FeatureError.jokersNotAllowed
        }
        
        self.cutCard = cutCard
        
        try super.init(of: cards, with: max)
    }
}
