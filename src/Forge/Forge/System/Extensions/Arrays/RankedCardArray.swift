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
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  Kinds                                  //
    //-------------------------------------------------------------------------//
    
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
    
    func getKinds() -> [Kind] {
        
        let pairs: [Kind] = getPairs()
        let threeOfAKinds = getThreeOfAKinds()
        let fourOfAKinds = getFourOfAKinds()
        
        return [pairs, threeOfAKinds, fourOfAKinds].flatMap{$0}
    }
    
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

    func getSequences(over count: Int) throws -> [[RankedCard]] {
        
        return getSequences().filter{$0.count > count}
    }
    
    func getRuns() throws -> [Run] {
        
        let count = 2
        let sequences = try getSequences(over: count)
       
        return try sequences.map{try Run(of: $0)}
    }
    
    func getRunPoints() throws -> Int {
        
        return try getRuns().sumPoints()
    }
    
    func getPairPoints() -> Int {
        
        return getPairs().sumPoints()
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
