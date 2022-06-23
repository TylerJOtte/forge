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

    /// The `Collection`'s `Suit`s.
    internal var suits: [Suit] { splitBySuit().allKeys }
    
    /// True if only has one `Suit`, else false.
    internal var hasOneSuit: Bool { suits.count == 1 }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if contains the given `Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter rank: The `Rank` to test.
    /// - Returns: True if  contains the given `Rank`, else false.
    internal func contains(_ rank: Rank) -> Bool {
        
        return contains(where: {$0.rank == rank})
    }
    
    /// Determines if contains `Joker`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if  contains one ore more`Jokers`, else false.
    internal func containJokers() -> Bool {
        
        return contains(.joker)
    }
    
    /// Determines if only contains the given `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter suit: The `Suit` to test.
    /// - Returns: True if only contains the given `Suit`, else false.
    func contain(other suit: Suit) -> Bool {
        
        return count > 0 && suits.contains(where: {$0 != suit})
    }
    
    /// Determines if only contains the given `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter suit: The `Suit` to test.
    /// - Returns: True if only contains the given `Suit`, else false.
    func contain(only suit: Suit) -> Bool {
        
        return hasOneSuit && suits.first == suit
    }
    
    /// Determines if the `Collection` has only one `Suit` wiht the given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `PlayingCard` to test with `Collection`.
    /// - Returns: True if only has one `Suit` with the given`Card`, else false.
    internal func hasOneSuit(with card: PlayingCard) -> Bool {
        
        return isEmpty || (hasOneSuit && card.suit == suits.first)
    }
    
    /// Determines if only contains the given `Suit`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter suits: The `Suit`s to test.
    /// - Returns: True if only contains the given `Suit`s, else false.
    func contain(only suits: [Suit]) -> Bool {
        
        var containsOnlySuits = false

        if (count > 0 && suits.count > 0) {
            
            let expected = Set(suits)
            let actual = self.suits
            
            if (actual.count == expected.count) {
                
                let otherSuits = actual.except(expected)
                
                containsOnlySuits = otherSuits.count == 0
            }
        }

        return containsOnlySuits
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    /// Retrieves the first `PlayingCard` with the given `Rank` and `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - rank: The `Rank` to filter by.
    ///   - suit: The `Suit` to filter by.
    /// - Returns: The first `PlayingCard` with the given `Rank` and `Suit`, or `nil` if none
    ///            exists.
    internal func first(_ rank: Rank, of suit: Suit) -> PlayingCard? {
        
        return first{$0.rank == rank && $0.suit == suit}
    }
     
    /// Retrieves the first `Jack` with the given `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter suit: The `Suit` to filter by.
    /// - Returns: The first `Jack` with the given `Suit`, or `nil` if none exists.
    internal func firstJack(of suit: Suit) -> Jack? {
        
        return first(.jack, of: suit) as? Jack
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
