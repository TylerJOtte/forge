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

protocol AnyHandRank {
   
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    associatedtype T: RankedCard
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if contains one of the given `Pair`'s `Card`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter pair: The `Pair` to test with.
    /// - Returns: True if contains one of the given `Pair`'s `Card`'s, else false.
    func containsCard(in pair: Pair<T>) -> Bool
    
    /// Determines if contains one of the given `Pair`s' `Card`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter pairs: The `Pair`s to test with.
    /// - Returns: True if contains one of the given `Pair`s' `Card`'s, else false.
    func containsCard(in pairs: [Pair<T>]) -> Bool
}

extension HandRank: AnyHandRank { }

/// An extension for common `HandRank<RankedCard> Array` operations.
extension Array where Element: AnyHandRank {
    
    /// Determines if contains all the unique `RankedCard`s in the given `Pair Array`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if contains all the unique `RankedCard`s in the `Pair Array`, else false.
    func containCards(in pairs: [Pair<Element.T>]) -> Bool {
     
        var containsPairCards = true
        var handRank = 0
        
        while (containsPairCards && handRank < count) {
            
            containsPairCards = self[handRank].containsCard(in: pairs)
            handRank += 1
        }
        
        return containsPairCards
    }
}
