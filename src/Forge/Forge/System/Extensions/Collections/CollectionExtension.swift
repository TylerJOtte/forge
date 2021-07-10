//=============================================================================//
//                                                                             //
//  CollectionExtension.swift                                                  //
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


/// An `extension` for common `Collection` operations.
extension Collection {

    /// Retrieves all the `Element`s that do not exist in the given `Collection`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter collection: The `Collection` to filter by.
    /// - Returns: An `Array` of `Element`s that do not exist in the given `Collection`.
    public func except<T>(_ collection: T) -> [Self.Element] where
        T: Collection,
        T.Element == Self.Element,
        Self.Element: Equatable {
        
        return filter{!collection.contains($0)}
    }
}
