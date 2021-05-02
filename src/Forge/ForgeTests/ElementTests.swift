//=============================================================================//
//                                                                             //
//  ElementTests.swift                                                         //
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

/// Unit tests for a game `Element`.
class ElementTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Description                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that the description of an `Element` equals  "Element".
    func test_description_ofElement_equalsElement() {
        
        // Given
        let element = Element()
        let expected = "Element"
        
        // When
        let actual = element.description
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that two `Element`s with the same descriptions are equal.
    func test_equals_elementWithSameDescriptions_true() {
        
        // Given
        let element1 = Element()
        let element2 = Element()
        
        // When/Then
        XCTAssertEqual(element1, element2)
    }
}
