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
extension Array where Element: Hashable {
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    /// Retrieves the duplicate items in the collection.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The duplicate items in the collection.
    func getDuplicates() -> [Element:[Element]] {
        
        return Dictionary(grouping: self, by: {$0}).filter({$0.value.count > 1})
    }
    
    /// Retrieves the count of each duplicate in the collection.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The count of each duplicate in the collection.
    func getDuplicateCounts() -> [Element:Int] {
        
        return getDuplicates().mapValues{ ($0.count * ($0.count - 1)) / 2 }
    }
    
    /// Retrieves the total duplicate count in the collection.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The total duplicate count in the collection.
    func getDuplicateCount() -> Int {
        
        return getDuplicateCounts().values.reduce(0, +)
    }
}

/// An extension for common `PlayingCard Array` operations.
extension Array where Element: PlayingCard  {

    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//

    /// Determines if all `Card`s in the collection have the same `Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all `Card`s in the collection have the same `Rank`, else false.
    func areEquallyRanked() -> Bool {
        
        return !self.contains(where: {$0.rank != self.first?.rank})
    }
    
    /// Determines if all `Card`s in the collection have the same `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all `Card`s in the collection have the same `Suit`, else false.
    func areEquallySuited() -> Bool {
        
        return !self.contains(where: {$0.suit != self.first?.suit})
    }
    
    /// Determines if all `Card`s are in sequential order.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter pairs: The # of pairs allowed  in sequential order, else false.
    /// - Returns: True if all `Card`s in the collection are in sequential order, with duplicates, else false.
    func areSequential(with pairs: Int = 0) -> Bool {
        
        var areSequential = false
        
        if (getDuplicateCount() == pairs) {
            
            let lastCard = self.count - 1
            var card = 0
            
            areSequential = true

            while (areSequential && card < lastCard) {
                
                let nextRank = self[card].rank.next
                let nextCardRank = self[card + 1].rank
                let comparison = nextCardRank == nextRank

                areSequential = pairs == 0 ? comparison :
                    comparison || nextCardRank == self[card].rank
                
                card += 1
            }
                
        } else {
            
            print("The collection contains more pairs than allowed.")
        }
        
        return areSequential
    }
    
    //=========================================================================//
    //                               CALCULATORS                               //
    //=========================================================================//
    
    /// Retrieves the sum total of points from all the `Card`s in the collection.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The sum total of points from all the `Card`s in the collection.
    func sum() -> Int {
        
        return self.map{$0.points}.reduce(0, +)
    }
    
}

