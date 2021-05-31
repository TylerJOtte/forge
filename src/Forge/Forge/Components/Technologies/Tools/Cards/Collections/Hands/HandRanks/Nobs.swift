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

/// A `PlayingCard HandRank`s with a `Jack` and a `Card` of the same `Suit`.
public class Nobs: HandRank<PlayingCard> {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Nobs HandRank`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain two, and only two`Card`s.
    ///   - The given `Card`s must contain one `Jack`, and one non-`Jack`.
    ///   - The given `Card`s must both contain the same `Suit`.
    /// - Postcondition:
    ///   - The `HandRank` contains the given `Card`s.
    ///   - The `HandRank`'s points are set to 1.
    ///   - The `HandRank` can only hold two ` Card`s.
    ///   - The `HandRank`'s title is set to "Nobs".
    /// - Parameter cards: The `Card`s to include in the `HandRank`.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`s do not contain two, and only two `Card`s.
    ///   - `invalidRank` if the given `Card`s do not contain one `Jack` and one non-`Jack`.
    ///   - `invalidSuit` if the given `Card`s do not both contain the same `Suit`.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 2
        let max = 2
        let points = 1
        
        guard (cards.count == min) else {

            print("The collection must contain \(min), and only \(min) Cards.")
            throw ElementsError.invalidCount
        }
        
        guard (cards.contains(where: {$0 is Jack})) else {
            
            print("The given Cards must contain a Jack.")
            throw DescriptionError.invalidRank
        }
        
        guard (cards.contains(where: {!($0 is Jack) && !($0 is Joker)})) else {
            
            print("The given Cards must contain a non-Jack.")
            throw DescriptionError.invalidRank
        }
        
        guard (cards.areEquallySuited()) else {
            
            print("The given Cards must both contain the same Suit.")
            throw DepictionError.invalidSuit
        }
        
        try super.init(of: min, to: max, cards, worth: points)
    }
}
