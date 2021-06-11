//=============================================================================//
//                                                                             //
//  PairArray.swift                                                            //
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


/// An extension for common `Pair<RankedCard> Array` operations.
extension Array where Element: Pair<RankedCard> {
    
    /// Retrieves all the unique `RankedCard`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An `Array` of unique `RankedCard`s, if any.
    func getUniqueCards() -> [RankedCard?] {
        
        var cards: [RankedCard?] = []
        
        for pair in self {
            
            let pairCards = [pair.first, pair.last]
            let uniqueCards = pairCards.filter{!cards.contains($0)}
            
            cards.append(contentsOf: uniqueCards)
        }
        
        return cards
    }
}
