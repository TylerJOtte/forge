//=============================================================================//
//                                                                             //
//  Addable.swift                                                              //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/01/21.                                       //
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

/// An addable characteristic.
public protocol Addable: Containable {
    
    /// Adds the given `T`.
    ///
    /// - Precondition: The {model} cannot be full.
    /// - Postcondition: The {model} contains the given `T`.
    /// - Parameter t: The `T` to add to the {model}.
    /// - Throws: `RangeError.isFull` if the {model} is full.
    func add(_ t: T) throws
    
    /// Adds the given collection of `T`s.
    ///
    /// - Precondition:
    ///    - The {model} cannot be full.
    ///    - The {model} must have capacity to add all of the given `T`s.
    /// - Postcondition: The {model} contain{s} the given collection's `T`s.
    /// - Parameter ts: The collection of `T`s to add to the {model}.
    /// - Throws:
    ///   - `RangeError.isFull` if the {model} {is/are} full.
    ///   - `RangeError.limitedCapacity` if all of the given collection's `T`s  cannot be added.
    func add(_ ts: [T]) throws
}
