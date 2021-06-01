//=============================================================================//
//                                                                             //
//  DoubleRun.swift                                                            //
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

/// A `HandRank` of  two `Run`s with a `Pair`.
public class DoubleRun: MultiRun {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`DoubleRun`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain at least four `Card`s.
    ///   - The given `Card`s must contain one, and only one `Pair`.
    ///   - The given `Card`'s non-`Pair Card`s must form a `Run` with each `Pair Card`.
    /// - Postcondition:
    ///   - The `DoubleRun` contains the given `Card`s.
    ///   - The `DoubleRun`s points are calculated based on the # of given `Card`s.
    ///   - The `DoubleRun` can hold four to `Int.max Card`s.
    ///   - The `DoubleRun`s title is set to "Double Run".
    /// - Parameter cards:  The `Card`s to include in the `DoubleRun`.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`s do not contain at least four `Card`s.
    ///   - `invalidKindCount` if the given `Card`s do not contain one, and only one `Pair`.
    ///   - `invalidRun` if the given `Card`'s non-`Pair Card`s do not form a `Run` with each
    ///     `Pair Card`.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 4
        let pairCount = 1
        let pairs = try cards.getPairs()
        let pair = pairs.first

        guard (pairs.count == pairCount) else {
            
            print("The given Cards must contain \(pairCount), and only " +
                  "\(pairCount) Pair.")
            throw HandRankError.invalidKindCount
        }
        
        guard (cards.formRun(with: pair)) else {
            
            print("The given Card's non-Pair Cards must form a Run with each " +
                  "Pair Card.")
            throw HandRankError.invalidRun
        }
        
        try super.init(of: min, cards)
    }
}
