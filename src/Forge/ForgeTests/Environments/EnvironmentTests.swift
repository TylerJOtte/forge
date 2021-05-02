//=============================================================================//
//                                                                             //
//  EnvironmentTests.swift                                                     //
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

import XCTest
@testable import Forge

/// Unit tests for an `Environment`.
class EnvironmentTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Environment` equals  "Environment".
    func test_title_ofEnvironment_equalsEnvironment() {
        
        // Given
        let environment = Environment()
        let expected = "Environment"
        
        // When
        let actual = environment.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an`Environment` equals a given title.
    func test_title_ofEnvironment_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let environment = Environment(named: title)
        let expected = title
        
        // When
        let actual = environment.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that an `Environment` with an alphabetically earlier title is less than another
    /// `Environment` with an alphabetically later title.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Environment A"
        let title2 = "Environment Z"
        let environment1 = Environment(named: title1)
        let environment2 = Environment(named: title2)
        
        // When/Then
        XCTAssert(environment1.isLessThan(environment2))
    }
    
    /// Tests that an `Environment` with an alphabetically earlier title is less than another
    /// `Environment` with an alphabetically later title, using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Environment A"
        let title2 = "Environment Z"
        let environment1 = Environment(named: title1)
        let environment2 = Environment(named: title2)
        
        // When/Then
        XCTAssertLessThan(environment1, environment2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                             //                     //
                             // Default Environment //
                             //                     //
    
    /// Tests that two default `Environment`s are equal.
    func test_equals_defaultEnvironments_true() {
        
        // Given
        let environment1 = Environment()
        let environment2 = Environment()
        
        // When/Then
        XCTAssert(environment1.equals(environment2))
    }
    
    /// Tests that two default `Environment`s are equal, using the equality operator.
    func test_equalityOperator_defaultEnvironments_true() {
        
        // Given
        let environment1 = Environment()
        let environment2 = Environment()
        
        // When/Then
        XCTAssertEqual(environment1, environment2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two `Environment`s with the same given title are equal.
    func test_equals_environmentWithSameTitles_true() {
        
        // Given
        let title1 = "Environment A"
        let title2 = "Environment A"
        let environment1 = Environment(named: title1)
        let environment2 = Environment(named: title2)
        
        // When/Then
        XCTAssertEqual(environment1, environment2)
    }

    /// Tests that two `Environment`s with the same given title are equal, using the equality operator.
    func test_equalityOperator_environmentWithSameTitles_true() {
        
        // Given
        let title1 = "Environment A"
        let title2 = "Environment A"
        let environment1 = Environment(named: title1)
        let environment2 = Environment(named: title2)
        
        // When/Then
        XCTAssertEqual(environment1, environment2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two `Environment`s with different titles are not equal.
    func test_equals_environmentWithDifferentTitles_false() {
        
        // Given
        let title1 = "Environment A"
        let title2 = "Environment Z"
        let environment1 = Environment(named: title1)
        let environment2 = Environment(named: title2)
        
        // When/Then
        XCTAssertFalse(environment1.equals(environment2))
    }
    
    /// Tests that two `Environment`s with different titles are not equal, using the equality operator.
    func test_equalitOperator_environmentWithDifferentTitles_false() {
        
        // Given
        let title1 = "Environment A"
        let title2 = "Environment Z"
        let environment1 = Environment(named: title1)
        let environment2 = Environment(named: title2)
        
        // When/Then
        XCTAssertNotEqual(environment1, environment2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that an `Environment` with an alphabetically later title is greater than another
    /// `Environment` with an alphabetically earlier title.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Environment Z"
        let title2 = "Environment A"
        let environment1 = Environment(named: title1)
        let environment2 = Environment(named: title2)
        
        // When/Then
        XCTAssert(environment1.isGreaterThan(environment2))
    }
    
    /// Tests that an `Environment` with an alphabetically later title is greater than another
    /// `Environment` with an alphabetically earlier title, using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Environment Z"
        let title2 = "Environment A"
        let environment1 = Environment(named: title1)
        let environment2 = Environment(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(environment1, environment2)
    }
}
