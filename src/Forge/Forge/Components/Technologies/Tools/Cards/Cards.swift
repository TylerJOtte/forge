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
    
    /// The total # of `Card`s.
    var count: Int { get }
}

extension Cards {
    
    /// The total # of `Card`s that can be added to the collection.
    var capacity: Int { return maxCards - count }
    
    
    /// Determines if the collection has capacity to add all of the given `Card`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter cards: The `Card`s to add to the collection.
    /// - Returns: True if the collection can add all of the given `Card`s, else false.
    func hasCapacity(for cards: [Card]) -> Bool {
        
        return cards.count <= capacity
    }
    
    /// Adds the given `Card`s to the collection.
    ///
    /// - Precondition:
    ///   - The collection cannot be full.
    ///   - The collection must have capacity to add all of the given `Card`s.
    /// - Postcondition: The collection contains the given `Card`s.
    /// - Parameter cards: The `Card`s to add to the collection.
    /// - Throws:
    ///   - `ElementsError.isFull` if the collection is full.
    ///   - `ElementsError.insufficientCapacity` if all of the given `Card`s cannot be added.
    public func add(_ cards: [Card]) throws {
        
        guard (!isFull()) else {
            
            throw ElementsError.isFull
        }
        
        guard (hasCapacity(for: cards)) else {
            
            throw ElementsError.insufficientCapacity
        }
        
        for card in cards {
            
            try add(card as! Self.T)
        }
    }
}
