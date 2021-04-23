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
import SwiftUI

/// A standard French-suited numeral `PlayingCard`.
public class NumeralCard: PlayingCard {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `NumeralCard` with the given `Rank` and `Suit`.
    ///
    /// - Precondition:
    ///    - The given `Rank` must be an `ace..ten`.
    ///    - The given `Suit` must be `clubs`, `diamonds`, `hearts`, or `spades`.
    /// - Postcondition:
    ///   - The `Card`s `Rank`is set to the given `Rank`.
    ///   - The `Card`s `Suit` is set to the given `Suit`.
    ///   - The `Card`s points are set to the respective points the `Rank`'s name represents.
    ///   - The `Card`s title is set to the given "`{Rank}` of `{Suit}`.
    ///   - The `Card`s `Color` is set to
    ///      - `red` if the if the specified `Suit` is `hearts` or `diamonds`, or
    ///      - `black` if the the specified `Suit` is `clubs` or `spades`.
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - suit: The symbol grouping.
    /// - Throws:
    ///   - `FeatureError.invalidRank` if the given `Rank` is not an `ace..ten`.
    ///   - `FeatureError.invalidSuit`  if the given `Suit` is not `clubs`, `diamonds`,
    ///     `hearts`, or `spades`.
    init(_ rank: Rank, of suit: Suit = .hearts) throws {
        
        guard (rank.isNumeral()) else {
            
            print("The given Rank must be an ace..ten.")
            throw FeatureError.invalidRank
        }

        try super.init(rank, of: suit)
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the given left-handside`Card` is less than the specified right-handside `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The value to compare against.
    ///   - rhs: The value to compare to.
    /// - Returns: True if given left-handside`Card` is less than the specified right-handside `Card`.
    public static func < (lhs: NumeralCard, rhs: NumeralCard) -> Bool {
        
        return lhs.points < rhs.points
    }
}
