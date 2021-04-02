//=============================================================================//
//                                                                             //
//  HandTests.swift                                                            //
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

/// Unit tests for the `Hand` class.
class HandTests: XCTestCase {
   
    //-------------------------------------------------------------------------//
    //                                 Testers                                 //
    //-------------------------------------------------------------------------//
    
    // TODO: Add is not empty test
    // TODO: Add non-empty hand count > 0 test
    
    /// Tests that a`Hand`with zero cards  is empty.
    func test_hand_withZeroCards_IsEmpty() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssert(hand.isEmpty())
    }
    
    /// Tests that a`Hand`with cards  is not empty.
    func test_deck_withCards_isNotEmpty() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssertFalse(hand.isEmpty())
    }
    
    /// Tests that an empty `Hand`'s count is zero.
    func testEmptyHandCountIsZero() {
        
        // Given
        let hand: Hand = Hand()
        let expected = 0
        
        // When
        let isEmpty = hand.isEmpty()
        let actual = hand.count
        
        // Then
        XCTAssertTrue(isEmpty && expected == actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                  Adders                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Hand` contains a `Card` that was added to it.
    func testAddCard_ContainsCard_True() throws {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let hand = Hand()
        
        // When
        try hand.add(card)
        
        // Then
        XCTAssertTrue(hand.contains(card))
    }
}
