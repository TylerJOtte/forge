//=============================================================================//
//                                                                             //
//  Cards.swift                                                                //
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

/// A collection of `Card`s.
public protocol Cards: Tool, Elements where T: Card {
    
    /// The minimum # of `Card`s allowed.
    ///
    /// - Precondition: Must be >= 0.
    var minCards: Int { get }
    
    /// The maximum # of `Card`s allowed.
    ///
    /// - Precondition:
    ///   - Must be >= 1.
    ///   - Must be >= `minCards`.
    var maxCards: Int { get }
}

extension Cards {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The total # of `Card`s that can be added to the collection.
    var capacity: Int { return maxCards - count }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Determines if the given left-handside`Cards` equals the specified right-handside `Cards`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Cards` to compare against.
    ///   - rhs: The `Cards` to compare to.
    /// - Returns: True if the left-handside`Cards` equals the right-handside `Cards`, else false.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        
        return lhs.equals(rhs)
    }
    
    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Determines if the `Cards` is less than the given `Cards`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Cards` to compare to.
    /// - Returns: True if the `Cards` is less than the given `Cards` else false.
    public func isLessThan(_ rhs: Self) -> Bool {
        
        return count < rhs.count
    }
    
    /// Determines if the given left-handside`Cards` is less than the specified right-handside `Cards`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Cards` to compare against.
    ///   - rhs: The `Cards` to compare to.
    /// - Returns: True if the left-handside`Hand` is less than the right-handside `Cards`, else false.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        
        return lhs.isLessThan(rhs)
    }
    
    //-------------------------------------------------------------------------//
    //                                  isLevel()                              //
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
    
    /// Determines if the collection has capacity to add all of the given `Card`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter cards: The `Card`s to add to the collection.
    /// - Returns: True if the collection can add all of the given `Card`s, else false.
    func hasCapacity(for cards: [Card]) -> Bool {
        
        return cards.count <= capacity
    }
    
    //-------------------------------------------------------------------------//
    //                                 contains()                              //
    //-------------------------------------------------------------------------//
    
    /// Determines if all `Card`s in the given collection exist.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card`s to find.
    /// - Returns: True if all `Card`s in the given collection exist, else false.
    public func contains(_ cards: [T]) -> Bool {
        
        var containsCards = true
        var card = 0
        
        while (containsCards && card < cards.count) {
            
            containsCards = contains(cards[card])
            
            card += 1
        }
        
        return containsCards
    }
    
    //=========================================================================//
    //                                  ADDERS                                 //
    //=========================================================================//
    
    /// Adds the given collection of `Card`s.
    ///
    /// - Precondition:
    ///    - The `Card`s cannot be full.
    ///    - The `Card`s must have capacity to add all of the given `Card`s.
    /// - Postcondition: The `Card`s contain the given collection's `Card`s.
    /// - Parameter cards: The collection of `Cards`s to add to the `Card`s.
    /// - Throws:
    ///   - `RangeError.isFull` if the `Card`s are full.
    ///   - `RangeError.limitedCapacity` if all of the given collection's `Card`s  cannot be added.
    public func add(_ cards: [T]) throws {
        
        guard (!isFull()) else {
            
            throw RangeError.isFull
        }
        
        guard (hasCapacity(for: cards)) else {
            
            throw RangeError.limitedCapacity
        }
        
        for card in cards {
            
            try add(card)
        }
    }
    
    //=========================================================================//
    //                                 REMOVERS                                //
    //=========================================================================//
    
    /// Removes all instances of the given `Card`s.
    ///
    /// - Precondition:
    ///   - It cannot be empty.
    ///   - All of the given `Card`s must exist.
    /// - Postcondition: Zero instances of the given `Card`s exist.
    /// - Parameter card: The `Card`s to remove from the collection.
    /// - Throws:
    ///   - `isEmpty` if is empty.
    ///   - `notFound` if one of the given `Card`s does not exist.
    public func remove(_ cards: [T]) throws -> [T] {
        
        guard (!isEmpty()) else {
            
            print("No Cards exist.")
            throw ElementsError.isEmpty
        }
        
        guard (contains(cards)) else {
            
            print("Not all of the given Cards exist.")
            throw ElementsError.notFound
        }
        
        var card = 0
        var removedCards: [T] = []
        
        while (!isEmpty() && card < cards.count) {
            
            let removedCard = try remove(cards[card])
            
            removedCards.append(removedCard)
            card += 1
        }
        
        return removedCards
    }
}
