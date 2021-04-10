//=============================================================================//
//                                                                             //
//  ArrayExtension.swift                                                       //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/04/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//

/// An extension for common `Array` operations.
extension Array where Element: Comparable {
    
    /// Determines if all items in the collection are equal.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all items in the collection are equal, else false.
    func areEqual() -> Bool {
        
        return !self.contains(where: {$0 != self.first})
    }
    
}

/// An extension for common `PlayingCard Array` operations.
extension Array where Element: PlayingCard  {

    /// Determines if all `Card`s are in sequential order.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all `Card`s in the collection are in sequantial order else false.
    func areSequential() -> Bool {
        
        let lastCard = self.count - 1
        var areSequential = true
        var card = 0
        
        while (areSequential && card < lastCard) {
            
            let cardNextRank = self[card].rank.next
            let nextCardRank = self[card + 1].rank
            
            areSequential = cardNextRank == nextCardRank
            card += 1
        }
        
        return areSequential
    }
}

