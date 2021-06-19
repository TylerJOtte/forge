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
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Card` equals "Card".
    func test_title_ofDefaultCard_equalsCard() {
        
        // Given
        let card = Card()
        let expected = "Card"
        
        // When
        let actual = card.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a`Card` created with a title equals the given title.
    func test_title_ofNewCardWithTitle_equalsGivenTitle() {
        
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
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Card` with an alphabetically earlier starting title is less than another `Card` with an
    /// alphabetically later starting title.
    func test_earlierTitledCard_isLessThanLaterTitledCard_true() {
     
        // Given
        let title1 = "Title A"
        let title2 = "Title Z"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssert(card1.isLessThan(card2))
    }
    
    /// Tests that a `Card` with an alphabetically earlier starting title is less than another `Card` with an
    /// alphabetically later starting title, using the less than  operator.
    func test_earlierTitledCard_isLessThanLaterTitledCardWithOperator_true() {
     
        // Given
        let title1 = "Title A"
        let title2 = "Title Z"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssertLessThan(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//

    /// Tests that two `Card`s with the same title are equal.
    func test_card_equalsCardWithSameTitle_true() {
     
        // Given
        let title1 = "Title A"
        let title2 = "Title A"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that two `Card`s with the same title are equal, using the equality operator
    func test_card_equalsCardWithSameTitleWithOperator_true() {
     
        // Given
        let title1 = "Title A"
        let title2 = "Title A"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Card` with an alphabetically later starting title is greater than another `Card` with an
    /// alphabetically earlier starting title.
    func test_laterTitledCard_isGreaterThanEarlierTitledCard_true() {
     
        // Given
        let title1 = "Title Z"
        let title2 = "Title A"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(card1, card2)
    }
}
