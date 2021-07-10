//=============================================================================//
//                                                                             //
//  ScoreableCollectionTests.swift                                             //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/02/21.                                       //
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

/// Unit tests for a `Scoreable Collection`.
class ScoreableCollectionTests: XCTestCase {
 
    //=========================================================================//
    //                                PROPERTIES                               //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                totalPoints                              //
    //-------------------------------------------------------------------------//
    
    //                       //
    // With Empty Collection //
    //                       //
    
    /// Tests that the total points of an empty `Scoreable Collection` equals zero.
    func test_totalPoints_withEmptyScoreableCollection_equalsZero() {
        
        // Given
        let collection: [RankedCard] = []
        let expected = 0
        
        // When
        let actual = collection.totalPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the total points of an empty `Collection` of `Scoreable Collection`s equals
    /// zero.
    func test_totalPoints_withEmptyCollectionOfScoreableCollections_equalsZero() {
        
        // Given
        let collection: [[RankedCard]] = []
        let expected = 0
        
        // When
        let actual = collection.totalPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                     //
    // With Empty Elements //
    //                     //
    
    /// Tests that the total points with a `Collection` of all empty `Scoreable Collection`s equals
    /// zero.
    func test_totalPoints_withCollectionOfEmptyScoreableCollections_equalsZero()
        {
        
        // Given
        let element1: [RankedCard] = []
        let element2: [RankedCard] = []
        let element3: [RankedCard] = []
        let collection = [element1, element2, element3]
        let expected = 0
        
        // When
        let actual = collection.totalPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                //
    // With Elements  //
    //                //
    
    /// Tests that the total points of a `Scoreable Collection`s equals an expected value.
    func test_totalPoints_withScoreableCollection_equalsExpected() {
        
        // Given
        let collection = [RankedCard(), RankedCard(), RankedCard()]
        let expected = 3
        
        // When
        let actual = collection.totalPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                                   //
    // With Empty And Non-Empty Elements //
    //                                   //
    
    /// Tests that the total points of a `Colleection` with empty and non-empty `Scoreable`
    /// `Collection`s equals an expected value.
    func test_totalPoints_withCollectionOfScoreableCollections_equalsExpected()
        {
        
        // Given
        let element1 = [RankedCard()]
        let element2: [RankedCard] = []
        let element3 = [RankedCard(), RankedCard(), RankedCard()]
        let collection = [element1, element2, element3]
        let expected = 4
        
        // When
        let actual = collection.totalPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
