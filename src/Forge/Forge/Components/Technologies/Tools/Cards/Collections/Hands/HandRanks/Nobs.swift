//=============================================================================//
//                                                                             //
//  Nobs.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/11/21.                                       //
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

/// A `PlayingCard HandRank` with a `Jack` and a `Card` of the same `Suit`.
public class Nobs: PlayingCardHandRank {
    
    /// Creates a`Nobs HandRank`with the given `Jack` and cut `Card`.
    ///
    /// - Precondition:
    ///   - The given cut `Card` cannot be a `Jack` or a `Joker`.
    ///   - The given `Jack` and cut `Card` must contain the same `Suit`.
    /// - Postcondition:
    ///   - The `HandRank` contains the given `Jack` and cut `Card`.
    ///   - The `HandRank`'s points are set to 1.
    ///   - The `HandRank` can only hold two ` Card`s.
    ///   - The `HandRank`'s title is set to "Nobs".
    /// - Parameters:
    ///   - jack: The `Jack` of the cut `Suit`.
    ///   - cutCard: The `Deck`'s cut `Card`.
    /// - Throws:
    ///   - `invalidRank` if the given cut `Card` is a `Jack` or a `Joker`.
    ///   - `invalidSuit` if the given `Jack` and cut `Card` do not contain the same `Suit`.
    internal init(with jack: Jack, and cutCard: PlayingCard) throws {
        
        guard (!(cutCard is Jack) && !(cutCard is Joker)) else {

            print("The given cut card cannot be a Jack or a Joker.")
            throw DescriptionError.invalidRank
        }

        guard (jack.suit == cutCard.suit) else {
            
            print("The given Jack and cut Card must contain the same suit.")
            throw DepictionError.invalidSuit
        }

        try super.init(of: 2, to: 2, [jack, cutCard], worth: 1)
    }
}
