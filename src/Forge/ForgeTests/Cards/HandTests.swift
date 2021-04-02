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
   
    //=========================================================================//
    //                                  Count                                  //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                Empty Hand                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of an empty `Hand` is zero.
    func test_count_ofEmptyHand_isZero() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)!
        let expected = 0
        
        // When
        let actual = hand.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of an empty`Hand` equals the min # of `Card`s  allowed.
    func test_count_ofEmptyHand_equalsMinCards() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)!
        let expected = hand.minCards
        
        // When
        let actual = hand.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of an empty`Hand` with an added `Card` equals one.
    func test_emptyHandCount_withAddedCard_equalsOne() throws {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let hand = Hand()
        let expected = 1
        
        // When
        try hand.add(card)
        let actual = hand.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                           Partially Filled Hand                         //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a `Hand` with `Card`s  is > zero.
    func test_count_WithCards_isGreaterThanZero() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let hand = Hand(of: cards)!
        
        // When/Then
        XCTAssert(hand.count > 0)
    }
    
    /// Tests that the count of a `Hand` with a given #`Card`s  equals the expected # of `Card`s.
    func test_count_WithGivenCards_equalsExpected() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let hand = Hand(of: cards)!
        let expected = 1
        
        // When
        let actual = hand.count
        
        // When/Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of a `Hand` with `Card`s  is less than the max # of `Card`s allowed.
    func test_count_WithCards_isLessThanMaxCards() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 2
        let hand = Hand(of: cards, with: max)!
        
        // When/Then
        XCTAssert(hand.count < hand.maxCards)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Full Hand                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a full `Hand` equals the max # of `Card`s  allowed.
    func test_count_ofFullHand_equalsMaxCards() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 1
        let hand = Hand(of: cards, with: max)!
        let expected = hand.maxCards
        
        // When
        let actual = hand.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Is Empty                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a`Hand`without `Card`s   is empty.
    func test_isEmpty_withoutCards_true() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)!
        
        // When/Then
        XCTAssert(hand.isEmpty())
    }
    
    /// Tests that a`Hand`with `Card`s is not empty.
    func test_isEmpty_withCards_False() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let hand = Hand(of: cards)!
        
        // When/Then
        XCTAssertFalse(hand.isEmpty())
    }
    
    /// Tests that adding a `Card` to an empty` Hand`with is not empty.
    func test_isEmpty_addCardToEmptyHand_False() throws {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let hand = Hand()
        
        // When
        try hand.add(card)
        
        // Then
        XCTAssertFalse(hand.isEmpty())
    }
    
    //-------------------------------------------------------------------------//
    //                                 Is Full                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a`Hand` without cards  is not full.
    func test_isFull_withoutCards_False() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)!
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    /// Tests that a`Hand`with`Card`s less than the max allowed is not full.
    func test_isFull_withCardsLessThanMax_false() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 2
        let hand = Hand(of: cards, with: max)!
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    /// Tests that a`Hand`with the max # of `Card`s  is full.
    func test_isFull_withMaxCards_true() {
        
        // Given
        let title = "Card"
        let card = Card(title)
        let cards = [card]
        let max = 1
        let hand = Hand(of: cards, with: max)!
        
        // When/Then
        XCTAssert(hand.isFull())
    }
    
    //-------------------------------------------------------------------------//
    //                                Contains                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Hand` contains a `Card` that was added to it.
    func test_contains_addedCard_True() throws {
        
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
