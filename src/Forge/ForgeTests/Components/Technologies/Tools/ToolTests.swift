//=============================================================================//
//                                                                             //
//  ToolTests.swift                                                            //
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

/// Unit tests for a `Tool`.
class ToolTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Tool` equals  "Tool".
    func test_title_ofTool_equalsTool() {
        
        // Given
        let tool = Tool()
        let expected = "Tool"
        
        // When
        let actual = tool.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a`Tool` equals a given title.
    func test_title_ofTool_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let tool = Tool(named: title)
        let expected = title
        
        // When
        let actual = tool.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Tool` with an alphabetically earlier title is less than another `Tool` with an
    /// alphabetically later title.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Tool A"
        let title2 = "Tool Z"
        let tool1 = Tool(named: title1)
        let tool2 = Tool(named: title2)
        
        // When/Then
        XCTAssert(tool1.isLessThan(tool2))
    }
    
    /// Tests that a `Tool` with an alphabetically earlier title is less than another `Tool` with an
    /// alphabetically later title, using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Tool A"
        let title2 = "Tool Z"
        let tool1 = Tool(named: title1)
        let tool2 = Tool(named: title2)
        
        // When/Then
        XCTAssertLessThan(tool1, tool2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                                 //              //
                                 // Default Tool //
                                 //              //
    
    /// Tests that two default `Tool`s are equal.
    func test_equals_defaultTools_true() {
        
        // Given
        let tool1 = Tool()
        let tool2 = Tool()
        
        // When/Then
        XCTAssert(tool1.equals(tool2))
    }
    
    /// Tests that two default `Tool`s are equal, using the equality operator.
    func test_equalityOperator_defaultTools_true() {
        
        // Given
        let tool1 = Tool()
        let tool2 = Tool()
        
        // When/Then
        XCTAssertEqual(tool1, tool2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two `Tool`s with the same given title are equal.
    func test_equals_toolWithSameTitles_true() {
        
        // Given
        let title1 = "Tool A"
        let title2 = "Tool A"
        let tool1 = Tool(named: title1)
        let tool2 = Tool(named: title2)
        
        // When/Then
        XCTAssertEqual(tool1, tool2)
    }

    /// Tests that two `Tool`s with the same given title are equal, using the equality operator.
    func test_equalityOperator_toolWithSameTitles_true() {
        
        // Given
        let title1 = "Tool A"
        let title2 = "Tool A"
        let tool1 = Tool(named: title1)
        let tool2 = Tool(named: title2)
        
        // When/Then
        XCTAssertEqual(tool1, tool2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two `Tool`s with different titles are not equal.
    func test_equals_toolWithDifferentTitles_false() {
        
        // Given
        let title1 = "Tool A"
        let title2 = "Tool Z"
        let tool1 = Tool(named: title1)
        let tool2 = Tool(named: title2)
        
        // When/Then
        XCTAssertFalse(tool1.equals(tool2))
    }
    
    /// Tests that two `Tool`s with different titles are not equal, using the equality operator.
    func test_equalitOperator_toolWithDifferentTitles_false() {
        
        // Given
        let title1 = "Tool A"
        let title2 = "Tool Z"
        let tool1 = Tool(named: title1)
        let tool2 = Tool(named: title2)
        
        // When/Then
        XCTAssertNotEqual(tool1, tool2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Tool` with an alphabetically later title is greater than another `Tool` with an
    /// alphabetically earlier title.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Tool Z"
        let title2 = "Tool A"
        let tool1 = Tool(named: title1)
        let tool2 = Tool(named: title2)
        
        // When/Then
        XCTAssert(tool1.isGreaterThan(tool2))
    }
    
    /// Tests that a `Tool` with an alphabetically later title is greater than another `Tool` with an
    /// alphabetically earlier title, using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Tool Z"
        let title2 = "Tool A"
        let tool1 = Tool(named: title1)
        let tool2 = Tool(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(tool1, tool2)
    }
}
