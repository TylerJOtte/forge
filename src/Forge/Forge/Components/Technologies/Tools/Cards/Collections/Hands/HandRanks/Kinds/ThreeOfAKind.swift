//=============================================================================//
//                                                                             //
//  ThreeOfAKind.swift                                                         //
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

/// A `Kind` of three equally `Rank`ed `Card`s.
public class ThreeOfAKind: Kind {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`ThreeOfAKind`with the given `Card`s.
    ///
    /// - Precondition: The given `Card`s must all contain the same `Rank`.
    /// - Postcondition:
    ///   - The `ThreeOfAKind` contains the given `Card`s.
    ///   - The `ThreeOfAKind`'s points are set to 6.
    ///   - The `ThreeOfAKind` can only hold three ` Card`s.
    ///   - The `ThreeOfAKind`'s title is set to "Three Of A Kind".
    /// - Parameter cards: The `Card`s to include in the `ThreeOfAKind`.
    /// - Throws: `invalidRank` if the given `Card`s do not all contain the same `Rank`.
    public init(of cards: [RankedCard]) throws {

        let min = 3
        let max = 3

        try super.init(of: min, to: max, cards)
    }
}
