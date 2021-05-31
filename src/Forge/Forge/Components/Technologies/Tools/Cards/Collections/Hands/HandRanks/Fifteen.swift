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
public class Fifteen: HandRank<RankedCard> {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Fifteen`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain two to five`Card`s.
    ///   - The given `Card`'s points must sum to 15.
    /// - Postcondition:
    ///   - The `Fifteen` contains the given `Card`s.
    ///   - The `Fifteen`'s points are set to 2.
    ///   - The `Fifteen` can hold two  to five `Card`s.
    ///   - The `Fifteen`'s title is set to `Fifteen`.
    /// - Parameter cards: The `Card`s to include in the`Fifteen`.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`s do not contain two to five `Card`s.
    ///   - `invalidPoints` if the given `Card`'s points do not sum to 15.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 2
        let max = 5
        let sum = 15
        let points = 2
        
        guard (cards.sum() == sum) else {
            
            print("The given Cards' points must sum to 15.")
            throw ScoreError.invalidPoints
        }
        
        try super.init(of: min, to: max, cards, worth: points)
    }
}
