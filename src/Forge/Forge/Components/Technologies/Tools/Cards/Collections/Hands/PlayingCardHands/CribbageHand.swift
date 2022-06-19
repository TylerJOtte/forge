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
public class CribbageHand: PlayingCardHand {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//

    /// Creates a default `CribbageHand`.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Hand` can hold zero to four `Card`s.
    ///   - The `Hand` is empty.
    ///   - The `Hand`'s title is set to "Cribbage Hand".
    override public init() {
         
        super.init(maxCards: 4)
    }
    
    /// Creates a`CribbageHand`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must not contain more than  four `Card`s.
    ///   - The given `Card`s must not contain any `Joker`s.
    /// - Postcondition:
    ///   - The `Hand` can hold zero to four `Card`s.
    ///   - The `Hand` contains the given `Card`s.
    ///   - The `Hand`'s title is set to  "Cribbage Hand".
    /// - Parameter cards: The `Card`s to create the `Hand` with.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`'s contain more than four `Card`s.
    ///   - `invalidRank` if the given `Card`s contains any `Joker`s.
    internal init(with cards: [PlayingCard]) throws {
        
        let max = 4
        
        guard (cards.count <= max) else {
            
            print("The given Cards can contain at most \(max) Cards.")
            throw ElementsError.invalidCount
        }
        
        guard (!cards.containJokers()) else {

            print("The given Cards must not contain any Jokers.")
            throw DescriptionError.invalidRank
        }

        try super.init(of: max, cards)
    }
        
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    /// Retrieves  a`Nobs HandRank`for the given cut `Card`.
    ///
    /// - Precondition: The given cut `Card` cannot be a `Jack` or a `Joker`.
    /// - Postcondition: None.
    /// - Parameter cutCard: The `Deck`'s cut `Card`.
    /// - Throws:`invalidRank` if the given cut `Card` is a `Jack` or a `Joker`.
    internal func getNobs(with cutCard: PlayingCard) throws -> Nobs? {

        var nobs: Nobs?

        guard (!(cutCard is Jack) && !(cutCard is Joker)) else {

            print("The given cut card cannot be a Jack or a Joker.")
            throw DescriptionError.invalidRank
        }
        
        if let jack = cards.firstJack(of: cutCard.suit) {

            nobs = try Nobs(with: jack, and: cutCard)
        }

        return nobs
    }
}
