//=============================================================================//
//                                                                             //
//  FilterableCollection.swift                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 7/11/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//

import XCTest
@testable import Forge

/// Unit tests for a `Filterable Collection`.
class FilterableCollectionTests: XCTestCase {
 
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                         getUniqueSubElements()                          //
    //-------------------------------------------------------------------------//
    
    //                       //
    // With Empty Collection //
    //                       //
    
    /// Tests that retrieving the unique sub-`Elements` of an empty `Filterable Collection`
    /// returns an empty `Collection.`
    func test_getUniqueSubElements_withEmptyCollection_returnsEmpty() {
        
        // Given
        let collection: [Hand] = []
        
        // When
        let subElements = collection.getUniqueSubElements()
        
        // Then
        XCTAssert(subElements.isEmpty)
    }
    
    //                     //
    // With Empty Elements //
    //                     //
    
    /// Tests that retrieving the unique sub-`Elements` of a `Filterable Collection` with
    /// `Element`s that are all empty returns an empty `Collection.`
    func test_getUniqueSubElements_withEmptyElements_returnsEmpty() {
        
        // Given
        let collection = [Hand(), Hand(), Hand()]
        
        // When
        let subElements = collection.getUniqueSubElements()
        
        // Then
        XCTAssert(subElements.isEmpty)
    }
}
    
