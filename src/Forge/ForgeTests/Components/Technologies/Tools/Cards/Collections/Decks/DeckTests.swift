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
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Min                                //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Deck` with a min less than zero throws an `invalidMin Error`.
    func test_init_withMinLessThanZero_throwsInvalidMinError() throws {

        // Given
        let min = -1
        let max = Int.max
        let card = Card()
        let cards = [card]
        let expected = RangeError.invalidMin

        // When
        XCTAssertThrowsError(try Deck(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              Invalid Max                                //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Deck` with a max less than one throws an `invalidMax Error`.
    func test_init_withMaxLessThanOne_throwsInvalidMaxError() throws {

        // Given
        let max = 0
        let card = Card()
        let cards = [card]
        let expected = RangeError.invalidMax

        // When
        XCTAssertThrowsError(try Deck(of: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `Deck` with a valid min and a max less than one throws an `invalidMax`
    /// `Error`.
    func test_init_withValidMinAndMaxLessThanOne_throwsInvalidMaxError() throws {

        // Given
        let min = 0
        let max = 0
        let card = Card()
        let cards = [card]
        let expected = RangeError.invalidMax

        // When
        XCTAssertThrowsError(try Deck(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `Deck` with a max that is less than the min throws an `invalidMax Error`.
    func test_init_withMaxLessThanMin_throwsInvalidMaxError() throws {

        // Given
        let min = 2
        let max = 1
        let card1 = Card()
        let card2 = Card()
        let cards = [card1, card2]
        let expected = RangeError.invalidMax

        // When
        XCTAssertThrowsError(try Deck(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                            Invalid Count                                //
    //-------------------------------------------------------------------------//
    
    //               //
    // Less Than Min //
    //               //
    
    /// Tests that creating a `Deck` with `Cards` that contain less the given min # of `Card`s throws an
    /// `invalidCount Error`.
    func test_init_withLessCardsThanMin_throwsInvalidCountError() throws {

        // Given
        let min = 2
        let max = 2
        let card = Card()
        let cards = [card]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try Deck(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //               //
    // More Than Max //
    //               //
    
    /// Tests that creating a `Deck` with `Cards` that contain more the given max # of `Card`s throws an
    /// `invalidCount Error`.
    func test_init_withMoreCardsThanMax_throwsInvalidCountError() throws {

        // Given
        let max = 1
        let card1 = Card()
        let card2 = Card()
        let cards = [card1, card2]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try Deck(of: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that creating a `Deck` with a min and `Cards` that contain more the given max # of
    /// `Card`s throws an`invalidCount Error`.
    func test_init_withMinAndMoreCardsThanMax_throwsInvalidCountError() throws {

        // Given
        let min = 0
        let max = 1
        let card1 = Card()
        let card2 = Card()
        let cards = [card1, card2]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try Deck(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    //            //
    // Empty Deck //
    //            //

    /// Tests that the count of an empty `Deck` is zero.
    func test_count_ofEmptyDeck_isZero() {

        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)
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
        let deck = Deck(of: cards)
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
        let card = Card(named: title)
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
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let cards = [card1, card2]
        let deck = Deck()
        let expected = 2
        
        // When
        try deck.add(cards)
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                       //
    // Partially Filled Deck //
    //                       //
    
    /// Tests that the count of a `Deck` with `Card`s  is > zero.
    func test_count_WithCards_isGreaterThanZero() {

        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let deck = Deck(of: cards)

        // When/Then
        XCTAssert(deck.count > 0)
    }

    /// Tests that the count of a `Deck` with a given #`Card`s  equals the expected # of `Card`s.
    func test_count_WithGivenCards_equalsExpected() {

        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let deck = Deck(of: cards)
        let expected = 1

        // When
        let actual = deck.count

        // When/Then
        XCTAssertEqual(expected, actual)
    }

    /// Tests that the count of a `Deck` with `Card`s  is less than the max # of `Card`s allowed.
    func test_count_WithCards_isLessThanMaxCards() throws {

        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let max = 2
        let deck = try Deck(of: max, cards)

        // When/Then
        XCTAssert(deck.count < deck.maxCards)
    }

    /// Tests that the count of a`Deck` with`Card`s increments by one after adding a `Card` to it.
    func test_count_withAddedCard_IncrementsByOne() throws {

        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let cards = [card1]
        let deck = Deck(of: cards)
        let expected = 2

        // When
        try deck.add(card2)
        let actual = deck.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of a`Deck` with`Card`s increments by the # of `Card`s added to it.
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
        let deck = Deck(of: cards1)
        let expected = 4

        // When
        try deck.add(cards2)
        let actual = deck.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //           //
    // Full Deck //
    //           //
    
    /// Tests that the count of a full `Deck` equals the max # of `Card`s  allowed.
    func test_count_ofFullDeck_equalsMaxCards() throws {

        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let max = 1
        let deck = try Deck(of: max, cards)
        let expected = deck.maxCards

        // When
        let actual = deck.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 First                                   //
    //-------------------------------------------------------------------------//

    /// Tests that retrieving the first `Card` of an empty `Deck` returns `nil`.
    func test_first_ofEmptyDeck_IsNil() {
        
        // Given
        let deck = Deck()
        
        // When
        let first = deck.first
        
        // Then
        XCTAssertNil(first)
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
        let deck = Deck(of: cards)

        // When/Then
        XCTAssert(deck.isEmpty())
    }

    /// Tests that a`Deck`with `Card`s  is not empty.
    func test_isEmpty_withCards_False() {

        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let deck = Deck(of: cards)

        // When/Then
        XCTAssertFalse(deck.isEmpty())
    }

    /// Tests that adding a `Card` to an empty` Deck`with is not empty.
    func test_isEmpty_addCardToEmptyDeck_False() throws {

        // Given
        let title = "Card"
        let card = Card(named: title)
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
        let deck = Deck(of: cards)

        // When/Then
        XCTAssertFalse(deck.isFull())
    }

    /// Tests that a`Deck`with `Card`s  less than the max allowed  is not full.
    func test_isFull_withCardsLessThanMax_false() throws {

        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let max = 2
        let deck = try Deck(of: max, cards)

        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    /// Tests that a`Deck`with the max # of`Card`s  is full.
    func test_isFull_withMaxCards_true() throws {

        // Given
        let title = "Card"
        let card = Card(named: title)
        let cards = [card]
        let max = 1
        let deck = try Deck(of: max, cards)

        // When/Then
        XCTAssert(deck.isFull())
    }
//
    //-------------------------------------------------------------------------//
    //                                Contains                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Deck` contains an expected`Card`.
    func test_contains_Card_true() {

        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)
        let expected = card2

        // When/Then
        XCTAssert(deck.contains(expected))
    }
    
    /// Tests that a `Deck` does not contain a given`Card`.
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
        let deck = Deck(of: cards)
        let expected = card4

        // When/Then
        XCTAssertFalse(deck.contains(expected))
    }
    
    /// Tests that a `Deck` contains a `Card` that was added to it.
    func test_contains_AddedCard_true() throws {
        
        // Given
        let title = "Card"
        let card = Card(named: title)
        let deck = Deck()
        
        // When
        try deck.add(card)
        
        // Then
        XCTAssert(deck.contains(card))
    }

    /// Tests that a `Deck` does not contains a `Card` that was removed from it.
    func test_contains_removedCard_false() throws {

        // Given
        let title1 = "Card "
        let title2 = "Card 2"
        let title3 = "Card 3"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)
        let expected = card2

        // When
        let actual = try deck.remove(expected)

        // Then
        XCTAssertFalse(deck.contains(actual))
    }
    
    //=========================================================================//
    //                                  ADDERS                                 //
    //=========================================================================//
    
    /// Tests that adding the same `Card` to a `Deck` increments the count by one.
    func test_add_sameCardIncrementsCount_true() throws {
    
        // Given
        let card = Card()
        let cards = [card]
        let deck = Deck(of: cards)
        let expected = 2
        
        // When
        try deck.add(card)
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                                 REMOVERS                                //
    //=========================================================================//

    /// Tests that removing a `Card` from a `Deck` returns the expected `Card`.
    func test_remove_card_true() throws {

        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)
        let expected = card2

        // When
        let actual = try deck.remove(expected)

        // Then
        XCTAssertEqual(expected, actual)
    }

    //=========================================================================//
    //                                Throwers                                 //
    //=========================================================================//
    
    /// Tests that removing  a `Card` from an empty `Deck` throws an `ElementsError.iEmpty` error.
    func test_throwsIsEmptyError_removeFromEmptyDeck_true() throws {
        
        // Given
        let title = "Card"
        let card = Card(named: title)
        let deck = Deck()
        let expected = ElementsError.isEmpty
        
        // When
        XCTAssertThrowsError(try deck.remove(card)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that removing `Card`s from a `Deck`that does not contain it throws an
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
        let deck = Deck(of: cards)
        let expected = ElementsError.notFound

        // When
        XCTAssertThrowsError(try deck.remove(card4)) { (error) in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that adding a `Card` to a full `Deck` throws an `RangeError.isFull` error.
    func test_throwsIsFullError_addCardToFullDeck_true() throws {

        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let title3 = "Card 3"
        let card1 = Card(named: title1)
        let card2 = Card(named: title2)
        let card3 = Card(named: title3)
        let cards = [card1, card2]
        let max = 2
        let deck = try Deck(of: max, cards)
        let expected = RangeError.isFull

        // When
        XCTAssertThrowsError(try deck.add(card3)) { (error) in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }

    /// Tests that adding `Card`s to a full `Deck` throws an `RangeError.isFull` error.
    func test_throwsIsFullError_addCardsToFullDeck_true() throws {

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
        let deck = try Deck(of: max, cards1)
        let expected = RangeError.isFull

        // When
        XCTAssertThrowsError(try deck.add(cards2)) { (error) in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }

    /// Tests that adding `Card`s to a `Deck`greater than its capacity throws an
    /// `RangeError.limitedCapacity` error.
    func test_throwslimitedCapacityError_addMoreCardsThanCapacity_true()
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
        let deck = try Deck(of: max, cards1)
        let expected = RangeError.limitedCapacity

        // When
        XCTAssertThrowsError(try deck.add(cards2)) { (error) in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
}
