//=============================================================================//
//                                                                             //
//  Pair.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/16/21.                                       //
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

/// A `Kind` of two equally `Rank`ed `Card`s.
public class Pair<T: RankedCard>: Kind<T> {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Pair` with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain two, and only two`Card`s.
    ///   - The given `Card`s must both contain the same `Rank`.
    /// - Postcondition:
    ///   - The `Pair` contains the given `Card`s.
    ///   - The `Pair`'s points are set to 2.
    ///   - The `Pair` can only hold two ` Card`s.
    ///   - The `Pair`'s title is set to "Pair".
    /// - Parameter cards: The `Card`s to include in the `Pair`.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`s do not contain two, and only two `Card`s.
    ///   - `invalidRank` if the given `Card`s do not both contain the same `Rank`.
    public init(of cards: [T]) throws {

        let min = 2
        let max = 2

        try super.init(of: min, to: max, cards)
    }
}
