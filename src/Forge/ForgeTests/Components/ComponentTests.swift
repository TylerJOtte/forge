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
}
