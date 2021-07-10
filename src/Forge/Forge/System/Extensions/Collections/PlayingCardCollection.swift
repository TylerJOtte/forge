//=============================================================================//
//                                                                             //
//  PlayingCardCollection.swift                                                //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/02/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//


/// An extension for common `PlayingCard Collection` operations.
extension Collection where Element: PlayingCard  {

    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if all the `PlayingCard`s contain the same`Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all the `PlayingCard`s contain the same`Suit`, else false.
    func areEquallySuited() -> Bool {
        
        return splitBySuit().count == 1
    }
    
    /// Determines if only contains the given `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter suit: The `Suit` to test.
    /// - Returns: True if only contains the given `Suit`, else false.
    func contain(other suit: Suit) -> Bool {
        
        return count > 0 && getSuits().contains(where: {$0 != suit})
    }
    
    /// Determines if only contains the given `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter suit: The `Suit` to test.
    /// - Returns: True if only contains the given `Suit`, else false.
    func contain(only suit: Suit) -> Bool {
        
        return count > 0 && !contain(other: suit)
    }
    
    /// Determines if only contains the given `Suit`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter suits: The `Suit`s to test.
    /// - Returns: True if only contains the given `Suit`s, else false.
    func contain(only suits: [Suit]) -> Bool {
        
        var containOnlySuits = false
        
        if (count > 1) {
            
            let expected = Set(suits)
            let actual = getSuits()
            var suit = 0
            var containsSuit = true
            
            while (containsSuit && suit < actual.count) {
                
                let nextSuit = actual[suit]
                
                containsSuit = expected.contains(nextSuit)
                suit += 1
            }
            
            containOnlySuits = containsSuit
        }
        
        return containOnlySuits
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    /// Retrieves all the unique `Suit`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An `Array` with all the unique `Suit`s.
    func getSuits() -> [Suit] {
        
        return Array<Suit>(splitBySuit().keys)
    }
    
    //=========================================================================//
    //                                SPLITTERS                                //
    //=========================================================================//
    
    /// Splits all the `PlayingCard`s  by `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A dictionary with `Suit:PlayingCard Array` entries.
    func splitBySuit() -> [Suit:[PlayingCard]] {
        
        return Dictionary(grouping: self, by: {$0.suit})
    }
}
