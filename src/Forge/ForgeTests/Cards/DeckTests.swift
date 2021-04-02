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
    //                                  Count                                  //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                Empty Deck                               //
    //-------------------------------------------------------------------------//

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
    
    /// Tests that the count of an empty`Deck` equals the min # of `Card`s  allowed.
    func test_count_ofEmptyDeck_equalsMinCards() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)!
        let expected = deck.minCards
        
        // When
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of an empty`Deck` with an added `Card` equals one.
    func test_emptyDeckCount_withAddedCard_equalsOne() throws {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let deck = Deck()
        let expected = 1
        
        // When
        try deck.add(card)
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of an empty`Deck` with added `Card`s equals the given `Card`s count.
    func test_emptyDeckCount_withAddedCards_equalsGivenCardsCount() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let card1 = Card(title1)
        let card2 = Card(title2)
        let cards = [card1, card2]
        let deck = Deck()
        let expected = 2
        
        // When
        try deck.add(cards)
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                           Partially Filled Deck                         //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a `Deck` with `Card`s  is > zero.
    func test_count_WithCards_isGreaterThanZero() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let deck = Deck(of: cards)!
        
        // When/Then
        XCTAssert(deck.count > 0)
    }
    
    /// Tests that the count of a `Deck` with a given #`Card`s  equals the expected # of `Card`s.
    func test_count_WithGivenCards_equalsExpected() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let deck = Deck(of: cards)!
        let expected = 1
        
        // When
        let actual = deck.count
        
        // When/Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of a `Deck` with `Card`s  is less than the max # of `Card`s allowed.
    func test_count_WithCards_isLessThanMaxCards() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 2
        let deck = Deck(of: cards, with: max)!
        
        // When/Then
        XCTAssert(deck.count < deck.maxCards)
    }
    
    /// Tests that the count of a`Deck` with`Card`s increments by one after adding a `Card` to it.
    func test_count_withAddedCard_IncrementsByOne() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let card1 = Card(title1)
        let card2 = Card(title2)
        let cards = [card1]
        let deck = Deck(of: cards)!
        let expected = 2
        
        // When
        try deck.add(card2)
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Full Deck                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a full `Deck` equals the max # of `Card`s  allowed.
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
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Is Empty                                //
    //-------------------------------------------------------------------------//

    /// Tests that a`Deck`without cards  is empty.
    func test_isEmpty_withoutCards_true() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)!
        
        // When/Then
        XCTAssert(deck.isEmpty())
    }
    
    /// Tests that a`Deck`with `Card`s  is not empty.
    func test_isEmpty_withCards_False() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let deck = Deck(of: cards)!
        
        // When/Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    /// Tests that adding a `Card` to an empty` Deck`with is not empty.
    func test_isEmpty_addCardToEmptyDeck_False() throws {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let deck = Deck()
        
        // When
        try deck.add(card)
        
        // Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    //-------------------------------------------------------------------------//
    //                                 Is Full                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a`Deck` without `Card`s is not full.
    func test_isFull_withoutCards_False() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)!
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    /// Tests that a`Deck`with `Card`s  less than the max allowed  is not full.
    func test_isFull_withCardsLessThanMax_false() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 2
        let deck = Deck(of: cards, with: max)!
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    /// Tests that a`Deck`with the max # of`Card`s  is full.
    func test_isFull_withMaxCards_true() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 1
        let deck = Deck(of: cards, with: max)!
        
        // When/Then
        XCTAssert(deck.isFull())
    }
    
    //-------------------------------------------------------------------------//
    //                                Contains                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Deck` contains a `Card` that was added to it.
    func test_contains_AddedCard_True() throws {
        
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
