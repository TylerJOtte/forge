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
    /// - Precondition: `count` >= 2.
    /// - Postcondition: None.
    /// - Returns: True if all `Card`s are in sequential order, else false.
    /// - Throws: `ElementsError.insufficientElements` if count &lt; 2.
    func areSequential() throws -> Bool {
        
        let min = 2
        
        guard (count >= min) else {
            
            print("The collection must contain at least \(min) Cards.")
            throw ElementsError.insufficientElements
        }
        
        let lastCard = count - 1
        var areSequential = true
        var card = 0
        
        while (areSequential && card < lastCard) {
            
            let nextRank = self[card].rank.next
            let nextCardRank = self[card + 1].rank
            
            areSequential = nextRank == nextCardRank
            card += 1
        }
        
        return areSequential
    }
    
    /// Determines if all `Card`s are in sequential order with the given # of pairs.
    ///
    /// - Precondition:
    ///    - `count` >= three.
    ///    - The # of given pairs must be >= one.
    ///    - Must contain the specified # of pairs.
    /// - Postcondition: None.
    /// - Returns: True if all `Card`s are in sequential order with the given # of pairs, else false.
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s ontain less than four
    ///      `Card`s.
    ///    - `ElementsError.invalidDuplicateCount` if the given `Card`s doesn't contain the
    ///       specified # of pairs.
    ///    - `RangeError.invalidMin` if the # of specified pairs &lt;= zero.
    func areSequential(with pairs: Int) throws -> Bool {
        
        let min = 3
        let pairMin = 1
        let pairCount = getDuplicateCount()
        let s = pairs > 1 ? "s" : ""
        
        guard (count >= min) else {
            
            print("The collection must contain at least \(min) Cards.")
            throw ElementsError.insufficientElements
        }
        
        guard (pairs >= pairMin) else {
            
            print("The # of given pairs must be >= \(pairMin).")
            throw RangeError.invalidMin
        }
        
        guard (pairCount == pairs) else {
            
            print("The collection must contain \(pairs) pair\(s).")
            throw ElementsError.invalidDuplicateCount
        }
        
        let lastCard = count - 1
        var areSequential = true
        var card = 0
        
        while (areSequential && card < lastCard) {
            
            let rank = self[card].rank
            let nextRank = self[card].rank.next
            let nextCardRank = self[card + 1].rank
            let isSequential = nextCardRank == nextRank
            let isPair = nextCardRank == rank
            
            areSequential = isSequential || isPair
            card += 1
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

