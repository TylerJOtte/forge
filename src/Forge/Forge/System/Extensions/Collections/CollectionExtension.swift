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
    
    /// Determines if only contains the given `Collection`'s `Element`s
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter collection: The `Collection` of `Element`s to test.
    /// - Returns: True if only contains the given `Collection`'s `Element`s, else false.
    func contains<T>(only collection: T) -> Bool where T: Collection,
                                                      T.Element == Self.Element,
                                                      Self.Element: Hashable {
        var containsOnlyCollectionElements = false

        if (count > 0 && collection.count > 0) {
            
            let expected = Set(collection)
            let actual = self
            
            if (actual.count == expected.count) {
                
                let otherElements = actual.except(expected)
                
                containsOnlyCollectionElements = otherElements.count == 0
            }
        }

        return containsOnlyCollectionElements
    }
}
