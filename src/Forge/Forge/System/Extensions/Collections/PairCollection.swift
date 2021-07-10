//=============================================================================//
//                                                                             //
//  PairCollection.swift                                                       //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/06/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//


/// An extension for common `Pair Collection` operations.
extension Collection where Element: Pair {
    
    /// Retrieves all the unique `RankedCard`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An `Array` of unique `RankedCard`s, if any.
    func getUniqueCards() -> [Card] {
        
        var cards: [Card] = []
        
        for pair in self {

            cards.append(contentsOf: pair.except(cards))
        }
        
        return cards
    }
}
