//=============================================================================//
//                                                                             //
//  DoubleDoubleRun.swift                                                      //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/17/21.                                       //
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

/// A `HandRank` of four `Run`s with two `Pair`s.
public class DoubleDoubleRun: MultiRun {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`DoubleDoubleRun`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain at least five `Card`s.
    ///   - The given `Card`s must contain two, and only two `Pair`s.
    ///   - The given `Card`'s non-`Pair Card`s must form a `Run` with each `Pair Card`.
    /// - Postcondition:
    ///   - The `DoubleDoubleRun` contains the given `Card`s.
    ///   - The `DoubleDoubleRun`s points are calculated based on the # of given `Card`s.
    ///   - The `DoubleDoubleRun` can hold five to `Int.max Card`s.
    ///   - The `DoubleDoubleRun`s title is set to "Double Double Run".
    /// - Parameter cards:  The `Card`s to include in the `DoubleDoubleRun`.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`s do not contain at least five `Card`s.
    ///   - `invalidKindCount` if the given `Card`s do not contain two, and only two `Pair`s.
    ///   - `invalidRun` if the given `Card`'s non-`Pair Card`s do not form a `Run` with each
    ///     `Pair Card`.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 5
        let pairCount = 2
        let pairs = try cards.getPairs()
        let pairCards = [pairs.first?.first, pairs.last?.first]
        
        guard (pairs.count == pairCount) else {
            
            print("The given Cards must contain \(pairCount), and only " +
                  "\(pairCount) Pairs.")
            throw HandRankError.invalidKindCount
        }
        
        guard (cards.formRun(with: pairCards)) else {
            
            print("The given Card's non-Pair Cards must form a Run with each " +
                  "Pair Card.")
            throw HandRankError.invalidRun
        }
        
        try super.init(of: min, cards)
    }
}
