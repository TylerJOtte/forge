//=============================================================================//
//                                                                             //
//  FourOfAKind.swift                                                          //
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

/// A `Kind` of four equally `Rank`ed `Card`s.
public class FourOfAKind<T: RankedCard>: Kind<T> {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`FourOfAKind` with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain four, and only four `Card`s.
    ///   - The given `Card`s must all contain the same `Rank`.
    /// - Postcondition:
    ///   - The `FourOfAKind` contains the given `Card`s.
    ///   - The `FourOfAKind`'s points are set to 12.
    ///   - The `FourOfAKind` can only hold four ` Card`s.
    ///   - The `FourOfAKind`'s title is set to "Four Of A Kind".
    /// - Parameter cards: The `Card`s to include in the `FourOfAKind`.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`s do not contain four, and only four `Card`s.
    ///   - `invalidRank` if the given `Card`s do not all contain the same `Rank`.
    public init(of cards: [T]) throws {

        let min = 4
        let max = 4

        try super.init(of: min, to: max, cards)
    }
}
