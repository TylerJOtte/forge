//=============================================================================//
//                                                                             //
//  Six.swift                                                                  //
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

/// A standard French-suited `six Rank`ed `PlayingCard`.
public class Six: NumeralCard {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `Six` with the given terms.
    ///
    /// - Precondition: The given `Suit` must be a standard `PlayingCard Suit`.
    /// - Postcondition:
    ///   - The `Card`'s `Suit` is set to the given `Suit`.
    ///   - The `Card`'s `Rank` is set to `six`.
    ///   - The `Card`'s points are set to 6.
    ///   - The `Card`'s title is set to "Six of `{Suit}`".
    /// - Parameters suit: The symbol grouping.
    /// - Throws: `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
    public init(of suit: Suit) throws {
        
        let rank = Rank.six
        let points = 6
        let position = 6
        
        try super.init(rank, of: suit, worth: points, at: position)
    }
}
