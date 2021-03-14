//=============================================================================//
//                                                                             //
//  Elements.swift                                                             //
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

/// A collection of `Element`s.
public protocol Elements {
    
    /// The type of `Element` that the collection contains.
    associatedtype T
    
    /// Determines if the collection is empty.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the collection is empty, else false.
    func isEmpty() -> Bool
    
    /// Determines if the collection is full.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the collection is full else false.
    func isFull() -> Bool
    
    /// Determines if the given `T` exists.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter t: The `T` to find.
    /// - Returns: True if the given `T` exists, else false.
    func contains(_ t: T) -> Bool
    
    /// Adds the given `T` to the collection.
    ///
    /// - Precondition: The collection cannot be full.
    /// - Postcondition: The collection contains the given `T`.
    /// - Parameter t: The `T` to add to the collection.
    func add(_ t: T)
    
    /// Removes the first istance of the given `T` from the collection.
    ///
    /// - Precondition:
    ///   - The collection cannot be empty.
    ///   - The collection must contain the given `T`.
    /// - Postcondition: The collection contains one less instance of the given `T`.
    /// - Parameter t: The `T` to remove from the collection.
    func remove(_ t: T) -> T
}
