//=============================================================================//
//                                                                             //
//  NumeralCard.swift                                                          //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/19/21.                                       //
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

/// A standard French-suited numeral `PlayingCard`.
public class NumeralCard: PlayingCard {

    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//

    /// Creates a `NumeralCard` with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Rank` must be a standard numeral `PlayingCard Rank`.
    ///   - The given `Suit` must be a standard `PlayingCard Suit`.
    ///   - The given position must be between 1-10, or equal 14.
    /// - Postcondition:
    ///   - The `Card`'s `Rank` is set to the given `Rank`.
    ///   - The `Card`'s `Suit` is set to the given `Suit`.
    ///   - The `Card`'s points are set to the given points.
    ///   - The `Card`'s position is set to the given position.
    ///   - The `Card`'s title is set to "`{Rank}` of `{Suit}`".
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - suit: The symbol grouping.
    ///   - points: The total # of points.
    ///   - position: The given `Rank`'s order in the hierarchy.
    /// - Throws:
    ///   - `invalidRank`  if the given `Rank` is not a standard numeral `PlayingCard Rank`.
    ///   - `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
    ///   - `invalidPosition`  if the given position is not between 1-14.
    init(_ rank: Rank, of suit: Suit, worth points: Int,
                  at position: Int) throws {

        guard (rank.isNumeralPlayingCardRank()) else {

            print("The given Rank is not a standard numeral PlayingCard Rank.")
            throw DescriptionError.invalidRank
        }
        
        guard ((position >= 1 && position <= 10) || position == 14) else {

            print("The given order must be between 1-10, or equal 14.")
            throw RangeError.invalidPosition
        }

        try super.init(rank, of: suit, worth: points, at: position)
    }
}
