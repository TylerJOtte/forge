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

/// A `HandRank` of two `DoubleRun`s.
public class DoubleDoubleRun: MultiRun {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`DoubleDoubleRun`with the given `Card`s.
    ///
    /// - Precondition:
    ///    - The given `Card`s must contain at least five`Card`s.
    ///    - The given `Card`s must contain two and only two pairs.
    ///    - The given `Card`s must be in sequential order.
    /// - Postcondition:
    ///    - The `HandRank` can hold five to `Int.max Card`s.
    ///    - The `HandRank` contains the given `Card`s.
    ///    - The `HandRank`s title is set to "Double Double Run".
    ///    - The `HandRank`s points are set to according to the sequence length in the given `Card`s.
    /// - Parameter cards: The `Card`s to create the `HandRank` with.
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s
    ///       - Contain less than five `Card`s, or
    ///       - Contain less than two pairs.
    ///    - `ElementsError.excessiveElements` if the given `Card`s contain more than two pairs.
    ///    - `ElementsError.areNotSequential` if the given `Card`s are not in sequential order.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 5
        let runs = 4
        let pairs = 2
        let title = "Double Double Run"

        try super.init(of: min, cards, with: runs, and: pairs, named: title)
    }
}
