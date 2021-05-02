//=============================================================================//
//                                                                             //
//  MechanicTests.swift                                                        //
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

/// Unit tests for a `Mechanic`.
class MechanicTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Mechanic` equals  "Mechanic".
    func test_title_ofMechanic_equalsMechanic() {
        
        // Given
        let mechanic = Mechanic()
        let expected = "Mechanic"
        
        // When
        let actual = mechanic.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a`Mechanic` equals a given title.
    func test_title_ofMechanic_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let mechanic = Mechanic(named: title)
        let expected = title
        
        // When
        let actual = mechanic.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Mechanic` with an alphabetically earlier title is less than another `Mechanic` with
    /// an alphabetically later title.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Mechanic A"
        let title2 = "Mechanic Z"
        let mechanic1 = Mechanic(named: title1)
        let mechanic2 = Mechanic(named: title2)
        
        // When/Then
        XCTAssert(mechanic1.isLessThan(mechanic2))
    }
    
    /// Tests that a `Mechanic` with an alphabetically earlier title is less than another `Mechanic` with
    /// an alphabetically later title, using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Mechanic A"
        let title2 = "Mechanic Z"
        let mechanic1 = Mechanic(named: title1)
        let mechanic2 = Mechanic(named: title2)
        
        // When/Then
        XCTAssertLessThan(mechanic1, mechanic2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                              //                   //
                              // Default Mechanic //
                              //                   //
    
    /// Tests that two default `Mechanic`s are equal.
    func test_equals_defaultMechanics_true() {
        
        // Given
        let mechanic1 = Mechanic()
        let mechanic2 = Mechanic()
        
        // When/Then
        XCTAssert(mechanic1.equals(mechanic2))
    }
    
    /// Tests that two default `Mechanic`s are equal, using the equality operator.
    func test_equalityOperator_defaultMechanics_true() {
        
        // Given
        let mechanic1 = Mechanic()
        let mechanic2 = Mechanic()
        
        // When/Then
        XCTAssertEqual(mechanic1, mechanic2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two `Mechanic`s with the same given title are equal.
    func test_equals_mechanicWithSameTitles_true() {
        
        // Given
        let title1 = "Mechanic A"
        let title2 = "Mechanic A"
        let mechanic1 = Mechanic(named: title1)
        let mechanic2 = Mechanic(named: title2)
        
        // When/Then
        XCTAssertEqual(mechanic1, mechanic2)
    }

    /// Tests that two `Mechanic`s with the same given title are equal, using the equality operator.
    func test_equalityOperator_mechanicWithSameTitles_true() {
        
        // Given
        let title1 = "Mechanic A"
        let title2 = "Mechanic A"
        let mechanic1 = Mechanic(named: title1)
        let mechanic2 = Mechanic(named: title2)
        
        // When/Then
        XCTAssertEqual(mechanic1, mechanic2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two `Mechanic`s with different titles are not equal.
    func test_equals_mechanicWithDifferentTitles_false() {
        
        // Given
        let title1 = "Mechanic A"
        let title2 = "Mechanic Z"
        let mechanic1 = Mechanic(named: title1)
        let mechanic2 = Mechanic(named: title2)
        
        // When/Then
        XCTAssertFalse(mechanic1.equals(mechanic2))
    }
    
    /// Tests that two `Mechanic`s with different titles are not equal, using the equality operator.
    func test_equalitOperator_mechanicWithDifferentTitles_false() {
        
        // Given
        let title1 = "Mechanic A"
        let title2 = "Mechanic Z"
        let mechanic1 = Mechanic(named: title1)
        let mechanic2 = Mechanic(named: title2)
        
        // When/Then
        XCTAssertNotEqual(mechanic1, mechanic2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Mechanic` with an alphabetically later title is greater than another `Mechanic` with
    /// an alphabetically earlier title.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Mechanic Z"
        let title2 = "Mechanic A"
        let mechanic1 = Mechanic(named: title1)
        let mechanic2 = Mechanic(named: title2)
        
        // When/Then
        XCTAssert(mechanic1.isGreaterThan(mechanic2))
    }
    
    /// Tests that a `Mechanic` with an alphabetically later title is greater than another `Mechanic` with
    /// an alphabetically earlier title, using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Mechanic Z"
        let title2 = "Mechanic A"
        let mechanic1 = Mechanic(named: title1)
        let mechanic2 = Mechanic(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(mechanic1, mechanic2)
    }
}
