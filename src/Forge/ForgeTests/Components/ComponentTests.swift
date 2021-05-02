//=============================================================================//
//                                                                             //
//  ComponentTests.swift                                                       //
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

/// Unit tests for a `Component`.
class ComponentTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Component` equals  "Component".
    func test_title_ofComponent_equalsComponent() {
        
        // Given
        let component = Component()
        let expected = "Component"
        
        // When
        let actual = component.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a`Component` equals a given title.
    func test_title_ofComponent_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let component = Component(named: title)
        let expected = title
        
        // When
        let actual = component.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Component` with an alphabetically earlier title is less than another `Component` with
    /// an alphabetically later title.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Component A"
        let title2 = "Component Z"
        let component1 = Component(named: title1)
        let component2 = Component(named: title2)
        
        // When/Then
        XCTAssert(component1.isLessThan(component2))
    }
    
    /// Tests that a `Component` with an alphabetically earlier title is less than another `Component` with
    /// an alphabetically later title, using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Component A"
        let title2 = "Component Z"
        let component1 = Component(named: title1)
        let component2 = Component(named: title2)
        
        // When/Then
        XCTAssertLessThan(component1, component2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                              //                   //
                              // Default Component //
                              //                   //
    
    /// Tests that two default `Component`s are equal.
    func test_equals_defaultComponents_true() {
        
        // Given
        let component1 = Component()
        let component2 = Component()
        
        // When/Then
        XCTAssert(component1.equals(component2))
    }
    
    /// Tests that two default `Component`s are equal, using the equality operator.
    func test_equalityOperator_defaultComponents_true() {
        
        // Given
        let component1 = Component()
        let component2 = Component()
        
        // When/Then
        XCTAssertEqual(component1, component2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two `Component`s with the same given title are equal.
    func test_equals_componentWithSameTitles_true() {
        
        // Given
        let title1 = "Component A"
        let title2 = "Component A"
        let component1 = Component(named: title1)
        let component2 = Component(named: title2)
        
        // When/Then
        XCTAssertEqual(component1, component2)
    }

    /// Tests that two `Component`s with the same given title are equal, using the equality operator.
    func test_equalityOperator_componentWithSameTitles_true() {
        
        // Given
        let title1 = "Component A"
        let title2 = "Component A"
        let component1 = Component(named: title1)
        let component2 = Component(named: title2)
        
        // When/Then
        XCTAssertEqual(component1, component2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two `Component`s with different titles are not equal.
    func test_equals_componentWithDifferentTitles_false() {
        
        // Given
        let title1 = "Component A"
        let title2 = "Component Z"
        let component1 = Component(named: title1)
        let component2 = Component(named: title2)
        
        // When/Then
        XCTAssertFalse(component1.equals(component2))
    }
    
    /// Tests that two `Component`s with different titles are not equal, using the equality operator.
    func test_equalitOperator_componentWithDifferentTitles_false() {
        
        // Given
        let title1 = "Component A"
        let title2 = "Component Z"
        let component1 = Component(named: title1)
        let component2 = Component(named: title2)
        
        // When/Then
        XCTAssertNotEqual(component1, component2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Component` with an alphabetically later title is greater than another `Component`
    /// with an alphabetically earlier title.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Component Z"
        let title2 = "Component A"
        let component1 = Component(named: title1)
        let component2 = Component(named: title2)
        
        // When/Then
        XCTAssert(component1.isGreaterThan(component2))
    }
    
    /// Tests that a `Component` with an alphabetically later title is greater than another `Component`
    /// with an alphabetically earlier title, using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Component Z"
        let title2 = "Component A"
        let component1 = Component(named: title1)
        let component2 = Component(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(component1, component2)
    }
}
