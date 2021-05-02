//=============================================================================//
//                                                                             //
//  RuleTests.swift                                                            //
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

/// Unit tests for a `Rule`.
class RuleTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Rule` equals  "Rule".
    func test_title_ofRule_equalsRule() {
        
        // Given
        let rule = Rule()
        let expected = "Rule"
        
        // When
        let actual = rule.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a`Rule` equals a given title.
    func test_title_ofRule_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let rule = Rule(named: title)
        let expected = title
        
        // When
        let actual = rule.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Rule` with an alphabetically earlier title is less than another `Rule` with an
    /// alphabetically later title.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Rule A"
        let title2 = "Rule Z"
        let rule1 = Rule(named: title1)
        let rule2 = Rule(named: title2)
        
        // When/Then
        XCTAssert(rule1.isLessThan(rule2))
    }
    
    /// Tests that a `Rule` with an alphabetically earlier title is less than another `Rule` with an
    /// alphabetically later title, using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Rule A"
        let title2 = "Rule Z"
        let rule1 = Rule(named: title1)
        let rule2 = Rule(named: title2)
        
        // When/Then
        XCTAssertLessThan(rule1, rule2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                              //                   //
                              // Default Rule //
                              //                   //
    
    /// Tests that two default `Rule`s are equal.
    func test_equals_defaultRules_true() {
        
        // Given
        let rule1 = Rule()
        let rule2 = Rule()
        
        // When/Then
        XCTAssert(rule1.equals(rule2))
    }
    
    /// Tests that two default `Rule`s are equal, using the equality operator.
    func test_equalityOperator_defaultRules_true() {
        
        // Given
        let rule1 = Rule()
        let rule2 = Rule()
        
        // When/Then
        XCTAssertEqual(rule1, rule2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two `Rule`s with the same given title are equal.
    func test_equals_ruleWithSameTitles_true() {
        
        // Given
        let title1 = "Rule A"
        let title2 = "Rule A"
        let rule1 = Rule(named: title1)
        let rule2 = Rule(named: title2)
        
        // When/Then
        XCTAssertEqual(rule1, rule2)
    }

    /// Tests that two `Rule`s with the same given title are equal, using the equality operator.
    func test_equalityOperator_ruleWithSameTitles_true() {
        
        // Given
        let title1 = "Rule A"
        let title2 = "Rule A"
        let rule1 = Rule(named: title1)
        let rule2 = Rule(named: title2)
        
        // When/Then
        XCTAssertEqual(rule1, rule2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two `Rule`s with different titles are not equal.
    func test_equals_ruleWithDifferentTitles_false() {
        
        // Given
        let title1 = "Rule A"
        let title2 = "Rule Z"
        let rule1 = Rule(named: title1)
        let rule2 = Rule(named: title2)
        
        // When/Then
        XCTAssertFalse(rule1.equals(rule2))
    }
    
    /// Tests that two `Rule`s with different titles are not equal, using the equality operator.
    func test_equalitOperator_ruleWithDifferentTitles_false() {
        
        // Given
        let title1 = "Rule A"
        let title2 = "Rule Z"
        let rule1 = Rule(named: title1)
        let rule2 = Rule(named: title2)
        
        // When/Then
        XCTAssertNotEqual(rule1, rule2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Rule` with an alphabetically later title is greater than another `Rule` with an
    /// alphabetically earlier title.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Rule Z"
        let title2 = "Rule A"
        let rule1 = Rule(named: title1)
        let rule2 = Rule(named: title2)
        
        // When/Then
        XCTAssert(rule1.isGreaterThan(rule2))
    }
    
    /// Tests that a `Rule` with an alphabetically later title is greater than another `Rule` with an
    /// alphabetically earlier title, using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Rule Z"
        let title2 = "Rule A"
        let rule1 = Rule(named: title1)
        let rule2 = Rule(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(rule1, rule2)
    }
}
