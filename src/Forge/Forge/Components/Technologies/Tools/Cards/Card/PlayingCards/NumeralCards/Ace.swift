//=============================================================================//
//                                                                             //
//  Ace.swift                                                                  //
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

/// A standard French-suited ace `PlayingCard`.
public class Ace: NumeralCard {
    
    /// True if is the high `Card`, else false.
    public let isHigh: Bool
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates an`Ace` with the given `Suit`.
    ///
    /// - Precondition: The given `Suit` must be `clubs`, `diamonds`, `hearts`, or
    ///  `spades`.
    /// - Postcondition:
    ///   - The `Card`s `Rank`is set to the given `ace`.
    ///   - The `Card`s `Suit` is set to the given `Suit`.
    ///   - The `Card`s points are set to one if not high, else 11.
    ///   - The `Card`s title is set to the given "`Ace` of `{Suit}`.
    /// - Parameters:
    ///   - suit: The symbol grouping.
    ///   - high: True if the `ace` is the high `Card`, else false.
    /// - Throws: `FeatureError.invalidSuit`  if the given `Suit` is not `clubs`,
    ///   `diamonds`, `hearts`, or `spades`.
    public init(of suit: Suit, is high: Bool = false) throws {
        
        self.isHigh = high
        
        try super.init(.ace, of: suit)
    }
}
