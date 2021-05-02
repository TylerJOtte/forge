//=============================================================================//
//                                                                             //
//  ResourceTests.swift                                                       //
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

/// Unit tests for a `Resource`.
class ResourceTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Resource` equals  "Resource".
    func test_title_ofResource_equalsResource() {
        
        // Given
        let resource = Resource()
        let expected = "Resource"
        
        // When
        let actual = resource.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a`Resource` equals a given title.
    func test_title_ofResource_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let resource = Resource(named: title)
        let expected = title
        
        // When
        let actual = resource.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Resource` with an alphabetically earlier title is less than another `Resource` with
    /// an alphabetically later title.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Resource A"
        let title2 = "Resource Z"
        let resource1 = Resource(named: title1)
        let resource2 = Resource(named: title2)
        
        // When/Then
        XCTAssert(resource1.isLessThan(resource2))
    }
    
    /// Tests that a `Resource` with an alphabetically earlier title is less than another `Resource` with
    /// an alphabetically later title, using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Resource A"
        let title2 = "Resource Z"
        let resource1 = Resource(named: title1)
        let resource2 = Resource(named: title2)
        
        // When/Then
        XCTAssertLessThan(resource1, resource2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                              //                   //
                              // Default Resource //
                              //                   //
    
    /// Tests that two default `Resource`s are equal.
    func test_equals_defaultResources_true() {
        
        // Given
        let resource1 = Resource()
        let resource2 = Resource()
        
        // When/Then
        XCTAssert(resource1.equals(resource2))
    }
    
    /// Tests that two default `Resource`s are equal, using the equality operator.
    func test_equalityOperator_defaultResources_true() {
        
        // Given
        let resource1 = Resource()
        let resource2 = Resource()
        
        // When/Then
        XCTAssertEqual(resource1, resource2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two `Resource`s with the same given title are equal.
    func test_equals_resourceWithSameTitles_true() {
        
        // Given
        let title1 = "Resource A"
        let title2 = "Resource A"
        let resource1 = Resource(named: title1)
        let resource2 = Resource(named: title2)
        
        // When/Then
        XCTAssertEqual(resource1, resource2)
    }

    /// Tests that two `Resource`s with the same given title are equal, using the equality operator.
    func test_equalityOperator_resourceWithSameTitles_true() {
        
        // Given
        let title1 = "Resource A"
        let title2 = "Resource A"
        let resource1 = Resource(named: title1)
        let resource2 = Resource(named: title2)
        
        // When/Then
        XCTAssertEqual(resource1, resource2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two `Resource`s with different titles are not equal.
    func test_equals_resourceWithDifferentTitles_false() {
        
        // Given
        let title1 = "Resource A"
        let title2 = "Resource Z"
        let resource1 = Resource(named: title1)
        let resource2 = Resource(named: title2)
        
        // When/Then
        XCTAssertFalse(resource1.equals(resource2))
    }
    
    /// Tests that two `Resource`s with different titles are not equal, using the equality operator.
    func test_equalitOperator_resourceWithDifferentTitles_false() {
        
        // Given
        let title1 = "Resource A"
        let title2 = "Resource Z"
        let resource1 = Resource(named: title1)
        let resource2 = Resource(named: title2)
        
        // When/Then
        XCTAssertNotEqual(resource1, resource2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Resource` with an alphabetically later title is greater than another `Resource`
    /// with an alphabetically earlier title.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Resource Z"
        let title2 = "Resource A"
        let resource1 = Resource(named: title1)
        let resource2 = Resource(named: title2)
        
        // When/Then
        XCTAssert(resource1.isGreaterThan(resource2))
    }
    
    /// Tests that a `Resource` with an alphabetically later title is greater than another `Resource`
    /// with an alphabetically earlier title, using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Resource Z"
        let title2 = "Resource A"
        let resource1 = Resource(named: title1)
        let resource2 = Resource(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(resource1, resource2)
    }
}
