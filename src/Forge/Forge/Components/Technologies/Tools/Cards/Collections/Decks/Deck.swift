//=============================================================================//
//                                                                             //
//  Deck.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 3/14/21.                                       //
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

/// A `Deck` of `Card`s.
public class Deck: Cards {

    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The minimum # of `Card`s allowed .
    public let minCards: Int
    
    /// The maximum # of `Card`s allowed.
    public let maxCards: Int
    
    /// The `Card`s.
    private var cards: [String : [Card]]
    
    /// The total # of `Card`s.
    public var count: Int { return cards.totalCount }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//

    /// Creates a default `Deck` of `Card`s.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Deck` can hold zero - Int.max `Card`s.
    ///   - The `Deck` is empty.
    ///   - The `Deck`'s title is set to "Deck".
    public init() {
        
        self.minCards = 0
        self.maxCards = Int.max
        self.cards = [:]
    }
    
    /// Creates a`Deck`with the given terms.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Deck` can hold zero to `Int.max Card`s.
    ///   - The `Deck` contains the given `Card`s.
    ///   - The `Deck`'s title is set to "Deck".
    /// - Parameter cards: The `Card`s to include in the `Deck`.
    public init(of cards: [Card]) {
        
        self.minCards = 0
        self.maxCards = Int.max
        self.cards = [:]
        
        try! add(cards)
    }
    
    /// Creates a`Deck`with the given terms.
    ///
    /// - Precondition:
    ///   - The given max must be  >= 1.
    ///   - The given `Card`s must contain zero to the specified max # of `Card`s.
    /// - Postcondition:
    ///   - The `Deck` can hold zero to the given max # of `Card`s.
    ///   - The `Deck` contains the given `Card`s.
    ///   - The `Deck`'s title is set to "Deck".
    /// - Parameters:
    ///   - max: The maximum # of `Card`s allowed in the `Deck`.
    ///   - cards: The `Card`s to include in the `Deck`.
    /// - Throws:
    ///   - `invalidMax` if the given max is &lt; 1.
    ///   - `invalidCount` if the given `Card`s contain more than the specified max # of `Card`s.
    public init(of max: Int,  _ cards: [Card]) throws {
        
        guard (max >= 1) else {
            
            print("The given max must be >= 1.")
            throw RangeError.invalidMax
        }
        
        guard (cards.count <= max) else {
            
            print("The given Cards can contain at most \(max) Cards.")
            throw ElementsError.invalidCount
        }
        
        self.minCards = 0
        self.maxCards = max
        self.cards = [:]
        
        try! add(cards)
    }
    
    /// Creates a`Deck`with the given terms.
    ///
    /// - Precondition:
    ///   - The given  min must be >= 0.
    ///   - The given max must be  >= 1 & >= specified min.
    ///   - The given `Card`s must contain the specified min to max # of `Card`s.
    /// - Postcondition:
    ///   - The `Deck` can hold the given min to max # of `Card`s.
    ///   - The `Deck` contains the given `Card`s.
    ///   - The `Deck`'s title is set to "Deck".
    /// - Parameters:
    ///   - min: The minimum # of `Card`s allowed in the `Deck`.
    ///   - max: The maximum # of `Card`s allowed in the `Deck`.
    ///   - cards: The `Card`s to include in the `Deck`.
    /// - Throws:
    ///   - `invalidMin` if the given min is &lt; 0.
    ///   - `invalidMax` if the given max is &lt; 1, or &lt; the specified min.
    ///   - `invalidCount` if the given `Card`s do not contain the specified min to max # of `Card`s.
    public init(of min: Int, to max: Int, _ cards: [Card]) throws {
        
        guard (min >= 0) else {
            
            print("The given min must be >= 0.")
            throw RangeError.invalidMin
        }
        
        guard (max >= 1) else {
            
            print("The given max must be >= 1.")
            throw RangeError.invalidMax
        }
        
        guard (max >= min) else {
            
            print("The given max must be >= the specified min.")
            throw RangeError.invalidMax
        }
        
        guard (cards.count >= min) else {

            print("The given Cards must contain at least \(min) Cards.")
            throw ElementsError.invalidCount
        }
        
        guard (cards.count <= max) else {
            
            print("The given Cards can contain at most \(max) Cards.")
            throw ElementsError.invalidCount
        }
        
        self.minCards = min
        self.maxCards = max
        self.cards = [:]
        
        try! add(cards)
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Testers                                 //
    //-------------------------------------------------------------------------//
    
    /// Determines if the collection is empty.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the collection is empty, else false.
    public func isEmpty() -> Bool {
        
        return count == 0
    }
    
    /// Determines if the collection is full.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the collection is full else false.
    public func isFull() -> Bool {
        
        return count == maxCards
    }
    
    /// Determines if a key exists for the given`Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to find key for.
    /// - Returns: True if a key exists for the  given `Card`, else false.
    private func containsKey(_ card: T) -> Bool {
        
        return cards.keys.contains(card.title)
    }
    
    /// Determines if the given `Card` exists.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to find.
    /// - Returns: True if the given `Card` exists, else false.
    public func contains(_ card: Card) -> Bool {
        
        return containsKey(card) && cards[card.title]!.count > 0
    }
    
    //-------------------------------------------------------------------------//
    //                                 Filters                                 //
    //-------------------------------------------------------------------------//
    
    /// Retrieves all the `Card`s that do not exist in the given `Collection`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter cards: The `Collection` to filter by.
    /// - Returns: An `Array` of `Card`s that do not exist in the given `Collection`.
    public func except<Cards>(_ cards: Cards) -> [Card] where Cards : Collection,
        Cards.Element == Card {
        
        return self.cards.allValueElements.except(cards)
    }
    
    //-------------------------------------------------------------------------//
    //                                  Adders                                 //
    //-------------------------------------------------------------------------//
    
    /// Adds the given `Card`.
    ///
    /// - Precondition: The `Deck` cannot be full.
    /// - Postcondition: The `Deck` contains the given `Card`.
    /// - Parameter card: The `card` to add to the `Deck`.
    /// - Throws: `RangeError.isFull` if the `Deck` is full.
    public func add(_ card: Card) throws {
        
        guard (!isFull()) else {
            
            throw RangeError.isFull
        }
        
        if (containsKey(card)) {
            
            cards[card.title]!.append(card)
            
        } else {
            
            cards[card.title] = [card]
        }
    }
    
    //-------------------------------------------------------------------------//
    //                                 Removers                                //
    //-------------------------------------------------------------------------//
    
    /// Removes the first istance of the given `Card` from the collection.
    ///
    /// - Precondition:
    ///   - The collection cannot be empty.
    ///   - The collection must contain the given `Card`.
    /// - Postcondition: The collection contains one less instance of the given `Card`.
    /// - Parameter card: The `Card` to remove from the collection.
    /// - Throws:
    ///   - `ElementsError.isEmpty` if the collection is empty.
    ///   - `ElementsError.notFound` if the collection doesn't contain the given `Card`.
    public func remove(_ card: Card) throws -> Card {
        
        guard (!isEmpty()) else {
            
            throw ElementsError.isEmpty
        }
        
        guard (contains(card)) else {
            
            throw ElementsError.notFound
        }
        
        return cards[card.title]!.removeLast()
    }
}
