//=============================================================================//
//                                                                             //
//  TripleRun.swift                                                            //
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

/// A `HandRank` of three `Run`s with a `ThreeOfAKind`.
public class TripleRun: MultiRun {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`TripleRun`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain at least five `Card`s.
    ///   - The given `Card`s must contain only one `ThreeOfAKind`, and no other `Kind`s.
    ///   - The given `Card`'s non-`Kind Card`s must form a `Run` with each `Kind Card`.
    /// - Postcondition:
    ///   - The `TripleRun` contains the given `Card`s.
    ///   - The `TripleRun`s points are calculated based on the # of given `Card`s.
    ///   - The `TripleRun` can hold five to `Int.max Card`s.
    ///   - The `TripleRun`s title is set to "Triple Run".
    /// - Parameter cards:  The `Card`s to include in the `TripleRun`.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`s do not contain at least five `Card`s.
    ///   - `invalidKindCount` if the given `Card`s do not contain one, and only one
    ///     `ThreeOfAKind`.
    ///   - `invalidRun` if the given `Card`'s non-`Kind Card`s do not form a `Run` with each
    ///     `Kind Card`.
    public init(of cards: [RankedCard]) throws {
        
        let min = 5
        let threeOfAKinds = 1
        let pairs = 3
        let runs = 3
        
        guard (cards.count >= min) else {

            print("The given Cards must contain at least \(min) Cards.")
            throw ElementsError.invalidCount
        }
    
        try super.init(of: min, cards, with: pairs)
    }
}
