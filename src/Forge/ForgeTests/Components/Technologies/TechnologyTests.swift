//=============================================================================//
//                                                                             //
//  TechnologyTests.swift                                                      //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/02/21.                                       //
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

/// Unit tests for a `Technology`.
class TechnologyTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Technology` equals  "Technology".
    func test_title_ofTechnology_equalsTechnology() {
        
        // Given
        let technology = Technology()
        let expected = "Technology"
        
        // When
        let actual = technology.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a`Technology` equals a given title.
    func test_title_ofTechnology_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let technology = Technology(named: title)
        let expected = title
        
        // When
        let actual = technology.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Technology` with an alphabetically earlier title is less than another `Technology`
    /// with an alphabetically later title.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Technology A"
        let title2 = "Technology Z"
        let technology1 = Technology(named: title1)
        let technology2 = Technology(named: title2)
        
        // When/Then
        XCTAssert(technology1.isLessThan(technology2))
    }
    
    /// Tests that a `Technology` with an alphabetically earlier title is less than another `Technology`
    /// with an alphabetically later title, using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Technology A"
        let title2 = "Technology Z"
        let technology1 = Technology(named: title1)
        let technology2 = Technology(named: title2)
        
        // When/Then
        XCTAssertLessThan(technology1, technology2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                             //                    //
                             // Default Technology //
                             //                    //
    
    /// Tests that two default Technologies are equal.
    func test_equals_defaultTechnologies_true() {
        
        // Given
        let technology1 = Technology()
        let technology2 = Technology()
        
        // When/Then
        XCTAssert(technology1.equals(technology2))
    }
    
    /// Tests that two default Technologies  are equal, using the equality operator.
    func test_equalityOperator_defaultTechnologies_true() {
        
        // Given
        let technology1 = Technology()
        let technology2 = Technology()
        
        // When/Then
        XCTAssertEqual(technology1, technology2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two Technologies with the same given title are equal.
    func test_equals_technologyWithSameTitles_true() {
        
        // Given
        let title1 = "Technology A"
        let title2 = "Technology A"
        let technology1 = Technology(named: title1)
        let technology2 = Technology(named: title2)
        
        // When/Then
        XCTAssertEqual(technology1, technology2)
    }

    /// Tests that two Technologies with the same given title are equal, using the equality operator.
    func test_equalityOperator_technologyWithSameTitles_true() {
        
        // Given
        let title1 = "Technology A"
        let title2 = "Technology A"
        let technology1 = Technology(named: title1)
        let technology2 = Technology(named: title2)
        
        // When/Then
        XCTAssertEqual(technology1, technology2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two Technologies with different titles are not equal.
    func test_equals_technologyWithDifferentTitles_false() {
        
        // Given
        let title1 = "Technology A"
        let title2 = "Technology Z"
        let technology1 = Technology(named: title1)
        let technology2 = Technology(named: title2)
        
        // When/Then
        XCTAssertFalse(technology1.equals(technology2))
    }
    
    /// Tests that two Technologies with different titles are not equal, using the equality operator.
    func test_equalitOperator_technologyWithDifferentTitles_false() {
        
        // Given
        let title1 = "Technology A"
        let title2 = "Technology Z"
        let technology1 = Technology(named: title1)
        let technology2 = Technology(named: title2)
        
        // When/Then
        XCTAssertNotEqual(technology1, technology2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Technology` with an alphabetically later title is greater than another `Technology`
    /// with an alphabetically earlier title.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Technology Z"
        let title2 = "Technology A"
        let technology1 = Technology(named: title1)
        let technology2 = Technology(named: title2)
        
        // When/Then
        XCTAssert(technology1.isGreaterThan(technology2))
    }
    
    /// Tests that a `Technology` with an alphabetically later title is greater than another `Technology`
    /// with an alphabetically earlier title, using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Technology Z"
        let title2 = "Technology A"
        let technology1 = Technology(named: title1)
        let technology2 = Technology(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(technology1, technology2)
    }
}
