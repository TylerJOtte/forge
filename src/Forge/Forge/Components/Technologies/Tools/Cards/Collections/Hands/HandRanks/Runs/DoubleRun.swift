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

/// A `HandRank` of with two `Run`s and  a pair.
public class DoubleRun: MultiRun {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`DoubleRun`with the given `Card`s.
    ///
    /// - Precondition:
    ///    - The given `Card`s must contain at least four`Card`s.
    ///    - The given `Card`s must contain one and only one pair.
    ///    - The given `Card`s must be in sequential order.
    /// - Postcondition:
    ///    - The `HandRank` can hold four to `Int.max Card`s.
    ///    - The `HandRank` contains the given `Card`s.
    ///    - The `HandRank`s title is set to "Double Run".
    ///    - The `HandRank`s points are set to according to the sequence length in the given `Card`s.
    /// - Parameter cards: The `Card`s to create the `HandRank` with.
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s ontain less than four
    ///      `Card`s.
    ///    - `ElementsError.invalidDuplicateCount` if the given `Card`s doesn't contain one
    ///       and only pair.
    ///    - `ElementsError.areNotSequential` if the given `Card`s are not in sequential order.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 4
        let runs = 2
        let pairs = 1
        let title = "Double Run"
        let groups = false
        
        guard (cards.count >= min) else {
            
            print("The collection must contain at least \(min) Cards.")
            throw ElementsError.insufficientElements
        }
        
        try super.init(of: min, cards, with: runs, and: pairs, named: title,
                       multiple: groups)
    }
}
