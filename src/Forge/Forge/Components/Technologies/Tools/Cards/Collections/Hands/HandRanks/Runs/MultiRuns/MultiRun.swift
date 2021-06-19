//=============================================================================//
//                                                                             //
//  MultiRun.swift                                                             //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/29/21.                                       //
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

/// A `HandRank` of multiple `Run`s with at least one common `Card`.
public class MultiRun: HandRank {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`MultiRun`with the given terms.
    ///
    /// - Precondition:
    ///    - The given min must be >= four.
    ///    - The given `Card`s must contain the specified min # of `Card`s..
    /// - Postcondition:
    ///    - The `MultiRun` can hold four to `Int.max Card`s.
    ///    - The `MultiRun` contains the given `Card`s.
    ///    - The `MultiRun`s points are calculated based on the # of given `Card`s.
    ///    - The `MultiRun`s title is set to the calling model's name.
    /// - Parameters:
    ///    - min: The minimun # of `Card`s allowed.
    ///    - cards: The `Card`s to include in the `MultiRun`.
    /// - Throws:
    ///   -  `invalidMin` if the given min is less than four.
    ///   - `invalidCount` if the given `Card`s do not contain the specified min # of `Card`s.
    init(of min: Int, _ cards: [RankedCard], with pairCount: Int) throws {
        
        let minCards = 4
        let max = Int.max
        let pairs = try cards.getPairs()
        let runs = try cards.getRuns()
        let runCount = pairs.getUniqueCards().count
        let count = pairCount
        let handRanks: [[HandRank]] = [pairs, runs]
        let points = handRanks.sumPoints()
        
        guard (min >= minCards) else {

            print("Min must be >= \(minCards).")
            throw RangeError.invalidMin
        }

        guard (pairs.count == pairCount) else {
            
            print("The given Cards must contain \(count), and only " +
                  "\(count) Pair.")
            throw HandRankError.invalidKindCount
        }
        
        guard (runs.count == runCount) else {
            
            print("The given Cards must contain \(count), and only " +
                  "\(count) Pair.")
            throw HandRankError.invalidRun
        }
        
        guard (runs.containCards(in: pairs)) else {
            
            throw HandRankError.invalidRun
        }

        try super.init(of: min, to: max, cards, worth: points)
    }
}
