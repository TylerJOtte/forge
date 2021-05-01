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
    public func add(_ cards: [Card]) throws {
        
        guard (!isFull()) else {
            
            throw RangeError.isFull
        }
        
        guard (hasCapacity(for: cards)) else {
            
            throw RangeError.limitedCapacity
        }
        
        for card in cards {
            
            try add(card as! Self.T)
        }
    }
}
