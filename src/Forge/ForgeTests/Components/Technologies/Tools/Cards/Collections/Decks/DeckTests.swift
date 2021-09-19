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
        let cards = [Card()]
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
        let cards = [Card()]
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
        let cards = [Card()]
        let expected = RangeError.invalidMax

        // When
        XCTAssertThrowsError(try Deck(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                               minCards                                  //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the min cards of a default `Deck` equals zero.
    func test_minCards_ofDefaultDeck_equalsZero() {
        
        // Given
        let deck = Deck()
        let expected = 0
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a default `Deck` equals the count.
    func test_minCards_ofDefaultDeck_equalsCount() {
        
        // Given
        let deck = Deck()
        let expected = deck.count
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Deck` created with empty `Card`s equals zero.
    func test_minCards_ofNewDeckWithEmptyCards_equalsZero() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)
        let expected = 0
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the min cards of a `Deck` created with `Card`s equals zero.
    func test_minCards_ofNewDeckWithCards_equalsZero() {
        
        // Given
        let cards = [Card()]
        let deck = Deck(of: cards)
        let expected = 0
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Deck` created with empty `Card`s equals the count.
    func test_minCards_ofNewDeckWithEmptyCards_equalsCount() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)
        let expected = deck.count
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Deck` created with a max and empty `Card`s equals zero.
    func test_minCards_ofNewDeckWithMaxAndEmptyCards_equalsZero() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let deck = try Deck(of: max, cards)
        let expected = 0
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the min cards of a `Deck` created with a max and `Card`s equals zero.
    func test_minCards_ofNewDeckWithMaxAndCards_equalsZero() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: max, cards)
        let expected = 0
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Deck` created with a max and empty `Card`s equals the count.
    func test_minCards_ofNewDeckWithMaxAndEmptyCards_equalsCount() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let deck = try Deck(of: max, cards)
        let expected = deck.count
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Deck` created with a max and `Card`s with a count equal to the
    /// given max equals the capacity.
    func test_minCards_ofNewDeckWithMaxAndCardsWithGivenMax_equalsCapacity()
        throws {
        
        // Given
        let max = 2
        let cards = [Card(), Card()]
        let deck = try Deck(of: max, cards)
        let expected = deck.capacity
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals Given Min //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Deck` created with a range and `Card`s equals the given min.
    func test_minCards_ofNewDeckWithRangeAndCards_equalsGivenMin() throws {
        
        // Given
        let min = 1
        let max = 5
        let cards = [Card(), Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = min
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals maxCards //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Deck` created with an equal min/max and `Card`s equals the
    /// maxCards.
    func test_minCards_ofNewDeckWithEqualMinMaxAndCards_equalsGivenMaxCards()
        throws {
        
        // Given
        let min = 1
        let max = 1
        let cards = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = deck.maxCards
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Deck` created with a range and `Card`s with a count equal to the
    /// given min equals the count.
    func test_minCards_ofNewDeckWithRangeAndCardsEqualToGivenMin_equalsCount()
        throws {
        
        // Given
        let min = 1
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = deck.count
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Deck` created with a zero to max range and full `Card`s equals
    /// the capacity.
    func test_minCards_ofNewDeckWithZeroToMaxRangeAndFullCards_equalsCapacity()
        throws {
        
        // Given
        let min = 0
        let max = 2
        let cards = [Card(), Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = deck.capacity
        
        // When
        let actual = deck.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               maxCards                                  //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    // Equals System Max //
    // ~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a default `Deck` equals the system max.
    func test_maxCards_ofDefaultDeck_equalsSystemMax() {
        
        // Given
        let deck = Deck()
        let expected = Int.max
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a default `Deck` equals the capacity
    func test_maxCards_ofDefaultDeck_equalsCapacity() {
        
        // Given
        let deck = Deck()
        let expected = deck.capacity
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals System Max //
    // ~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Deck` created with empty `Card`s equals the system max.
    func test_maxCards_ofNewDeckWithEmptyCards_equalsSystemMax() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)
        let expected = Int.max
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards of a `Deck` created with `Card`s equals the system max.
    func test_maxCards_ofNewDeckWithCards_equalsSystemMax() {
        
        // Given
        let cards = [Card()]
        let deck = Deck(of: cards)
        let expected = Int.max
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Deck` created with empty `Card`s equals the capacity.
    func test_maxCards_ofNewDeckWithEmptyCards_equalsCapacity() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)
        let expected = deck.capacity
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // Equals Given Max //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Deck` created with a max and `Card`s equals the given max.
    func test_maxCards_ofNewDeckWithMaxAndCards_equalsGivenMax() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: max, cards)
        let expected = max
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Deck` created with a max and full `Card`s equals the count.
    func test_maxCards_ofNewDeckWithMaxAndFullCards_equalsCount() throws {
        
        // Given
        let max = 1
        let cards = [Card()]
        let deck = try Deck(of: max, cards)
        let expected = deck.count
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Deck` created with a max and empty `Card`s equals the capacity.
    func test_maxCards_ofNewDeckWithMaxAndEmptyCards_equalsCapacity() throws {
        
        // Given
        let max = 1
        let cards: [Card] = []
        let deck = try Deck(of: max, cards)
        let expected = deck.capacity
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals Given Max //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Deck` created with a range and `Card`s equals the given max.
    func test_maxCards_ofNewDeckWithRangeAndCards_equalsGivenMax() throws {
        
        // Given
        let min = 1
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = max
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals minCards //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Deck` created with an equal min/max and `Card`s equals the
    /// minCards.
    func test_maxCards_ofNewDeckWithEqualMinMaxAndCards_equalsMinCards() throws {
        
        // Given
        let min = 1
        let max = 1
        let cards = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = deck.minCards
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Deck` created with a range and full `Card`s equals the count.
    func test_maxCards_ofNewDeckWithRangeAndFullCards_equalsCount() throws {
        
        // Given
        let min = 1
        let max = 2
        let cards = [Card(), Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = deck.count
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Deck` created with a zero to max range and empty `Card`s
    /// equals the capacity.
    func test_maxCards_ofNewDeckWithZeroToMaxRangeAndEmptyCards_equalsCapacity()
        throws {
        
        // Given
        let min = 0
        let max = 5
        let cards: [Card] = []
        let deck = try Deck(of: min, to: max, cards)
        let expected = deck.capacity
        
        // When
        let actual = deck.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 cards                                   //
    //-------------------------------------------------------------------------//
    
    //            //
    // With Cards //
    //            //
    
    // Contains Given Cards //
    // ~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the `Card`s of a `Deck` created with `Card`s contains the given `Card`s.
    func test_cards_ofNewDeckWithCards_containsGivenCards_() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)

        // When/Then
        XCTAssert(deck.contains(cards))
    }
    
    //                    //
    // With Max and Cards //
    //                    //

    // Contains Given Cards //
    // ~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the`Card`s of a `Deck` created with a max and `Card`s contains the given `Card`s.
    func test_cards_ofNewDeckWithMaxAndCards_equalsGivenCardsCount() throws {
        
        // Given
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = try Deck(of: max, cards)

        // When/Then
        XCTAssert(deck.contains(cards))
    }
    
    //                      //
    // With Range And Cards //
    //                      //

    // Contains Given Cards //
    // ~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the`Card`s  of a `Deck` created with a range and `Card`s contains the given `Card`s.
    func test_cards_ofNewDeckWithRangeAndCards_equalsGivenCardsCount() throws {
        
        // Given
        let min = 1
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = try Deck(of: min, to: max, cards)
        
        // When/Then
        XCTAssert(deck.contains(cards))
    }
    
    //-------------------------------------------------------------------------//
    //                                 count                                   //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the count of a default `Deck` equals the # of given `Card`s.
    func test_count_ofDefaultDeck_equalsGivenCardsCount() {
        
        // Given
        let deck = Deck()
        let expected = 0
        
        // When
        let actual = deck.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals Given Card's Count //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the count of a `Deck` created with `Card`s equals the # of given `Card`s.
    func test_count_ofNewDeckWithCards_equalsGivenCardsCount() {
        
        // Given
        let cards = [Card()]
        let deck = Deck(of: cards)
        let expected = 1
        
        // When
        let actual = deck.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // Equals Given Card's Count //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the count of a `Deck` created with a max and `Card`s equals the # of given `Card`s.
    func test_count_ofNewDeckWithMaxAndCards_equalsGivenCardsCount() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: max, cards)
        let expected = 1
        
        // When
        let actual = deck.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals Given Card's Count //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the count of a `Deck` created with a range and `Card`s equals the # of given `Card`s.
    func test_count_ofNewDeckWithRangeAndCards_equalsGivenCardsCount() throws {
        
        // Given
        let min = 1
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = 1
        
        // When
        let actual = deck.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                capacity                                 //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    // Equals System Max //
    // ~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a default `Deck` equals the system max.
    func test_capacity_ofDefaultDeck_equalsSystemMax() {
        
        // Given
        let deck = Deck()
        let expected = Int.max
        
        // When
        let actual = deck.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals System Max //
    // ~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Deck` created with empty `Card`s equals the system max.
    func test_capacity_ofNewDeckWithEmptyCards_equalsSystemMax() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)
        let expected = Int.max
        
        // When
        let actual = deck.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Deck` created with `Card`s equals the expected value.
    func test_capacity_ofNewDeckWithCards_equalsExpected() {
        
        // Given
        let cards = [Card()]
        let deck = Deck(of: cards)
        let expected = 9223372036854775806
        
        // When
        let actual = deck.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    
    // Equals Given Max //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Deck` created with a max and empty `Card`s equals the given max.
    func test_capacity_ofNewDeckWithMaxAndEmptyCards_equalsGivenMax() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let deck = try Deck(of: max, cards)
        let expected = max
        
        // When
        let actual = deck.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Deck` created with a max and `Card`s equals the expected value.
    func test_capacity_ofNewDeckWithMaxAndCards_equalsExpected() throws {
        
        // Given
        let max = 5
        let cards: [Card] = [Card()]
        let deck = try Deck(of: max, cards)
        let expected = 4
        
        // When
        let actual = deck.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Deck` created with a max and  and full `Card`s equals zero.
    func test_capacity_ofNewDeckWithMaxAndFullCards_equalsZero() throws {
        
        // Given
        let max = 1
        let cards: [Card] = [Card()]
        let deck = try Deck(of: max, cards)
        let expected = 0
        
        // When
        let actual = deck.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals Given Max //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Deck` created with a zero to max range and empty `Card`s equals the
    /// given max.
    func test_capacity_ofNewDeckWithZeroToMaxRangeAndEmptyCards_equalsGivenMax()
        throws {
        
        // Given
        let min = 0
        let max = 3
        let cards: [Card] = []
        let deck = try Deck(of: min, to: max, cards)
        let expected = max
        
        // When
        let actual = deck.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Deck` created with a range and `Card`s equals the expected value.
    func test_capacity_ofNewDeckWithRangeAndCards_equalsExpected()
        throws {
        
        // Given
        let min = 1
        let max = 3
        let cards: [Card] = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = 2
        
        // When
        let actual = deck.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Deck` created with a range and full `Card`s equals zero.
    func test_capacity_ofNewDeckWithRangeAndFullCards_equalsZero()
        throws {
        
        // Given
        let min = 1
        let max = 1
        let cards: [Card] = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = 0
        
        // When
        let actual = deck.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    /// Tests that the title of a default `Deck` equals "Deck".
    func test_title_ofDefaultDeck_equalsDeck() {
        
        // Given
        let deck = Deck()
        let expected = "Deck"
        
        // When
        let actual = deck.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    /// Tests that the title of a `Deck` created with `Card`s equals "Deck".
    func test_title_ofNewDeckWithCards_equalsDeck() {
        
        // Given
        let cards = [Card()]
        let deck = Deck(of: cards)
        let expected = "Deck"
        
        // When
        let actual = deck.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    /// Tests that the title of a `Deck` created with a max and `Card`s equals "Deck".
    func test_title_ofNewDeckWithMaxAndCards_equalsDeck() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: max, cards)
        let expected = "Deck"
        
        // When
        let actual = deck.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    /// Tests that the title of a `Deck` created with a range and `Card`s equals "Deck".
    func test_title_ofNewDeckWithRangeAndCards_equalsDeck() throws {
        
        // Given
        let min = 0
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        let expected = "Deck"
        
        // When
        let actual = deck.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                isEmpty()                                //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    /// Tests that a default `Deck` is empty.
    func test_isEmpty_withDefaultDeck_true() {
        
        // Given
        let deck = Deck()
        
        // When/Then
        XCTAssert(deck.isEmpty())
    }
    
    //            //
    // With Cards //
    //            //

    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with empty `Card`s is empty.
    func test_isEmpty_newDeckWithEmptyCards_true() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)
        
        // When/Then
        XCTAssert(deck.isEmpty())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with partial `Card`s is not empty.
    func test_isEmpty_newDeckWithPartialCards_false() {
        
        // Given
        let cards = [Card()]
        let deck = Deck(of: cards)
        
        // When/Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a max and empty `Card`s is empty.
    func test_isEmpty_newDeckWithMaxAndEmptyCards_true() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let deck = try Deck(of: max, cards)
        
        // When/Then
        XCTAssert(deck.isEmpty())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a max and partial `Card`s is not empty.
    func test_isEmpty_newDeckWithMaxAndPartialCards_false() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: max, cards)
        
        // When/Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a range and empty `Card`s is empty.
    func test_isEmpty_newDeckWithRangeAndEmptyCards_true() throws {
        
        // Given
        let min = 0
        let max = 5
        let cards: [Card] = []
        let deck = try Deck(of: min, to: max, cards)
        
        // When/Then
        XCTAssert(deck.isEmpty())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a range and partial `Card`s is not empty.
    func test_isEmpty_newDeckWithRangeAndPartialCards_false() throws {
        
        // Given
        let min = 0
        let max = 5
        let cards = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        
        // When/Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    //-------------------------------------------------------------------------//
    //                                 isFull()                                //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    /// Tests that a default `Deck` is not full.
    func test_isFull_withDefaultDeck_false() {
        
        // Given
        let deck = Deck()
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    //            //
    // With Cards //
    //            //

    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with empty `Card`s is not full.
    func test_isFull_newDeckWithEmptyCards_false() {
        
        // Given
        let cards: [Card] = []
        let deck = Deck(of: cards)
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with partial `Card`s is not full.
    func test_isFull_newDeckWithPartialCards_false() {
        
        // Given
        let cards = [Card()]
        let deck = Deck(of: cards)
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a max and empty `Card`s is not full.
    func test_isFull_newDeckWithMaxAndEmptyCards_false() throws {
        
        // Given
        let max = 2
        let cards: [Card] = []
        let deck = try Deck(of: max, cards)
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a max and partial `Card`s is not full.
    func test_isFull_newDeckWithMaxAndPartialCards_false() throws {
        
        // Given
        let max = 2
        let cards = [Card()]
        let deck = try Deck(of: max, cards)
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    // With Full Cards //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a max and full `Card`s is full.
    func test_isFull_newDeckWithMaxAndFullCards_true() throws {
        
        // Given
        let max = 2
        let cards = [Card(), Card()]
        let deck = try Deck(of: max, cards)
        
        // When/Then
        XCTAssert(deck.isFull())
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a range and empty `Card`s is not full.
    func test_isFull_newDeckWithRangeAndEmptyCards_false() throws {
        
        // Given
        let min = 0
        let max = 2
        let cards: [Card] = []
        let deck = try Deck(of: min, to: max, cards)
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a range and partial `Card`s is not full.
    func test_isFull_newDeckWithRangeAndPartialCards_false() throws {
        
        // Given
        let min = 0
        let max = 2
        let cards = [Card()]
        let deck = try Deck(of: min, to: max, cards)
        
        // When/Then
        XCTAssertFalse(deck.isFull())
    }
    
    // With Full Cards //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` created with a range and full `Card`s is full.
    func test_isFull_newDeckWithRangeAndFullCards_true() throws {
        
        // Given
        let min = 0
        let max = 2
        let cards = [Card(), Card()]
        let deck = try Deck(of: min, to: max, cards)
        
        // When/Then
        XCTAssert(deck.isFull())
    }
    
    //-------------------------------------------------------------------------//
    //                                Contains                                 //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    /// Tests that a default `Deck` does not contain a `Card`.
    func test_contains_cardWithDefaultDeck_false() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let deck = Deck()
        let expected = card1

        // When/Then
        XCTAssertFalse(deck.contains(expected))
    }
    
    //            //
    // With Cards //
    //            //
    
    /// Tests that a `Deck`created with `Card`s contains an expected`Card`.
    func test_contains_cardWithCards_true() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)
        let expected = card2

        // When/Then
        XCTAssert(deck.contains(expected))
    }
    
    /// Tests that a `Deck`created with `Card`s does not contain a `Card`.
    func test_contains_cardWithCards_false() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)
        let expected = card4

        // When/Then
        XCTAssertFalse(deck.contains(expected))
    }

    //                    //
    // With Max and Cards //
    //                    //
    
    /// Tests that a `Deck`created with a max and `Card`s contains an expected `Card`.
    func test_contains_cardWithMaxAndCards_true() throws {
        
        // Given
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = try Deck(of: max, cards)
        let expected = card2

        // When/Then
        XCTAssert(deck.contains(expected))
    }
    
    /// Tests that a `Deck`created with a max and `Card`s does not contain a `Card`.
    func test_contains_cardWithMaxAndCards_false() throws {
        
        // Given
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards = [card1, card2, card3]
        let deck = try Deck(of: max, cards)
        let expected = card4

        // When/Then
        XCTAssertFalse(deck.contains(expected))
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    /// Tests that a `Deck`created with a range and `Card`s contains an expected`Card`.
    func test_contains_cardWithRangeAndCards_true() throws {
        
        // Given
        let min = 3
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = try Deck(of: min, to: max, cards)
        let expected = card2

        // When/Then
        XCTAssert(deck.contains(expected))
    }
    
    /// Tests that a `Deck`created with a range and `Card`s does not contain a `Card`.
    func test_contains_cardWithRangeAndCards_false() throws {
        
        // Given
        let min = 3
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards = [card1, card2, card3]
        let deck = try Deck(of: min, to: max, cards)
        let expected = card4

        // When/Then
        XCTAssertFalse(deck.contains(expected))
    }
    

    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                    <                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a `Deck`is less than  another `Deck` that contains more `Card`s.
    func test_isLessThan_deckWithMoreCards_true() {
     
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards1 = [card1, card2, card3]
        let cards2 = [card1, card2, card3, card4]
        let deck1 = Deck(of: cards1)
        let deck2 = Deck(of: cards2)
        
        // When/Then
        XCTAssert(deck1.isLessThan(deck2))
    }
    
    /// Tests that a `Deck`is less than  another `Deck` that contains more `Card`s, .using the less than
    /// operator.
    func test_isLessThan_deckWithMoreCardsUsingLessThanOperator_true()
        {
     
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards1 = [card1, card2, card3]
        let cards2 = [card1, card2, card3, card4]
        let deck1 = Deck(of: cards1)
        let deck2 = Deck(of: cards2)
        
        // When/Then
        XCTAssertLessThan(deck1, deck2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  ==                                     //
    //-------------------------------------------------------------------------//

    /// Tests that a `Deck`equals another `Deck` with the same `Card`s in a different order.
    func test_equals_deckWithSameCardsInDifferentOrder_true() {
     
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards1 = [card1, card2, card3, card4]
        let cards2 = [card4, card3, card2, card1]
        let deck1 = Deck(of: cards1)
        let deck2 = Deck(of: cards2)
        
        // When/Then
        XCTAssert(deck1.equals(deck2))
    }
    
    /// Tests that a `Deck`equals another `Deck` with the same `Card`s in a different order, using the
    /// equality operator.
    func test_equals_deckWithSameCardsInDifferentOrderWithEqualityOperator_true()
        {
     
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards1 = [card1, card2, card3, card4]
        let cards2 = [card4, card3, card2, card1]
        let deck1 = Deck(of: cards1)
        let deck2 = Deck(of: cards2)
        
        // When/Then
        XCTAssertEqual(deck1, deck2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  !=                                     //
    //-------------------------------------------------------------------------//

    /// Tests that a `Deck` does not equal another `Deck` with a different `Card`.
    func test_equals_deckWithADifferentCard_false() {
     
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let card5 = Card(named: "Card 5")
        let cards1 = [card1, card2, card3, card4]
        let cards2 = [card1, card2, card3, card5]
        let deck1 = Deck(of: cards1)
        let deck2 = Deck(of: cards2)
        
        // When/Then
        XCTAssertFalse(deck1.equals(deck2))
    }
    
    /// Tests that a `Deck` does not equal another `Deck` with a different `Card`, using the equality
    /// operator.
    func test_equals_deckWithDifferentCardUsingEqualityOperator_false() {
     
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let card5 = Card(named: "Card 5")
        let cards1 = [card1, card2, card3, card4]
        let cards2 = [card1, card2, card3, card5]
        let deck1 = Deck(of: cards1)
        let deck2 = Deck(of: cards2)
        
        // When/Then
        XCTAssertNotEqual(deck1, deck2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  isLevel()                              //
    //-------------------------------------------------------------------------//
    
    //           //
    // isEmpty() //
    //           //
    
    // Adding Cards //
    // ~~~~~~~~~~~~ //
    
    /// Tests that an empty `Deck` is not empty after adding  a `Card` to it.
    func test_isEmpty_afterAddCard_false() throws {

        // Given
        let card = Card()
        let deck = Deck()

        // When
        try deck.add(card)

        // Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    /// Tests that an empty `Deck` is not empty after adding `Cards` to it.
    func test_isEmpty_afterAddCards_false() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck()

        // When
        try deck.add(cards)

        // Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    // Removing Cards //
    // ~~~~~~~~~~~~~~ //
    
    /// Tests that a `Deck`with one `Card` is empty after removing  a `Card` from it.
    func test_isEmpty_afterRemoveCard_true() throws {

        // Given
        let card = Card(named: "Card 1")
        let cards = [card]
        let deck = Deck(of: cards)

        // When
        _ = try deck.remove(card)

        // Then
        XCTAssert(deck.isEmpty())
    }
    
    /// Tests that a `Deck`with multiple `Cards` is not empty after removing  a `Card` from it.
    func test_isEmpty_afterRemoveCard_false() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)

        // When
        _ = try deck.remove(card1)

        // Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    /// Tests that a `Deck`with multiple `Cards` is empty after removing  `Cards` from it.
    func test_isEmpty_afterRemoveCards_true() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)

        // When
        _ = try deck.remove(cards)

        // Then
        XCTAssert(deck.isEmpty())
    }
    
    /// Tests that a `Deck`with multiple `Cards` is not empty after removing  `Cards` from it.
    func test_isEmpty_afterRemoveCards_false() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards1 = [card1, card2, card3]
        let cards2 = [card1, card2]
        let deck = Deck(of: cards1)

        // When
        _ = try deck.remove(cards2)

        // Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    /// Tests that a `Deck`with only duplicate`Cards` is empty after removing a given set of `Cards`
    /// that only contain one instance of each duplicate `Card`.
    func test_isEmpty_afterRemoveDuplicateCards_true() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 1")
        let card3 = Card(named: "Card 2")
        let card4 = Card(named: "Card 2")
        let cards1 = [card1, card2, card3, card4]
        let cards2 = [card2, card3]
        let deck = Deck(of: cards1)

        // When
        _ = try deck.remove(cards2)

        // Then
        XCTAssert(deck.isEmpty())
    }
    
    /// Tests that a `Deck`with duplicate`Cards` is not empty after removing a given set of `Cards`
    /// that only contain one instance of each duplicate `Card`.
    func test_isEmpty_afterRemoveDuplicateCards_false() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 2")
        let card4 = Card(named: "Card 3")
        let card5 = Card(named: "Card 3")
        let cards1 = [card1, card2, card3, card4, card5]
        let cards2 = [card3, card4]
        let deck = Deck(of: cards1)

        // When
        _ = try deck.remove(cards2)

        // Then
        XCTAssertFalse(deck.isEmpty())
    }
    
    //          //
    // isFull() //
    //          //
    
    // Adding Cards //
    // ~~~~~~~~~~~~ //
    
    /// Tests that a `Deck` is full  after adding  a `Card` to it.
    func test_isFull_afterAddCard_true() throws {

        // Given
        let max = 1
        let card = Card()
        let cards: [Card] = []
        let deck = try Deck(of: max, cards)

        // When
        try deck.add(card)

        // Then
        XCTAssert(deck.isFull())
    }
    
    /// Tests that a `Deck` is not full  after adding  a `Card` to it.
    func test_isFull_afterAddCard_false() throws {

        // Given
        let max = 2
        let card = Card()
        let cards: [Card] = []
        let deck = try Deck(of: max, cards)

        // When
        try deck.add(card)

        // Then
        XCTAssertFalse(deck.isFull())
    }
    
    /// Tests that a `Deck` is full  after adding `Cards` to it.
    func test_isFull_afterAddCards_true() throws {

        // Given
        let max = 2
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let cards1: [Card] = []
        let cards2 = [card1, card2]
        let deck = try Deck(of: max, cards1)

        // When
        try deck.add(cards2)

        // Then
        XCTAssert(deck.isFull())
    }
    
    /// Tests that a `Deck` is not full  after adding `Cards` to it.
    func test_isFull_afterAddCards_false() throws {

        // Given
        let max = 3
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let cards1: [Card] = []
        let cards2 = [card1, card2]
        let deck = try Deck(of: max, cards1)

        // When
        try deck.add(cards2)

        // Then
        XCTAssertFalse(deck.isFull())
    }
    
    // Removing Cards //
    // ~~~~~~~~~~~~~~ //
    
    /// Tests that a full `Deck` is not full after removing  a `Card` from it.
    func test_isFull_afterRemoveCard_false() throws {

        // Given
        let max = 1
        let card = Card()
        let cards = [card]
        let deck = try Deck(of: max, cards)

        // When
        _ = try deck.remove(card)

        // Then
        XCTAssertFalse(deck.isFull())
    }
    
    /// Tests that a full `Deck` is not full after removing  `Cards` from it.
    func test_isFull_afterRemoveCards_false() throws {

        // Given
        let max = 3
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards1 = [card1, card2, card3]
        let cards2 = [card1, card2]
        let deck = try Deck(of: max, cards1)

        // When
        _ = try deck.remove(cards2)

        // Then
        XCTAssertFalse(deck.isFull())
    }
    
    //-------------------------------------------------------------------------//
    //                               contains()                                //
    //-------------------------------------------------------------------------//
    
    //             //
    // Added Cards //
    //             //
    
    /// Tests that a `Deck` contains a `Card` that was added to it.
    func test_contains_addedCard_true() throws {

        // Given
        let card = Card()
        let deck = Deck()

        // When
        try deck.add(card)

        // Then
        XCTAssert(deck.contains(card))
    }
    
    /// Tests that a `Deck` contains the `Card`s that were added to it.
    func test_contains_addedCards_true() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)

        // When
        try deck.add(cards)

        // Then
        XCTAssert(deck.contains(cards))
    }
    
    //               //
    // Removed Cards //
    //               //

    /// Tests that a `Deck` does not contain a `Card` that was removed from it.
    func test_contains_removedCard_false() throws {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)
        
        // When
        let removedCard = try deck.remove(card2)
        
        // Then
        XCTAssertFalse(deck.contains(removedCard))
    }
    
    /// Tests that a `Deck` does not contain the `Card`s that were removed from it.
    func test_contains_removedCards_false() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)

        // When
        let removedCards = try deck.remove(cards)

        // Then
        XCTAssertFalse(deck.contains(removedCards))
    }
    
    //            //
    // Duplicates //
    //            //
    
    /// Tests that a `Deck` still contains a `Card` after removing a duplicate of it.
    func test_contains_cardAfterRemovingDuplicate_true() throws {
        
        // Given
        let duplicateCard1 = Card(named: "Card 1")
        let duplicateCard2 = Card(named: "Card 1")
        let card3 = Card(named: "Card 2")
        let cards = [duplicateCard1, duplicateCard2, card3]
        let deck = Deck(of: cards)
        
        // When
        _ = try deck.remove(duplicateCard2)
        
        // Then
        XCTAssert(deck.contains(duplicateCard2))
    }
    
    /// Tests that a `Deck` does not contain any instance of a `Card` that is a duplicate after removing
    /// all instances of it.
    func test_contains_cardAfterRemovingDuplicates_true() throws {
        
        // Given
        let duplicateCard1 = Card(named: "Card 1")
        let duplicateCard2 = Card(named: "Card 1")
        let card3 = Card(named: "Card 2")
        let cards1 = [duplicateCard1, duplicateCard2, card3]
        let cards2 = [duplicateCard2]
        let deck = Deck(of: cards1)
        
        // When
        _ = try deck.remove(cards2)
        
        // Then
        XCTAssertFalse(deck.contains(duplicateCard1))
    }
    
    //-------------------------------------------------------------------------//
    //                              hasCapacity()                              //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    /// Tests that a default `Deck` has capacity for a given collection of `Cards`.
    func test_hasCapacity_newDefaultDeck_true() {
        
        // Given
        let card = Card()
        let cards = [card]
        let deck = Deck()
        
        // When/Then
        XCTAssert(deck.hasCapacity(for: cards))
    }
    
    //            //
    // With Cards //
    //            //
    
    /// Tests that a`Deck` created with a set of `Cards` has capacity for a given collection of `Cards`.
    func test_hasCapacity_newDeckOfCards_true() {
        
        // Given
        let card1 = Card()
        let card2 = Card()
        let cards1 = [card1]
        let cards2 = [card2]
        let deck = Deck(of: cards1)
        
        // When/Then
        XCTAssert(deck.hasCapacity(for: cards2))
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    /// Tests that a`Deck` created with a max and set of `Cards` has capacity for a given collection of
    /// `Cards`.
    func test_hasCapacity_newDeckOfMaxCards_true() throws {
        
        // Given
        let max = 2
        let card1 = Card()
        let card2 = Card()
        let cards1 = [card1]
        let cards2 = [card2]
        let deck = try Deck(of: max, cards1)
        
        // When/Then
        XCTAssert(deck.hasCapacity(for: cards2))
    }
    
    /// Tests that a`Deck` created with a max and set of `Cards` does not have capacity for a given
    /// collection of `Cards`.
    func test_hasCapacity_newDeckOfMaxCards_false() throws {
        
        // Given
        let max = 2
        let card1 = Card()
        let card2 = Card()
        let card3 = Card()
        let cards1 = [card1]
        let cards2 = [card2, card3]
        let deck = try Deck(of: max, cards1)
        
        // When/Then
        XCTAssertFalse(deck.hasCapacity(for: cards2))
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    /// Tests that a`Deck` created with a range and set of `Cards` has capacity for a given collection of
    /// `Cards`.
    func test_hasCapacity_newDeckOfRangeCards_true() throws {
        
        // Given
        let min = 1
        let max = 2
        let card1 = Card()
        let card2 = Card()
        let cards1 = [card1]
        let cards2 = [card2]
        let deck = try Deck(of: min, to: max, cards1)
        
        // When/Then
        XCTAssert(deck.hasCapacity(for: cards2))
    }
    
    
    /// Tests that a`Deck` created with a range and set of `Cards` does not have capacity for a given
    /// collection of `Cards`.
    func test_hasCapacity_newDeckOfRangeCards_false() throws {
        
        // Given
        let min = 1
        let max = 2
        let card1 = Card()
        let card2 = Card()
        let card3 = Card()
        let cards1 = [card1]
        let cards2 = [card2, card3]
        let deck = try Deck(of: min, to: max, cards1)
        
        // When/Then
        XCTAssertFalse(deck.hasCapacity(for: cards2))
    }
    
    //=========================================================================//
    //                                 FILTERS                                 //
    //=========================================================================//
    
    /// Tests that retreiving all the `Cards` that don't exist in a given collection returns the expected
    /// `Cards`.
    func test_except_cardsEqualsExpected_true() throws {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards1 = [card1, card2, card3, card4]
        let cards2 = [card1, card4]
        let deck = Deck(of: cards1)
        let expected = [card2, card3]
        
        // When
        let actual = deck.except(cards2)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                                  ADDERS                                 //
    //=========================================================================//
    
    //              //
    // Throws Error //
    //              //
    
    /// Tests that adding a `Card` to a full `Deck` throws an `isFull` error.
    func test_add_cardToFullDeck_throwsIsFullError() throws {
        
        // Given
        let max = 3
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards = [card1, card2, card3]
        let deck = try Deck(of: max, cards)
        let expected = RangeError.isFull
        
        // When
        XCTAssertThrowsError(try deck.add(card4)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that adding `Card`s to a full `Deck` throws an `isFull` error.
    func test_add_cardsToFullDeck_throwsIsFullError() throws {
        
        // Given
        let max = 3
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let card5 = Card(named: "Card 5")
        let cards = [card1, card2, card3]
        let newCards = [card4, card5]
        let deck = try Deck(of: max, cards)
        let expected = RangeError.isFull
        
        // When
        XCTAssertThrowsError(try deck.add(newCards)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that adding more `Card`s than the capacity to a `Deck` throws a `limitedCapacity`
    /// error.
    func test_add_moreCardsThanCapacity_throwsLimitedCapacityError() throws {
        
        // Given
        let max = 4
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let card5 = Card(named: "Card 5")
        let cards = [card1, card2, card3]
        let newCards = [card4, card5]
        let deck = try Deck(of: max, cards)
        let expected = RangeError.limitedCapacity
        
        // When
        XCTAssertThrowsError(try deck.add(newCards)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //                  //
    // Increments Count //
    //                  //
    
    /// Tests that adding a `Card` to a `Deck` increments the count by one.
    func test_add_cardIncrementsCountByOne_true() throws {
    
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let cards = [card1]
        let deck = Deck(of: cards)
        let originalCount = deck.count
        let expected = cards.count
        
        // When
        try deck.add(card2)
        let actual = deck.count - originalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that adding `Card`s to a `Deck` increments the count by the # of given `Card`s.
    func test_add_cardsIncrementsCountByGivenNCards_true() throws {
    
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let card5 = Card(named: "Card 5")
        let cards = [card1, card2, card3]
        let newCards = [card4, card5]
        let deck = Deck(of: cards)
        let originalCount = deck.count
        let expected = newCards.count
        
        // When
        try deck.add(newCards)
        let actual = deck.count - originalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                                 REMOVERS                                //
    //=========================================================================//

    //              //
    // Throws Error //
    //              //
    
    /// Tests that removing a `Card` from an empty `Deck` throws an `isEmpty Error`.
    func test_remove_cardFromEmptyDeck_throwsIsEmptyError() throws {

        // Given
        let card = Card()
        let deck = Deck()
        let expected = ElementsError.isEmpty

        // When
        XCTAssertThrowsError(try deck.remove(card)) { (error) in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that removing `Cards` from an empty `Deck` throws an `isEmpty Error`.
    func test_remove_cardsFromEmptyDeck_throwsIsEmptyError() throws {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck()
        let expected = ElementsError.isEmpty
        
        // When
        XCTAssertThrowsError(try deck.remove(cards)) { (error) in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that removing a `Card` from a `Deck`that does not contain it throws a `notFound` error.
    func test_remove_nonContainedCard_throwsNotFoundError() throws {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)
        let expected = ElementsError.notFound
        
        // When
        XCTAssertThrowsError(try deck.remove(card4)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that removing `Cards` from a `Deck`that does not contain them throws a `notFound` error.
    func test_remove_nonContainedCards_throwsNotFoundError() throws {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let card5 = Card(named: "Card 5")
        let card6 = Card(named: "Card 6")
        let cards1 = [card1, card2, card3]
        let cards2 = [card4, card5, card6]
        let deck = Deck(of: cards1)
        let expected = ElementsError.notFound
        
        // When
        XCTAssertThrowsError(try deck.remove(cards2)) { (error) in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //                        //
    // Removes Expected Cards //
    //                        //
    
    /// Tests that removing a `Card` from a `Deck` returns the expected `Card`.
    func test_remove_card_true() throws {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)
        let expected = card2
        
        // When
        let actual = try deck.remove(expected)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that removing `Card`s from a `Deck` returns the expected `Card`s.
    func test_remove_cards_true() throws {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let deck = Deck(of: cards)
        let expected = cards
        
        // When
        let actual = try deck.remove(expected)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                  //
    // Decrements Count //
    //                  //
    
    /// Tests that removing  a `Card` from a `Deck` decrements the count by one.
    func test_remove_cardDecrementsCountByOne_true() throws {
    
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let cards = [card1, card2]
        let deck = Deck(of: cards)
        let originalCount = deck.count
        let expected = originalCount - 1
        
        // When
        _ = try deck.remove(card2)
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that removing `Card`s from a `Deck` decrements the count by the # of given `Card`s.
    func test_remove_cardsDecrementsCountByGivenNCards_true() throws {
    
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards1 = [card1, card2, card3]
        let cards2 = [card2, card3]
        let deck = Deck(of: cards1)
        let originalCount = deck.count
        let expected = originalCount - cards2.count
        
        // When
        _ = try deck.remove(cards2)
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
