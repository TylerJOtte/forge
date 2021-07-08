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
    
    //                       //
    // With Empty Collection //
    //                       //
    
    /// Tests that the total count of an empty `Collection` equals zero.
    func test_totalCount_withEmptyCollection_equalsZero() {
        
        // Given
        let collection: [Hand] = []
        let expected = 0
        
        // When
        let actual = collection.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                     //
    // With Empty Elements //
    //                     //
    
    /// Tests that the total count with all empty `Elements` equals zero.
    func test_totalCount_withEmptyElements_equalsZero() {
        
        // Given
        let collection = [Hand(), Hand(), Hand()]
        let expected = 0
        
        // When
        let actual = collection.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                                   //
    // With Empty And Non-Empty Elements //
    //                                   //
    
    /// Tests that the total count with empty and non-empty `Elements` equals an expected value.
    func test_totalCount_withEmptyAndNonEmptyElements_equalsExpected() {
        
        // Given
        let elements1 = Hand(of: [Card()])
        let elements2 = Hand()
        let elements3 = Hand(of: [Card(), Card(), Card()])
        let collection = [elements1, elements2, elements3]
        let expected = 4
        
        // When
        let actual = collection.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
