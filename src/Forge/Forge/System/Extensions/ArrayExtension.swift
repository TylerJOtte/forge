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


/// An extension for common `RankedCard Array` operations.
extension Array where Element: Scoreable  {

    //=========================================================================//
    //                               CALCULATORS                               //
    //=========================================================================//
    
    /// Retrieves the sum total of points from all the `Card`s in the collection.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The sum total of points from all the `Card`s in the collection.
    func sumPoints() -> Int {
        
        return self.map{$0.points}.reduce(0, +)
    }
    
}

/// An extension for common `RankedCard Array` operations.
extension Array where Element: Cards {

    //=========================================================================//
    //                               CALCULATORS                               //
    //=========================================================================//
    
    /// Retrieves the sum total of points from all the `Card`s in the collection.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The sum total of points from all the `Card`s in the collection.
    func sumCounts() -> Int {
        
        return self.map{$0.count}.reduce(0, +)
    }
    
}





/// An extension for common `RankedCard Array` operations.
extension Array where Element: RankedCard  {

    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//

    /// Determines if all the `Card`s in the given collection contain the same`Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all the `Card`s in the given collection contain the same`Rank`, else false.
    func areEquallyRanked() -> Bool {
        
        return splitByRank().count == 1
    }
    
    /// Determines if all the `Card`s in the given collection are in sequential order.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all the `Card`s in the given collection are in sequential order, else false.
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
    
    func getRuns(with kinds: [Kind]) throws -> [Run] {
        
        var runs: [Run] = []
        
        var cardsBySingleRanks = splitBySingleRanks().sorted()
        
        var cards = [try Ace(of: .hearts), try Two(of: .hearts), try Three(of: .hearts)]
        var hand = try Hand(of: cards)
        
        
        for card in hand {
            
            
        }
        return runs
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

    /// Retrieves all the `Card`s in the given collection by `Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A dictionary with the `Rank`s as keys and their respective `Card`s as the values.
    func splitByRank() -> [Rank:[RankedCard]] {
        
        return Dictionary(grouping: self, by: {$0.rank})
    }
    
    /// Retrieves all the `Card`s in the given collection by `Rank` where equal to the given count.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter count: The count a `Rank` must have to be included in collection.
    /// - Returns: A dictionary with the `Rank`s as keys and their respective `Card`s as the values.
    func splitByRank(where count: Int) -> [Rank:[RankedCard]] {
        
        return splitByRank().filter{$1.count == count}
    }
    
    /// Retrieves all the `Card`s in the given collection by `Rank` where gerater than the given count.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter count: The count a `Rank` must have to be included in collection.
    /// - Returns: A dictionary with the `Rank`s as keys and their respective `Card`s as the values.
    func splitByRank(over count: Int) -> [Rank:[RankedCard]] {
        
        return splitByRank().filter{$1.count > count}
    }
    
//    //=========================================================================//
//    //                               CALCULATORS                               //
//    //=========================================================================//
//
//    /// Retrieves the sum total of points from all the `Card`s in the collection.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: The sum total of points from all the `Card`s in the collection.
//    func sum() -> Int {
//
//        return self.map{$0.points}.reduce(0, +)
//    }
    
}

/// An extension for common `PlayingCard Array` operations.
extension Array where Element: PlayingCard  {

    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if all the `Card`s in the given collection contain the same`Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all the `Card`s in the given collection contain the same`Suit`, else false.
    func areEquallySuited() -> Bool {
        
        return splitBySuit().count == 1
    }
    
//    /// Determines if all `Card`s are in sequential order.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: True if all `Card`s are in sequential order, else false.
//    func areSequential() -> Bool {
//
//        let lastCard = count - 1
//        var areSequential = true
//        var index = 0
//
//        while (areSequential && index < lastCard) {
//
//            let card = self[index]
//            let nextCard = self[index + 1]
//
//            areSequential = nextCard.follows(card)
//            index += 1
//        }
//
//        return areSequential
//    }
    
//    /// Determines if all `Card`s are in sequential order with the given # of pairs.
//    ///
//    /// - Precondition:
//    ///    - `count` >= three.
//    ///    - The # of given pairs must be >= one.
//    ///    - Must contain the specified # of pairs.
//    /// - Postcondition: None.
//    /// - Parameters:
//    ///    - pairs: The # of paris that the collection contains.
//    ///    - high: True if `.ace` is high, else false.
//    ///    - groups: True if multiple pair groups allowed, else false.
//    /// - Returns: True if all `Card`s are in sequential order with the given # of pairs, else false.
//    /// - Throws:
//    ///    - `ElementsError.insufficientElements` if contains less than four `Card`s.
//    ///    - `ElementsError.invalidDuplicateCount` if
//    ///       - Doesn't contain the specified # of pairs, or
//    ///       - Specified groups is false, and `Card`s contain multiple pair groups
//    ///    - `RangeError.invalidMin` if the # of specified pairs &lt;= zero.
//    func areSequential(with pairs: Int, ace high: Bool = false,
//                       multiple groups: Bool = true) throws -> Bool {
//
//        let min = 3
//        let pairMin = 1
//        let pairGroups = getPairCounts()
//        let pairGroupCount = pairGroups.count
//        let pairCount = getPairCount(from: pairGroups)
//        let s = pairs > 1 ? "s" : ""
//
//        guard (count >= min) else {
//
//            print("The collection must contain at least \(min) Cards.")
//            throw ElementsError.insufficientElements
//        }
//
//        guard (pairs >= pairMin) else {
//
//            print("The # of given pairs must be >= \(pairMin).")
//            throw RangeError.invalidMin
//        }
//
//        guard (pairCount == pairs) else {
//
//            let tenet = pairCount < pairs ? "" : "only "
//            print("The collection must contain \(tenet)\(pairs) pair\(s).")
//            throw ElementsError.invalidDuplicateCount
//        }
//
//        if (!groups && pairGroupCount > 1) {
//
//            print("The collection must contain only one grouping of pairs.")
//            throw ElementsError.invalidDuplicateCount
//        }
//
//        let lastCard = count - 1
//        var areSequential = true
//        var card = 0
//
//        while (areSequential && card < lastCard) {
//
//            let rank = self[card].position
//            let nextRank = self[card].position + 1
//            let nextCardRank = self[card + 1].position
//            let isSequential = nextCardRank == nextRank
//            let isPair = nextCardRank == rank
//
//            areSequential = isSequential || isPair
//            card += 1
//        }
//
//        return areSequential
//    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//

    
//    /// Retrieves the duplicate items in the collection.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: The duplicate items in the collection.
//    func getPairs() -> [Rank:[PlayingCard]] {
//
//        return Dictionary(grouping: self, by: {$0.rank})
//            .filter({$0.value.count > 1})
//    }
    
//    /// Retrieves the count of each duplicate in the collection.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: The count of each duplicate in the collection.
//    func getPairCounts() -> [Rank:Int] {
//
//        return getPairs().mapValues{ ($0.count * ($0.count - 1)) / 2 }
//    }
//
//    /// Retrieves the total duplicate count in the collection.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: The total duplicate count in the collection.
//    func getPairCount() -> Int {
//
//        return getPairCounts().values.reduce(0, +)
//    }
//
//    /// Retrieves the total duplicate count in the given collection.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Parameter pairs: The pairs to get duplicate count from.
//    /// - Returns: The total duplicate count in the given collection.
//    func getPairCount(from pairs: [Rank:Int]) -> Int {
//
//        return pairs.values.reduce(0, +)
//    }
    
    /// Splits all the `Card`s in the given collection by `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A dictionary with the `Suit`s as keys and their respective `Card`s as the values.
    func splitBySuit() -> [Suit:[PlayingCard]] {
        
        return Dictionary(grouping: self, by: {$0.suit})
    }
    

}

