//=============================================================================//
//                                                                             //
//  RankedCardArray.swift                                                      //
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

/// An extension for common `RankedCard Array` operations.
extension Array where Element: RankedCard  {
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//

    /// Determines if all the `RankedCard`s contain the same`Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all the `RankedCard`s contain the same`Rank`, else false.
    func areEquallyRanked() -> Bool {
        
        return splitByRank().count == 1
    }
    
    /// Determines if all the `RankedCard`s are in sequential order.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all the `RankeCard`s are in sequential order, else false.
    func areSequential() -> Bool {
        
        var areSequential = true
        var index = 0
        
        while (areSequential && index < count - 1)
        {
            let card = self[index]
            let nextCard = self[index + 1]

            areSequential = nextCard.follows(card)
            index += 1
        }
        
        return areSequential
    }

    func formRun(with kind: Kind?) -> Bool {
        
        var formRun = false
        var cards = splitBySingleRanks()
        
        do {
            
            if let card = kind?.first {
                
                cards.append(card)
                _ = try Run(of: cards.sorted())
                formRun = true
            
            }
        
        } catch {
            
            print(error)
        }
        
        return formRun
    }
    
    func formRun(with cards: [RankedCard?]) -> Bool {
        
        var singleRanks = splitBySingleRanks()
        var formRun = false

        do {
            
            singleRanks.append(contentsOf: cards.compactMap{$0})
            _ = try Run(of: singleRanks.sorted())
            formRun = true
            
        } catch {
            
            print(error)
        }
        
        return formRun
    }
    
    func formRuns(with kinds: [Kind]) -> Bool {
        
        var formRuns = true
        var index = 0
        
        while (formRuns && index < kinds.count) {
            
            formRuns = formRun(with: kinds[index])
            index += 1
        }
        
        return formRuns
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//

    
    func getPairs() throws -> [Pair] {
        
        let count = 2
        let cards = splitByRank(where: count)

        return  try cards.map{try Pair(of: $1)}
    }
    
    func getThreeOfAKinds() throws -> [ThreeOfAKind] {
        
        let count = 3
        let cards = splitByRank(where: count)
        
        return try cards.map{try ThreeOfAKind(of: $1)}
    }
    
    func getFourOfAKinds() throws -> [FourOfAKind] {
        
        let count = 4
        let cards = splitByRank(where: count)
        
        return try cards.map{try FourOfAKind(of: $1)}
    }
    
    func getKinds() throws -> [Kind] {
        
        let pairs: [Kind] = try getPairs()
        let threeOfAKinds = try getThreeOfAKinds()
        let fourOfAKinds = try getFourOfAKinds()

        return [pairs, threeOfAKinds, fourOfAKinds].flatMap{$0}
    }
    
    /// Retrieves the sum total of points from all the `Card`s in the collection.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The sum total of points from all the `Card`s in the collection.
    func getRunCardCount(with kinds: [Kind]) -> Int {
        
        return splitBySingleRanks().count + kinds.count
    }
    
 
    /// Retrieves the sum total of points from all the `Card`s in the collection.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The sum total of points from all the `Card`s in the collection.
    func getRunPoints(with kinds: [Kind]) -> Int {
        
        let kindCardCount = kinds.sumCounts()
        let runCardCount = getRunCardCount(with: kinds)
        
        return runCardCount * kindCardCount
    }
    
    func getRunPoints() throws -> Int {
        
        let kinds = try getKinds()
        let kindPoints = kinds.sumPoints()
        let runPoints = getRunPoints(with: kinds)
        
        return kindPoints + runPoints
    }
    
    func splitBySingleRanks() -> [RankedCard] {

        let count = 1
        let cards = splitByRank(where: count)
        
        return cards.flatMap{$0.value}
    }
    
    //=========================================================================//
    //                               SPLITTERS                                 //
    //=========================================================================//

    /// Splits all the `RankedCard`s  by `Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A dictionary with `Rank:RankedCard Array` entries.
    func splitByRank() -> [Rank:[RankedCard]] {
        
        return Dictionary(grouping: self, by: {$0.rank})
    }
    
    /// Splits all the `RankedCard`s  by `Rank` where a `Rank`'s count is equal to the given count.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter count: The count a `Rank` must equal to be included in split.
    /// - Returns: A dictionary with `Rank:RankedCard Array` entries.
    func splitByRank(where count: Int) -> [Rank:[RankedCard]] {
        
        return splitByRank().filter{$1.count == count}
    }
    
    /// Splits all the `RankedCard`s  by `Rank` where a `Rank`'s count is greater than the given count.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter count: The count a `Rank` must be over  to be included in split.
    /// - Returns: A dictionary with `Rank:RankedCard Array` entries.
    func splitByRank(over count: Int) -> [Rank:[RankedCard]] {
        
        return splitByRank().filter{$1.count > count}
    }
}
