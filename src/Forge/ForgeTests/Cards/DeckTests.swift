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
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Empty Deck                               //
    //-------------------------------------------------------------------------//

    /// Tests that a`Deck`with zero cards  is empty.
    func test_deck_withZeroCards_isEmpty() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)!
        
        // When/Then
        XCTAssert(deck.isEmpty())
    }
    
    /// Tests that the count of an empty `Deck` is zero.
    func test_count_ofEmptyDeck_isZero() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)!
        let expected = 0
        
        // When
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                          Paritally Filled Deck                          //
    //-------------------------------------------------------------------------//
    
    /// Tests that a`Deck`with cards  is not empty.
    func test_deck_withCards_isNotEmpty() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let deck = Deck(of: cards)!
        
        // When/Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    /// Tests that a`Deck`with cards less than the max allowed  is not full.
    func test_deck_withCardsLessThanMax_isNotFull() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 2
        let deck = Deck(of: cards, with: max)!
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    //-------------------------------------------------------------------------//
    //                                 Full Deck                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that a`Deck`with the max # of cards  is full.
    func test_deck_withMaxCards_isFull() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 1
        let deck = Deck(of: cards, with: max)!
        
        // When/Then
        XCTAssert(deck.isFull())
    }
    
    /// Tests that the count of a full `Deck` equals the max # of carrds allowed.
    func test_count_ofFullDeck_equalsMaxCards() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 1
        let deck = Deck(of: cards, with: max)!
        let expected = deck.maxCards
        
        // When
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
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
