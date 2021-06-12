//=============================================================================//
//                                                                             //
//  HandRankArray.swift                                                        //
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


/// An extension for common `HandRank<RankedCard> Array` operations.
extension Array where Element: HandRank {
    
    /// Determines if contains all the unique `RankedCard`s in the given `Pair Array`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if contains all the unique `RankedCard`s in the `Pair Array`, else false.
    func containCards(in pairs: [Pair]) -> Bool {
     
        var containsPairCards = true
        var handRank = 0
        
        while (containsPairCards && handRank < count) {
            
            containsPairCards = self[handRank].containsCard(in: pairs)
            handRank += 1
        }
        
        return containsPairCards
    }
}

/// An extension for common `Array<HandRank<RankedCard>> Array` operations.
extension Array where Element == Array<HandRank> {

    /// Sums all the `Element`s' points.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The sum of all the `Element`s' points.
    func sumPoints() -> Int {
        
        return self.map{$0.sumPoints()}.reduce(0, +)
    }
}

