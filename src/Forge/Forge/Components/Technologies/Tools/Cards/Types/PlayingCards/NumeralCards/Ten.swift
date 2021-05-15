//=============================================================================//
//                                                                             //
//  Ten.swift                                                                  //
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

/// A standard French-suited `ten Rank`ed `PlayingCard`.
public class Ten: NumeralCard {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `Ten` with the given terms.
    ///
    /// - Precondition: The given `Suit` must be a standard `PlayingCard Suit`.
    /// - Postcondition:
    ///   - The `Card`'s `Suit` is set to the given `Suit`.
    ///   - The `Card`'s `Rank` is set to `ten`.
    ///   - The `Card`'s points are set to 10.
    ///   - The `Card`'s title is set to "Ten  of `{Suit}`".
    /// - Parameters suit: The symbol grouping.
    /// - Throws: `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
    public init(of suit: Suit = .hearts) throws {
        
        let rank = Rank.ten
        let points = 10
        let position = 10
        
        try super.init(rank, of: suit, worth: points, at: position)
    }
}
