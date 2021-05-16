//=============================================================================//
//                                                                             //
//  Fifteen.swift                                                              //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/10/21.                                       //
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

/// A `HandRank` of`PlayingCard`s with points that sum to 15.
public class Fifteen: HandRank {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Fifteen`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain two to five`Card`s.
    ///   - The given `Card`'s points must sum to 15.
    /// - Postcondition:
    ///   - The `HandRank` can hold two  to five `Card`s.
    ///   - The `HandRank` contains the given `Card`s.
    ///   - The `HandRank`s title is set to `Fifteen`.
    ///   - The `HandRank`s points are set to two.
    ///   - title = "Fifteen".
    /// - Parameter cards: The `Card`s to create the`HandRank` with.
    /// - Throws:
    ///   - `ElementsError.insufficientElements` if the given `Card`s contain less than two
    ///     `Card`s,
    ///   - `ElementsError.excessiveElements` if the given `Card`s contain more than five
    ///     `Card`s.
    ///   - `RewardsError.invalidPoints` if the given `Card`s' sum does not sum to 15.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 2
        let max = 5
        let points = 2
        
        guard (cards.count >= min) else {
            
            print("The collection must contain at least \(min) Cards.")
            throw ElementsError.insufficientElements
        }
        
        guard (cards.count <= max) else {
            
            print("The collection must contain at most \(max) Cards.")
            throw ElementsError.excessiveElements
        }
        
        guard (cards.sum() == points) else {
            
            print("The given Cards' points must sum to 15.")
            throw ScoreError.invalidPoints
        }
        
        try super.init(of: min, to: max, cards, worth: points)
    }
}
