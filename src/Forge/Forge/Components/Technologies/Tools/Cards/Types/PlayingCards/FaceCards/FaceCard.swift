//=============================================================================//
//                                                                             //
//  FaceCard.swift                                                             //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/18/21.                                       //
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

/// A standard French-suited face`PlayingCard`.
public class FaceCard: PlayingCard {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `FaceCard` with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Rank` must be a standard royal`PlayingCard Rank`.
    ///   - The given `Suit` must be a standard `PlayingCard Suit`.
    ///   - The given position must be between 1-14.
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
    ///   - `invalidRank`  if the given `Rank` is not a standard royal `PlayingCard Rank`.
    ///   - `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
    ///   - `invalidPosition`  if the given position is not between 1-14.
    override init(_ rank: Rank, of suit: Suit, worth points: Int,
                  at position: Int) throws {
        
        guard (rank.isRoyal()) else {

            print("The given Rank is not a standard royal PlayingCard Rank.")
            throw DescriptionError.invalidRank
        }
        
        try super.init(rank, of: suit, worth: points, at: position)
    }
}
