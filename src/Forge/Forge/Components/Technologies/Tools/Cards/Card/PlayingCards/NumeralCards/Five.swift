//=============================================================================//
//                                                                             //
//  Five.swift                                                                 //
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

/// A standard French-suited five `PlayingCard`.
public class Five: NumeralCard {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Five` with the given `Suit`.
    ///
    /// - Precondition: The given `Suit` must be `clubs`, `diamonds`, `hearts`, or
    ///  `spades`.
    /// - Postcondition:
    ///   - The `Card`s `Rank`is set to `five`.
    ///   - The `Card`s `Suit` is set to the given `Suit`.
    ///   - The `Card`s points are set to five.
    ///   - The `Card`s title is set to "`Five` of `{Suit}`.
    ///   - The `Card`s `Color` is set to
    ///      - `red` if the if the specified `Suit` is `hearts` or `diamonds`, or
    ///      - `black` if the the specified `Suit` is `clubs` or `spades`.
    /// - Parameter suit: The symbol grouping.
    /// - Throws: `FeatureError.invalidSuit`  if the given `Suit` is not `clubs`,
    ///   `diamonds`, `hearts`, or `spades`.
    public init(of suit: Suit) throws {
        
        try super.init(.five, of: suit)
    }
}
