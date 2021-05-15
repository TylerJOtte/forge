//=============================================================================//
//                                                                             //
//  Eight.swift                                                                //
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

/// A standard French-suited `eight Rank`ed `PlayingCard`.
public class Eight: NumeralCard {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates an `Eight` with the given terms.
    ///
    /// - Precondition: The given `Suit` must be a standard `PlayingCard Suit`.
    /// - Postcondition:
    ///   - The `Card`'s `Suit` is set to the given `Suit`.
    ///   - The `Card`'s `Rank` is set to `eight`.
    ///   - The `Card`'s points are set to 8.
    ///   - The `Card`'s title is set to "Eight  of `{Suit}`".
    /// - Parameters suit: The symbol grouping.
    /// - Throws: `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
    public init(of suit: Suit = .hearts) throws {
        
        let rank = Rank.eight
        let points = 8
        let position = 8
        
        try super.init(rank, of: suit, worth: points, at: position)
    }
}
