//=============================================================================//
//                                                                             //
//  RankedCardCollection.swift                                                      //
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

import Foundation

/// An extension for common `RankedCard Collection` operations.
extension Collection where Element: RankedCard  {
    
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
        
        var rankedCards = Array(self)
        var areSequential = true
        var index = 0
        
        while (areSequential && index < rankedCards.count - 1) {
            
            let rankedCard = rankedCards[index]
            let nextRankedCard = rankedCards[index + 1]
            
            areSequential = nextRankedCard.follows(rankedCard)
            index += 1
        }
        
        return areSequential
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//

    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//

    /// Retrieves the # of `RankedCard`s that contain the given `Rank`.
    ///
    /// - Parameter rank: The `Rank` to compare to.
    /// - Returns: An integer representing the total count of the given `Rank`.
    func getCount(of rank: Rank) -> Int {
        
        return splitByRank()[rank]? ?? 0
    }
    
    //-------------------------------------------------------------------------//
    //                                  Kinds                                  //
    //-------------------------------------------------------------------------//
    
    //       //
    // Pairs //
    //       //
    
    /// Retrieves all the contained `Pair`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An `Array` of all the contained `Pair`s.
    func getPairs() -> [Pair] {
        
        let count = 1
        let cardsByRank = splitByRank(over: count)
        var pairs: [Pair] = []
        
        for rank in cardsByRank {
            
            let rankCards = rank.value
            var position = 0
            
            while (position < rankCards.count - 1)
            {
                var index = position

                while (index < rankCards.count - 1) {
                    
                    let card = rankCards[index]
                    let nextCard = rankCards[index + 1]
                    let cards = [card, nextCard]
                    
                    // Okay to force unwrap - cards will always form a Pair
                    let pair = try! Pair(of: cards)
                    
                    pairs.append(pair)
                    index += 1
                }
                
                position += 1
            }
        }
        
        return pairs
    }
    
    //               //
    // ThreeOfAKinds //
    //               //
    
    /// Retrieves all the contained `ThreeOfAKind`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An `Array` of all the contained `ThreeOfAKind`s.
    func getThreeOfAKinds() -> [ThreeOfAKind] {
        
        let count = 2
        let cardsByRank = splitByRank(over: count)
        var threeOfAKinds: [ThreeOfAKind] = []
        
        for rank in cardsByRank {
            
            let rankCards = rank.value
            var position = 0
            
            while (position < rankCards.count - 2)
            {
                var index = position

                while (index < rankCards.count - 2) {
                    
                    let card1 = rankCards[index]
                    let card2 = rankCards[index + 1]
                    let card3 = rankCards[index + 2]
                    let cards = [card1, card2, card3]
                    
                    // Okay to force unwrap - cards will always form a
                    // ThreeOfAKind
                    let threeOfAKind = try! ThreeOfAKind(of: cards)
                    
                    threeOfAKinds.append(threeOfAKind)
                    index += 1
                }
                
                position += 1
            }
        }
        
        return threeOfAKinds
    }
    
    //              //
    // FourOfAKinds //
    //              //
    
    /// Retrieves all the contained `FourOfAKind`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An `Array` of all the contained `FourOfAKind`s.
    func getFourOfAKinds() -> [FourOfAKind] {
        
        let count = 3
        let cardsByRank = splitByRank(over: count)
        var fourOfAKinds: [FourOfAKind] = []
        
        for rank in cardsByRank {
            
            let rankCards = rank.value
            var position = 0
            
            while (position < rankCards.count - 3)
            {
                var index = position

                while (index < rankCards.count - 3) {
                    
                    let card1 = rankCards[index]
                    let card2 = rankCards[index + 1]
                    let card3 = rankCards[index + 2]
                    let card4 = rankCards[index + 3]
                    let cards = [card1, card2, card3, card4]
                    
                    // Okay to force unwrap - cards will always form a
                    // FourOfAKind
                    let fourOfAKind = try! FourOfAKind(of: cards)
                    
                    fourOfAKinds.append(fourOfAKind)
                    index += 1
                }
                
                position += 1
            }
        }
        
        return fourOfAKinds
    }
    
    //-------------------------------------------------------------------------//
    //                                Sequences                                //
    //-------------------------------------------------------------------------//
    
    /// Retrieves all the sequences.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An `Array` of `RankedCard Array` sequences.
    func getSequences() -> [[RankedCard]] {
        
        let cards = sorted()
        let lastIndex = cards.count - 1
        var index = 0
        var sequenceIndex = 0
        var card = cards[index]
        var sequences = cards.count > 0 ? [[card]] : [[]]
        
        while (index < lastIndex) {
            
            let nextCard = cards[index + 1]
            card = cards[index]
            
            if (nextCard.follows(card)) {
                
                for sequence in sequenceIndex..<sequences.count {
                    
                    sequences[sequence].append(nextCard)
                }
            
            } else if (nextCard.ranks(card)) {
             
                addBases(from: sequenceIndex, with: nextCard, to: &sequences)
                
            } else {
                
                sequences.append([nextCard])
                sequenceIndex += 1
            }
            
            index += 1
        }
        
        return sequences.filter{$0.count > 1}
    }

    
    /// Retrieves all the sequences that have a count greater than the given value.
    ///
    /// - Precondition: The given count must be >= 1.
    /// - Parameter count: The min # of `RankedCard`s in a sequence to filter for.
    /// - Throws: `invalidMin` if the given count is &lt; 1.
    /// - Returns: An `Array` of sequential `RankedCard Array`s with counts >= than given count.
    func getSequences(over count: Int) throws -> [[RankedCard]] {
        
        let min = 1
        
        guard (count >= min) else {
            
            print("The given count must be >= \(min).")
            throw RangeError.invalidMin
        }
        
        return getSequences().filter{$0.count > count}
    }
    
    //-------------------------------------------------------------------------//
    //                                   Runs                                  //
    //-------------------------------------------------------------------------//
    
    func getRuns() throws -> [Run] {
        
        let count = 2
        let sequences = try getSequences(over: count)
       
        return try sequences.map{try Run(of: $0)}
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
