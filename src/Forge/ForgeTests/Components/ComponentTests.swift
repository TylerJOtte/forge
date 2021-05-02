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
}
