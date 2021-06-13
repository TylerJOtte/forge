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
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Min                                //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Hand` with a min less than zero throws an `invalidMin Error`.
    func test_init_withMinLessThanZero_throwsInvalidMinError() throws {

        // Given
        let min = -1
        let max = Int.max
        let card = Card()
        let cards = [card]
        let expected = RangeError.invalidMin

        // When
        XCTAssertThrowsError(try Hand(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              Invalid Max                                //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Hand` with a max less than one throws an `invalidMax Error`.
    func test_init_withMaxLessThanOne_throwsInvalidMaxError() throws {

        // Given
        let max = 0
        let card = Card()
        let cards = [card]
        let expected = RangeError.invalidMax

        // When
        XCTAssertThrowsError(try Hand(of: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `Hand` with a valid min and a max less than one throws an `invalidMax`
    /// `Error`.
    func test_init_withValidMinAndMaxLessThanOne_throwsInvalidMaxError() throws {

        // Given
        let min = 0
        let max = 0
        let card = Card()
        let cards = [card]
        let expected = RangeError.invalidMax

        // When
        XCTAssertThrowsError(try Hand(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
   
    //=========================================================================//
    //                                  Count                                  //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                Empty Hand                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of an empty `Hand` is zero.
    func test_count_ofEmptyHand_isZero() throws {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        let expected = 0
        
        // When
        let actual = hand.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of an empty`Hand` equals the min # of `Card`s  allowed.
    func test_count_ofEmptyHand_equalsMinCards() throws {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
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
        let card = Card(named: title)
        let hand = Hand()
        let expected = 1
        
        // When
        try hand.add(card)
        let actual = hand.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of an empty`Hand` with added `Card`s equals the given `Card`s count.
    func test_emptyHandCount_withAddedCards_equalsGivenCardsCount() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let cards = [card1, card2]
        let hand = Hand()
        let expected = 2
        
        // When
        try hand.add(cards)
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
        let card = Card(named: title)
        let cards = [card]
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssert(hand.count > 0)
    }
    
    /// Tests that the count of a `Hand` with a given #`Card`s  equals the expected # of `Card`s.
    func test_count_WithGivenCards_equalsExpected() {
        
        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let hand = Hand(of: cards)
        let expected = 1
        
        // When
        let actual = hand.count
        
        // When/Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of a `Hand` with `Card`s  is less than the max # of `Card`s allowed.
    func test_count_WithCards_isLessThanMaxCards() throws {
        
        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let max = 2
        let hand = try Hand(of: max, cards)
        
        // When/Then
        XCTAssert(hand.count < hand.maxCards)
    }
    
    /// Tests that the count of a`Hand` with`Card`s increments by one after adding a `Card` to it.
    func test_count_withAddedCard_IncrementsByOne() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let cards = [card1]
        let hand = Hand(of: cards)
        let expected = 2
        
        // When
        try hand.add(card2)
        let actual = hand.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of a`Hand` with`Card`s increments by the # of `Card`s added to it.
    func test_count_withAddedCards_IncrementsByGivenCardsCount() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let title4 = "Card 4"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let card4 = Card(named: title4)
        let cards1 = [card1, card2]
        let cards2 = [card3, card4]
        let hand = Hand(of: cards1)
        let expected = 4
        
        // When
        try hand.add(cards2)
        let actual = hand.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Full Hand                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a full `Hand` equals the max # of `Card`s  allowed.
    func test_count_ofFullHand_equalsMaxCards() throws {
        
        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let max = 1
        let hand = try Hand(of: max, cards)
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
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssert(hand.isEmpty())
    }
    
    /// Tests that a`Hand`with `Card`s is not empty.
    func test_isEmpty_withCards_False() {
        
        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssertFalse(hand.isEmpty())
    }
//
//    /// Tests that adding a `Card` to an empty` Hand`with is not empty.
//    func test_isEmpty_addCardToEmptyHand_False() throws {
//
//        // Given
//        let title = "Card"
//        let card = Card(named: title)
//        let hand = Hand()
//
//        // When
//        try hand.add(card)
//
//        // Then
//        XCTAssertFalse(hand.isEmpty())
//    }
    
    //-------------------------------------------------------------------------//
    //                                 Is Full                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a`Hand` without cards  is not full.
    func test_isFull_withoutCards_False() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    /// Tests that a`Hand`with`Card`s less than the max allowed is not full.
    func test_isFull_withCardsLessThanMax_false() throws {
        
        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let max = 2
        let hand = try Hand(of: max, cards)
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    /// Tests that a`Hand`with the max # of `Card`s  is full.
    func test_isFull_withMaxCards_true() throws {
        
        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let max = 1
        let hand = try Hand(of: max, cards)
        
        // When/Then
        XCTAssert(hand.isFull())
    }
    
    //-------------------------------------------------------------------------//
    //                                Contains                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Hand` contains an expected`Card`.
    func test_contains_card_true() {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        let expected = card2

        // When/Then
        XCTAssert(hand.contains(expected))
    }
    
    /// Tests that a `Hand` does not contain a given`Card`.
    func test_contains_card_false() {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let title4 = "Card 4"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let card4 = Card(named: title4)
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        let expected = card4

        // When/Then
        XCTAssertFalse(hand.contains(expected))
    }
    
    /// Tests that a `Hand` contains a `Card` that was added to it.
    func test_contains_addedCard_true() throws {

        // Given
        let title = "Card"
        let card = Card(named: title)
        let hand = Hand()

        // When
        try hand.add(card)

        // Then
        XCTAssert(hand.contains(card))
    }

    /// Tests that a `Hand` does not contains a `Card` that was removed from it.
    func test_contains_removedCard_false() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        let expected = card2
        
        // When
        let actual = try hand.remove(expected)
        
        // Then
        XCTAssertFalse(hand.contains(actual))
    }
    
    //=========================================================================//
    //                                 REMOVERS                                //
    //=========================================================================//
    
    /// Tests that removing a `Card` from a `Hand` returns the expected `Card`.
    func test_remove_card_true() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        let expected = card2
        
        // When
        let actual = try hand.remove(expected)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                                Throwers                                 //
    //=========================================================================//
    
    /// Tests that removing  a `Card` from an empty `Hand` throws an `iEmpty Error`.
    func test__removeFromEmptyHand_throwsIsEmptyError() throws {

        // Given
        let card = Card()
        let hand = Hand()
        let expected = ElementsError.isEmpty

        // When
        XCTAssertThrowsError(try hand.remove(card)) { (error) in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }

    /// Tests that removing `Card`s from a `Hand`that does not contain it throws an
    /// `ElementsError.notFound` error.
    func test_throwsNotFoundError_removeNonExistentCard_true() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let title4 = "Card 4"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let card4 = Card(named: title4)
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        let expected = ElementsError.notFound
        
        // When
        XCTAssertThrowsError(try hand.remove(card4)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that adding a `Card` to a full `Hand` throws an `RangeError.isFull` error.
    func test_throwsIsFullError_addCardToFullHand_true() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let cards = [card1, card2]
        let max = 2
        let hand = try Hand(of: max, cards)
        let expected = RangeError.isFull
        
        // When
        XCTAssertThrowsError(try hand.add(card3)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that adding `Card`s to a full `Hand` throws an `RangeError.isFull` error.
    func test_throwsIsFullError_addCardsToFullHand_true() throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let title4 = "Card 4"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let card4 = Card(named: title4)
        let cards1 = [card1, card2]
        let cards2 = [card3, card4]
        let max = 2
        let hand = try Hand(of: max, cards1)
        let expected = RangeError.isFull
        
        // When
        XCTAssertThrowsError(try hand.add(cards2)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that adding `Card`s to a `Hand`greater than its capacity throws an
    /// `RangeError.limitedCapacity` error.
    func test_throwsInsufficientCapacityError_addMoreCardsThanCapacity_true()
        throws {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let title4 = "Card 4"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let card4 = Card(named: title4)
        let cards1 = [card1, card2]
        let cards2 = [card3, card4]
        let max = 3
        let hand = try Hand(of: max, cards1)
        let expected = RangeError.limitedCapacity
        
        // When
        XCTAssertThrowsError(try hand.add(cards2)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
}
