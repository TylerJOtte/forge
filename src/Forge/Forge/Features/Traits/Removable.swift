//=============================================================================//
//                                                                             //
//  Removable.swift                                                            //
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

/// A removable `Trait`.
public protocol Removable: Addable {
    
    /// Removes the given `T` from the {model}.
    ///
    /// - Precondition:
    ///   - The {model} cannot be empty.
    ///   - The {model} must contain the given `T`.
    /// - Postcondition: The {model} does not contain the given `T`.
    /// - Parameter t: The `T` to remove from the {model}.
    /// - Throws:
    ///   - `RangeError.isEmpty` if the collection is empty.
    ///   - `ElementsError.notFound` if the collection doesn't contain the given `T`.
    func remove(_ t: T) throws -> T
}
