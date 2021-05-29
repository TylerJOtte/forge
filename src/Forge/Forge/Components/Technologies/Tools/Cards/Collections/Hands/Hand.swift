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
    
    /// The total # of `Card`s.
    public var count: Int { return cards.count }
    
    /// The `Card`s.
    internal var cards: [T]
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a default `Hand` of `Card`s.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Hand` can hold zero - Int.max `Card`s.
    ///   - The `Hand` is empty.
    public init() {
        
        self.minCards = 0
        self.maxCards = Int.max
        self.cards = []
    }
    
    /// Creates a`Hand`with the given `Card`s and specified `max`.
    ///
    /// - Precondition:
    ///   - `max` must be  >= 1.
    ///   - The # of given `Card`s must be &lt;= `max`.
    /// - Postcondition:
    ///   - The `Hand` can hold zero to given max `Card`s.
    ///   - The `Hand` contains the given `Card`s.
    ///   - title = "Hand".
    /// - Parameters:
    ///   - cards: The `Card`s to create `Hand` with.
    ///   - max: The maximum # of `Card`s allowed in the `Hand`.
    /// - Throws:
    ///   - `RangeError.invalidMax` if the given max is &lt; one.
    ///   - `ElementsError.insufficientElements` if the # of given `Card`s > specified max.
    public init(of cards: [T], with max: Int = Int.max) throws {
        
       let min = 0
        
        guard (max >= 1) else {
            
            print("Max must be >= 1.")
            throw RangeError.invalidMax
        }
        
        guard (cards.count <= max) else {
            
            print("The # of given Cards must be <= to the specified max.")
            throw ElementsError.excessiveElements
        }
        
        self.minCards = min
        self.maxCards = max
        self.cards = []
        
        try! add(cards)
    }

    /// Creates a`Hand` with the given terms.
    ///
    /// - Precondition:
    ///   - `min` must be >= 0.
    ///   - `max` must be  >= 1.
    ///   - `max` must be >= `minCards`.
    ///   - The given `Card`s must contain the specified min to max # of `Card`s.
    /// - Postcondition:
    ///   - The `Hand` can hold the given min to max # of `Card`s.
    ///   - The `Hand` contains the given `Card`s.
    ///   - The `Hand`'s title is set to the name of the model.
    /// - Parameters:
    ///   - min: The minimum # of `Card`s allowed in the `Hand`.
    ///   - max: The maximum # of `Card`s allowed in the `Hand`.
    ///   - cards: The `Card`s to include in the `Kind`.
    /// - Throws:
    ///   - `invalidMin` if the given min is &lt; 0.
    ///   - `invalidMax` if the given max is &lt; 1, or &lt; the specified min.
    ///   - `invalidCount` if the given `Card`s do not contain the specified min to max # of `Card`s.
    public init(of min: Int, to max: Int, _ cards: [T]) throws {
        
        guard (min >= 0) else {
            
            print("Min must be >= 0.")
            throw RangeError.invalidMin
        }
        
        guard (max >= 1) else {
            
            print("Max must be >= 1.")
            throw RangeError.invalidMax
        }
        
        guard (max >= min) else {
            
            print("Max must be >= min.")
            throw RangeError.invalidMax
        }
        
        guard (cards.count >= min) else {

            print("The collection must contain at least \(min) Cards.")
            throw ElementsError.invalidCount
        }
        
        guard (cards.count <= max) else {
            
            print("The collection can contain at most \(max) Cards.")
            throw ElementsError.invalidCount
        }
        
        self.minCards = min
        self.maxCards = max
        self.cards = []

        try! add(cards)
    }
//
//    /// Creates a`Hand`with the given terms.
//    ///
//    /// - Precondition:
//    ///   - `min` must be >= 0.
//    ///   - `max` must be  >= 1.
//    ///   - `max` must be >= `minCards`.
//    ///   - The # of given `Card`s must be &lt;= `max`.
//    /// - Postcondition:
//    ///   - The `Hand` can hold zero to given max `Card`s.
//    ///   - The `Hand` contains the given `Card`s.
//    ///   - The `Hand`'s title is set to the given title.
//    ///   - title = given title.
//    /// - Parameters:
//    ///   - min: The minimum # of `Card`s allowed in the `Hand`.
//    ///   - max: The maximum # of `Card`s allowed in the `Hand`.
//    ///   - cards: The `Card`s to create `Hand` with.
//    ///   - title: The `Hand`'s primary name.
//    /// - Throws:
//    ///   - `RangeError.invalidMin` if the given min is &lt; zero.
//    ///   - `RangeError.invalidMax` if the given max is &lt; one or &lt; the specified min.
//    ///   - `ElementsError.insufficientElements` if the # of given `Card`s > specified max.
//    public init(of min: Int, to max: Int, _ cards: [T],
//                named title: String) throws {
//
//        guard (min >= 0) else {
//
//            print("Min must be >= 0.")
//            throw RangeError.invalidMin
//        }
//
//        guard (max >= 1) else {
//
//            print("Max must be >= 1.")
//            throw RangeError.invalidMax
//        }
//
//        guard (max >= min) else {
//
//            print("Max must be >= min.")
//            throw RangeError.invalidMax
//        }
//
//        guard (cards.count <= max) else {
//
//            print("The # of given Cards must be <= to the specified max.")
//            throw ElementsError.excessiveElements
//        }
//
//        self.minCards = min
//        self.maxCards = max
//        self.cards = []
//
//        try! add(cards)
//    }
    
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
