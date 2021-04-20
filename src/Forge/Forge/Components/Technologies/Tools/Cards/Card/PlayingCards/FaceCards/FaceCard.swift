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
import SwiftUI

/// A standard French-suited face`PlayingCard`.
public class FaceCard: PlayingCard {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `FaceCard` with the given `Rank` and `Suit`.
    ///
    /// - Precondition:
    ///    - The given `Rank` must be a `jack`, `queen`, or `king`.
    ///    - The given `Suit` must be `clubs`, `diamonds`, `hearts`, or `spades`.
    /// - Postcondition:
    ///   - The `Card`s `Rank`is set to the given `Rank`.
    ///   - The `Card`s `Suit` is set to the given `Suit`.
    ///   - The `Card`s points are set to 10.
    ///   - The `Card`s title is set to the given "`{Rank}` of `{Suit}`.
    ///   - The `Card`s `Color` is set to
    ///      - `red` if the if the specified `Suit` is `hearts` or `diamonds`, or
    ///      - `black` if the the specified `Suit` is `clubs` or `spades`.
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - suit: The symbol grouping.
    /// - Throws:
    ///   - `FeatureError.invalidRank` if the given `Rank` is not a `jack`, `queen`, or
    ///     `king`.
    ///   - `FeatureError.invalidSuit`  if the given `Suit` is not `clubs`, `diamonds`,
    ///     `hearts`, or `spades`.
    init(_ rank: Rank, of suit: Suit = .hearts) throws {
        
        guard (rank.isRoyal()) else {
            
            print("The given Rank must be a jack, queen, or king.")
            throw FeatureError.invalidRank
        }
        
        guard (suit.isStandard()) else {
            
            print("The given Suit must be clubs, diamonds, hearts, or spades.")
            throw FeatureError.invalidSuit
        }
        
        try super.init(rank, of: suit)
    }
}
