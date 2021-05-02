//=============================================================================//
//                                                                             //
//  CardTests.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 3/14/21.                                       //
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

/// Unit tests for a `Card`.
class CardTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Card` equals  "Card".
    func test_title_ofCard_equalsCard() {
        
        // Given
        let card = Card()
        let expected = "Card"
        
        // When
        let actual = card.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a`Card` equals a given title.
    func test_title_ofCard_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let card = Card(named: title)
        let expected = title
        
        // When
        let actual = card.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Card` with an alphabetically earlier title is less than another `Card` with an
    /// alphabetically later title.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Card A"
        let title2 = "Card Z"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssert(card1.isLessThan(card2))
    }
    
    /// Tests that a `Card` with an alphabetically earlier title is less than another `Card` with an
    /// alphabetically later title, using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Card A"
        let title2 = "Card Z"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssertLessThan(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                                 //              //
                                 // Default Card //
                                 //              //
    
    /// Tests that two default `Card`s are equal.
    func test_equals_defaultCards_true() {
        
        // Given
        let card1 = Card()
        let card2 = Card()
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that two default `Card`s are equal, using the equality operator.
    func test_equalityOperator_defaultCards_true() {
        
        // Given
        let card1 = Card()
        let card2 = Card()
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two `Card`s with the same given title are equal.
    func test_equals_cardWithSameTitles_true() {
        
        // Given
        let title1 = "Card A"
        let title2 = "Card A"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }

    /// Tests that two `Card`s with the same given title are equal, using the equality operator.
    func test_equalityOperator_cardWithSameTitles_true() {
        
        // Given
        let title1 = "Card A"
        let title2 = "Card A"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two `Card`s with different titles are not equal.
    func test_equals_cardWithDifferentTitles_false() {
        
        // Given
        let title1 = "Card A"
        let title2 = "Card Z"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that two `Card`s with different titles are not equal, using the equality operator.
    func test_equalitOperator_cardWithDifferentTitles_false() {
        
        // Given
        let title1 = "Card A"
        let title2 = "Card Z"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Card` with an alphabetically later title is greater than another `Card` with an
    /// alphabetically earlier title.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Card Z"
        let title2 = "Card A"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssert(card1.isGreaterThan(card2))
    }
    
    /// Tests that a `Card` with an alphabetically later title is greater than another `Card` with an
    /// alphabetically earlier title, using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Card Z"
        let title2 = "Card A"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(card1, card2)
    }
}
