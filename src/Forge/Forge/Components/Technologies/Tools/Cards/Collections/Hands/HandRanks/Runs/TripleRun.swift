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

/// A `HandRank` with three `Run`s and a royal pair.
public class TripleRun: DoubleRun {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`TripleRun`with the given `Card`s.
    ///
    /// - Precondition:
    ///    - The given `Card`s must contain at least five`Card`s.
    ///    - The given `Card`s must contain three and only three pairs.
    ///    - The given `Card`s must be in sequential order.
    /// - Postcondition:
    ///    - The `HandRank` can hold five to `Int.max Card`s.
    ///    - The `HandRank` contains the given `Card`s.
    ///    - The `HandRank`s title is set to "Triple Run".
    ///    - The `HandRank`s points are set to according to the sequence length in the given `Card`s.
    /// - Parameter cards: The `Card`s to create the `HandRank` with.
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s
    ///       - Contain less than five `Card`s, or
    ///       - Contain less than three pairs.
    ///    - `ElementsError.excessiveElements` if the given `Card`s contain more than three pairs.
    ///    - `ElementsError.areNotSequential` if the given `Card`s are not in sequential order.
    public override init(of cards: [PlayingCard]) throws {
        
        let min = 5
        let runs = 3
        let pairs = 3
        let title = "Triple Run"

        try super.init(of: min, cards, with: runs, and: pairs, named: title)
    }
}
