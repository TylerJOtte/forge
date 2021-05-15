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

/// A standard French-suited `ace Rank`ed `PlayingCard`.
public class Ace: NumeralCard {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// True if the`Card` has the highest `PlayingCard Rank`, else false.
    public let isHigh: Bool
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates an `Ace` with the given terms.
    ///
    /// - Precondition: The given `Suit` must be a standard `PlayingCard Suit`.
    /// - Postcondition:
    ///   - The `Card`'s `Suit` is set to the given `Suit`.
    ///   - The `Card`'s isHigh status is set to the given isHigh status.
    ///   - The `Card`'s `Rank` is set to `ace`.
    ///   - The `Card`'s points are set to 1.
    ///   - The `Card`'s title is set to "Ace  of `{Suit}`".
    /// - Parameters:
    ///   - suit: The symbol grouping.
    ///   - isHigh: True if the`Card` has the highest `PlayingCard Rank`, else false.
    /// - Throws: `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
    public init(of suit: Suit, and isHigh: Bool = false) throws {
        
        let rank = Rank.ace
        let points = 1
        let position = isHigh ? 14 : 1
        
        self.isHigh = isHigh
        
        try super.init(rank, of: suit, worth: points, at: position)
    }
}
