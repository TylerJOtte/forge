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

/// Unit tests for an `Element`.
class ElementTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Element` equals  "Element".
    func test_title_ofElement_equalsElement() {
        
        // Given
        let element = Element()
        let expected = "Element"
        
        // When
        let actual = element.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an`Element` equals a given title.
    func test_title_ofElement_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let element = Element(named: title)
        let expected = title
        
        // When
        let actual = element.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that an `Element` with an alphabetically earlier title is less than another `Element` with
    /// an alphabetically later `Element`.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Element A"
        let title2 = "Element Z"
        let element1 = Element(named: title1)
        let element2 = Element(named: title2)
        
        // When/Then
        XCTAssert(element1.isLessThan(element2))
    }
    
    /// Tests that an `Element` with an alphabetically earlier title is less than another `Element` with
    /// an alphabetically later `Element` using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Element A"
        let title2 = "Element Z"
        let element1 = Element(named: title1)
        let element2 = Element(named: title2)
        
        // When/Then
        XCTAssertLessThan(element1, element2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                                //                 //
                                // Default Element //
                                //                 //
    
    /// Tests that two default `Element`s are equal.
    func test_equals_defaultElements_true() {
        
        // Given
        let element1 = Element()
        let element2 = Element()
        
        // When/Then
        XCTAssert(element1.equals(element2))
    }
    
    /// Tests that two default `Element`s are equal using the equality operator.
    func test_equalityOperator_defaultElements_true() {
        
        // Given
        let element1 = Element()
        let element2 = Element()
        
        // When/Then
        XCTAssertEqual(element1, element2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two `Element`s with the same given title are equal.
    func test_equals_elementWithSameTitles_true() {
        
        // Given
        let title1 = "Element A"
        let title2 = "Element A"
        let element1 = Element(named: title1)
        let element2 = Element(named: title2)
        
        // When/Then
        XCTAssertEqual(element1, element2)
    }

    /// Tests that two `Element`s with the same given  title are equal using the equality operator.
    func test_equalityOperator_elementWithSameTitles_true() {
        
        // Given
        let title1 = "Element A"
        let title2 = "Element A"
        let element1 = Element(named: title1)
        let element2 = Element(named: title2)
        
        // When/Then
        XCTAssertEqual(element1, element2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two `Element`s with the different titles are not equal.
    func test_equals_elementWithDifferentTitles_false() {
        
        // Given
        let title1 = "Element A"
        let title2 = "Element Z"
        let element1 = Element(named: title1)
        let element2 = Element(named: title2)
        
        // When/Then
        XCTAssertFalse(element1.equals(element2))
    }
    
    /// Tests that two `Element`s with the different titles are not equal using the equality operator.
    func test_equalitOperator_elementWithDifferentTitles_false() {
        
        // Given
        let title1 = "Element A"
        let title2 = "Element Z"
        let element1 = Element(named: title1)
        let element2 = Element(named: title2)
        
        // When/Then
        XCTAssertNotEqual(element1, element2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that an `Element` with an alphabetically later title is greater than another `Element` with
    /// an alphabetically earlier `Element`.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Element Z"
        let title2 = "Element A"
        let element1 = Element(named: title1)
        let element2 = Element(named: title2)
        
        // When/Then
        XCTAssert(element1.isGreaterThan(element2))
    }
    
    /// Tests that an `Element` with an alphabetically later title is greater than another `Element` with
    /// an alphabetically earlier `Element` using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Element Z"
        let title2 = "Element A"
        let element1 = Element(named: title1)
        let element2 = Element(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(element1, element2)
    }
}
