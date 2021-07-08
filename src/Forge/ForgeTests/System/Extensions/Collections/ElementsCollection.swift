//=============================================================================//
//                                                                             //
//  ElementsCollectionTests.swift                                              //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 7/07/21.                                       //
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

/// Unit tests for an `Elements Collection`.
class ElementsCollectionTests: XCTestCase {
 
    //=========================================================================//
    //                                PROPERTIES                               //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                totalCount                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the total count of an empty `Collection` equals zero.
    func test_totalCount_ofEmptyCollection_equalsZero() {
        
        // Given
        let collection: [Hand] = []
        let expected = 0
        
        // When
        let actual = collection.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the total count of a `Collection` with all empty `Elements` equals zero.
    func test_totalCount_ofCollectionWithAllEmptyElements_equalsZero() {
        
        // Given
        let collection = [Hand(), Hand(), Hand()]
        let expected = 0
        
        // When
        let actual = collection.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
