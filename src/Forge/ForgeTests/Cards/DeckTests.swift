//=============================================================================//
//                                                                             //
//  DeckTests.swift                                                            //
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

/// Unit tests for the `Deck` class.
class DeckTests: XCTestCase {
    
    //-------------------------------------------------------------------------//
    //                                 Testers                                 //
    //-------------------------------------------------------------------------//
    
    // TODO: Add is not empty test
    // TODO: Add non-empty deck count > 0 test
    
    /// Tests that a`Deck`with zero cards  is empty.
    func test_deck_withZeroCards_isEmpty() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)
        
        // When/Then
        XCTAssert(deck.isEmpty())
    }
    
    /// Tests that a`Deck`with cards  is not empty.
    func test_deck_withCards_isNotEmpty() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let deck = Deck(of: cards)
        
        // When/Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    /// Tests that an empty `Deck`'s count is zero.
    func testEmptyDeckCountIsZero() {
        
        // Given
        let deck: Deck = Deck()
        let expected = 0
        
        // When
        let isEmpty = deck.isEmpty()
        let actual = deck.count
        
        // Then
        XCTAssertTrue(isEmpty && expected == actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                  Adders                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Deck` contains a `Card` that was added to it.
    func testAddCard_ContainsCard_True() throws {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let deck = Deck()
        
        // When
        try deck.add(card)
        
        // Then
        XCTAssertTrue(deck.contains(card))
    }
}
