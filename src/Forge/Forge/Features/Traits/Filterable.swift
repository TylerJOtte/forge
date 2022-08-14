//=============================================================================//
//                                                                             //
//  Filterable.swift                                                           //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 7/10/21.                                       //
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

/// A filterable `Trait`.
public protocol Filterable: Containable {
    
    /// Retrieves all the `{T}`s that do not exist in the given `Collection`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter {u}: The `Collection` to filter by.
    /// - Returns: An `Array` of `{T}`s that do not exist in the given `Collection`.
    func except<U>(_ u: U) -> [T] where U: Collection, U.Element == T
}
