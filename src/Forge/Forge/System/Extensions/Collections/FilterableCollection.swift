//=============================================================================//
//                                                                             //
//  FilterableCollection.swift                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/06/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//


/// An extension for common `Filterable Collection` operations.
extension Collection where Element: Filterable {
    
    /// Retrieves all the unique sub`Element`s between all the `Element`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An `Array` of unique sub`Element`s, if any.
    func getUniqueSubElements() -> [Element.T] {
        
        var elements: [Element.T] = []
        
        forEach{elements.append(contentsOf: $0.except(elements))}

        return elements
    }
}
