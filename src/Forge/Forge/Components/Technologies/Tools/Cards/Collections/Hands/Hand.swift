//=============================================================================//
//                                                                             //
//  Hand.swift                                                                 //
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

/// A `Hand` of `Card`s.
public class Hand: Cards {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The minimum # of `Card`s allowed .
    public let minCards: Int
    
    /// The maximum # of `Card`s allowed.
    public let maxCards: Int
    
    /// The `Card`s.
    private var cards: [Card]
    
    /// The total # of `Card`s.
    public var count: Int { return cards.count }
    
    /// The `Hand`'s first `Card`.
    public var first: Card? { return cards.first }
    
    /// The `Hand`'s last `Card`.
    public var last: Card? { return cards.last }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a default `Hand` of `Card`s.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Hand` can hold zero - Int.max `Card`s.
    ///   - The `Hand` is empty.
    ///   - The `Hand`'s title is set to "Hand".
    public init() {
        
        self.minCards = 0
        self.maxCards = Int.max
        self.cards = []
    }
    
    /// Creates a`Hand`with the given terms.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Hand` can hold zero to `Int.max Card`s.
    ///   - The `Hand` contains the given `Card`s.
    ///   - The `Hand`'s title is set to "Hand".
    /// - Parameter cards: The `Card`s to include in the `Hand`.
    public init(of cards: [Card]) {
        
        self.minCards = 0
        self.maxCards = Int.max
        self.cards = cards
    }
    
    /// Creates a`Hand`with the given terms.
    ///
    /// - Precondition:
    ///   - The given max must be  >= 1.
    ///   - The given `Card`s must contain zero to the specified max # of `Card`s.
    /// - Postcondition:
    ///   - The `Hand` can hold zero to the given max # of `Card`s.
    ///   - The `Hand` contains the given `Card`s.
    ///   - The `Hand`'s title is set to "Hand".
    /// - Parameters:
    ///   - max: The maximum # of `Card`s allowed in the `Hand`.
    ///   - cards: The `Card`s to include in the `Hand`.
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
        self.cards = cards
    }

    /// Creates a`Hand`with the given terms.
    ///
    /// - Precondition:
    ///   - The given  min must be >= 0.
    ///   - The given max must be  >= 1 & >= specified min.
    ///   - The given `Card`s must contain the specified min to max # of `Card`s.
    /// - Postcondition:
    ///   - The `Hand` can hold the given min to max # of `Card`s.
    ///   - The `Hand` contains the given `Card`s.
    ///   - The `Hand`'s title is set to "Hand".
    /// - Parameters:
    ///   - min: The minimum # of `Card`s allowed in the `Hand`.
    ///   - max: The maximum # of `Card`s allowed in the `Hand`.
    ///   - cards: The `Card`s to include in the `Hand`.
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
        self.cards = cards
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
        
        return cards.count == 0
    }
    
    /// Determines if the collection is full.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the collection is full else false.
    public func isFull() -> Bool {
        
        return cards.count == maxCards
    }
    
    /// Determines if the given `Card` exists.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to find.
    /// - Returns: True if the given `Card` exists, else false.
    public func contains(_ card: Card) -> Bool {
        
        return cards.contains(card)
    }
    
    /// Determines if the given `Card` exists.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to find.
    /// - Returns: True if the given `Card` exists, else false.
    public func contains(_ card: Card?) -> Bool {
        
        var containsCard = false
        
        if let value = card {
            
            containsCard = contains(value)
        }
        
        return containsCard
    }
    
    //-------------------------------------------------------------------------//
    //                                  Adders                                 //
    //-------------------------------------------------------------------------//
    
    /// Adds the given `Card`.
    ///
    /// - Precondition: The `Hand` cannot be full.
    /// - Postcondition: The `Hand` contains the given `Card`.
    /// - Parameter card: The `Card` to add to the `Hand`.
    /// - Throws: `RangeError.isFull` if the `Hand` is full.
    public func add(_ card: Card) throws {
        
        guard (!isFull()) else {
            
            throw RangeError.isFull
        }
        
        cards.append(card)
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
        
        let index = cards.firstIndex(where: {$0 == card})!
        
        return cards.remove(at: index)
    }
}
