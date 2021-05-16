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
public class Pair: Kind {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//

    /// Creates a`Pair`with the given `Card`s.
    ///
    /// - Precondition: The given `Card`s must both contain the same `Rank`.
    /// - Postcondition:
    ///   - The `Pair` contains the given `Card`s.
    ///   - The `Pair`'s points are set to 2.
    ///   - The `Pair` can only hold two ` Card`s.
    ///   - The `Pair`'s title is set to "Pair".
    /// - Parameters:
    ///   - card: The first `Card`in the pair.
    ///   - other: The other`Card` in the pair.
    /// - Throws: `invalidRank` if the given `Card`s do not both contain the same `Rank`.
    public init(with card: RankedCard, and other: RankedCard) throws {

        let min = 2
        let max = 2
        let cards = [card, other]
        
        try super.init(of: min, to: max, cards)
    }
    
    /// Creates a`Pair`with the given `Card`s.
    ///
    /// - Precondition: The given `Card`s must both contain the same `Rank`.
    /// - Postcondition:
    ///   - The `Pair` contains the given `Card`s.
    ///   - The `Pair`'s points are set to 2.
    ///   - The `Pair` can only hold two ` Card`s.
    ///   - The `Pair`'s title is set to "Pair".
    /// - Parameter cards: The `Card`s to include in the `Pair`.
    /// - Throws: `invalidRank` if the given `Card`s do not both contain the same `Rank`.
    public init(_ cards: [RankedCard]) throws {

        let min = 2
        let max = 2

        try super.init(of: min, to: max, cards)
    }
}
