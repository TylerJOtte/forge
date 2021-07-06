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
        let cards = [Card()]
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
        let cards = [Card()]
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
        let cards = [Card()]
        let expected = RangeError.invalidMax

        // When
        XCTAssertThrowsError(try Hand(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    /// Tests that the title of a default `Hand` equals "Hand".
    func test_title_ofDefaultHand_equalsHand() {
        
        // Given
        let hand = Hand()
        let expected = "Hand"
        
        // When
        let actual = hand.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    /// Tests that the title of a `Hand` created with `Card`s equals "Hand".
    func test_title_ofNewHandWithCards_equalsHand() {
        
        // Given
        let cards = [Card()]
        let hand = Hand(of: cards)
        let expected = "Hand"
        
        // When
        let actual = hand.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    /// Tests that the title of a `Hand` created with a max and `Card`s equals "Hand".
    func test_title_ofNewHandWithMaxAndCards_equalsHand() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: max, cards)
        let expected = "Hand"
        
        // When
        let actual = hand.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    /// Tests that the title of a `Hand` created with a range and `Card`s equals "Hand".
    func test_title_ofNewHandWithRangeAndCards_equalsHand() throws {
        
        // Given
        let min = 0
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = "Hand"
        
        // When
        let actual = hand.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               minCards                                  //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the min cards of a default `Hand` equals zero.
    func test_minCards_ofDefaultHand_equalsZero() {
        
        // Given
        let hand = Hand()
        let expected = 0
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a default `Hand` equals the count.
    func test_minCards_ofDefaultHand_equalsCount() {
        
        // Given
        let hand = Hand()
        let expected = hand.count
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Hand` created with empty `Card`s equals zero.
    func test_minCards_ofNewHandWithEmptyCards_equalsZero() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        let expected = 0
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the min cards of a `Hand` created with `Card`s equals zero.
    func test_minCards_ofNewHandWithCards_equalsZero() {
        
        // Given
        let cards = [Card()]
        let hand = Hand(of: cards)
        let expected = 0
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Hand` created with empty `Card`s equals the count.
    func test_minCards_ofNewHandWithEmptyCards_equalsCount() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        let expected = hand.count
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Hand` created with a max and empty `Card`s equals zero.
    func test_minCards_ofNewHandWithMaxAndEmptyCards_equalsZero() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: max, cards)
        let expected = 0
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the min cards of a `Hand` created with a max and `Card`s equals zero.
    func test_minCards_ofNewHandWithMaxAndCards_equalsZero() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: max, cards)
        let expected = 0
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Hand` created with a max and empty `Card`s equals the count.
    func test_minCards_ofNewHandWithMaxAndEmptyCards_equalsCount() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: max, cards)
        let expected = hand.count
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Hand` created with a max and `Card`s with a count equal to the
    /// given max equals the capacity.
    func test_minCards_ofNewHandWithMaxAndCardsWithGivenMax_equalsCapacity()
        throws {
        
        // Given
        let max = 2
        let cards = [Card(), Card()]
        let hand = try Hand(of: max, cards)
        let expected = hand.capacity
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals Given Min //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Hand` created with a range and `Card`s equals the given min.
    func test_minCards_ofNewHandWithRangeAndCards_equalsGivenMin() throws {
        
        // Given
        let min = 1
        let max = 5
        let cards = [Card(), Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = min
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals maxCards //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Hand` created with an equal min/max and `Card`s equals the
    /// maxCards.
    func test_minCards_ofNewHandWithEqualMinMaxAndCards_equalsGivenMaxCards()
        throws {
        
        // Given
        let min = 1
        let max = 1
        let cards = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = hand.maxCards
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Hand` created with a range and `Card`s with a count equal to the
    /// given min equals the count.
    func test_minCards_ofNewHandWithRangeAndCardsEqualToGivenMin_equalsCount()
        throws {
        
        // Given
        let min = 1
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = hand.count
        
        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the min cards of a `Hand` created with a zero to max range and full `Card`s equals
    /// the capacity.
    func test_minCards_ofNewHandWithZeroToMaxRangeAndFullCards_equalsCapacity()
        throws {
        
        // Given
        let min = 0
        let max = 2
        let cards = [Card(), Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = hand.capacity
        
        // When
        let actual = hand.minCards

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
    
    /// Tests that the max cards of a default `Hand` equals the system max.
    func test_maxCards_ofDefaultHand_equalsSystemMax() {
        
        // Given
        let hand = Hand()
        let expected = Int.max
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a default `Hand` equals the capacity
    func test_maxCards_ofDefaultHand_equalsCapacity() {
        
        // Given
        let hand = Hand()
        let expected = hand.capacity
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals System Max //
    // ~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Hand` created with empty `Card`s equals the system max.
    func test_maxCards_ofNewHandWithEmptyCards_equalsSystemMax() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        let expected = Int.max
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards of a `Hand` created with `Card`s equals the system max.
    func test_maxCards_ofNewHandWithCards_equalsSystemMax() {
        
        // Given
        let cards = [Card()]
        let hand = Hand(of: cards)
        let expected = Int.max
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Hand` created with empty `Card`s equals the capacity.
    func test_maxCards_ofNewHandWithEmptyCards_equalsCapacity() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        let expected = hand.capacity
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // Equals Given Max //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Hand` created with a max and `Card`s equals the given max.
    func test_maxCards_ofNewHandWithMaxAndCards_equalsGivenMax() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: max, cards)
        let expected = max
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Hand` created with a max and full `Card`s equals the count.
    func test_maxCards_ofNewHandWithMaxAndFullCards_equalsCount() throws {
        
        // Given
        let max = 1
        let cards = [Card()]
        let hand = try Hand(of: max, cards)
        let expected = hand.count
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Hand` created with a max and empty `Card`s equals the capacity.
    func test_maxCards_ofNewHandWithMaxAndEmptyCards_equalsCapacity() throws {
        
        // Given
        let max = 1
        let cards: [Card] = []
        let hand = try Hand(of: max, cards)
        let expected = hand.capacity
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals Given Max //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Hand` created with a range and `Card`s equals the given max.
    func test_maxCards_ofNewHandWithRangeAndCards_equalsGivenMax() throws {
        
        // Given
        let min = 1
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = max
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals minCards //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Hand` created with an equal min/max and `Card`s equals the
    /// minCards.
    func test_maxCards_ofNewHandWithEqualMinMaxAndCards_equalsMinCards() throws {
        
        // Given
        let min = 1
        let max = 1
        let cards = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = hand.minCards
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Count //
    // ~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Hand` created with a range and full `Card`s equals the count.
    func test_maxCards_ofNewHandWithRangeAndFullCards_equalsCount() throws {
        
        // Given
        let min = 1
        let max = 2
        let cards = [Card(), Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = hand.count
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Capacity //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the max cards of a `Hand` created with a zero to max range and empty `Card`s
    /// equals the capacity.
    func test_maxCards_ofNewHandWithZeroToMaxRangeAndEmptyCards_equalsCapacity()
        throws {
        
        // Given
        let min = 0
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: min, to: max, cards)
        let expected = hand.capacity
        
        // When
        let actual = hand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 count                                   //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the count of a default `Hand` equals the # of given `Card`s.
    func test_count_ofDefaultHand_equalsGivenCardsCount() {
        
        // Given
        let hand = Hand()
        let expected = 0
        
        // When
        let actual = hand.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals Given Card's Count //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the count of a `Hand` created with `Card`s equals the # of given `Card`s.
    func test_count_ofNewHandWithCards_equalsGivenCardsCount() {
        
        // Given
        let cards = [Card()]
        let hand = Hand(of: cards)
        let expected = 1
        
        // When
        let actual = hand.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // Equals Given Card's Count //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the count of a `Hand` created with a max and `Card`s equals the # of given `Card`s.
    func test_count_ofNewHandWithMaxAndCards_equalsGivenCardsCount() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: max, cards)
        let expected = 1
        
        // When
        let actual = hand.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals Given Card's Count //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the count of a `Hand` created with a range and `Card`s equals the # of given `Card`s.
    func test_count_ofNewHandWithRangeAndCards_equalsGivenCardsCount() throws {
        
        // Given
        let min = 1
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = 1
        
        // When
        let actual = hand.count

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
    
    /// Tests that the capacity of a default `Hand` equals the system max.
    func test_capacity_ofDefaultHand_equalsSystemMax() {
        
        // Given
        let hand = Hand()
        let expected = Int.max
        
        // When
        let actual = hand.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals System Max //
    // ~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Hand` created with empty `Card`s equals the system max.
    func test_capacity_ofNewHandWithEmptyCards_equalsSystemMax() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        let expected = Int.max
        
        // When
        let actual = hand.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Hand` created with `Card`s equals the expected value.
    func test_capacity_ofNewHandWithCards_equalsExpected() {
        
        // Given
        let cards = [Card()]
        let hand = Hand(of: cards)
        let expected = 9223372036854775806
        
        // When
        let actual = hand.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    
    // Equals Given Max //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Hand` created with a max and empty `Card`s equals the given max.
    func test_capacity_ofNewHandWithMaxAndEmptyCards_equalsGivenMax() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: max, cards)
        let expected = max
        
        // When
        let actual = hand.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Hand` created with a max and `Card`s equals the expected value.
    func test_capacity_ofNewHandWithMaxAndCards_equalsExpected() throws {
        
        // Given
        let max = 5
        let cards: [Card] = [Card()]
        let hand = try Hand(of: max, cards)
        let expected = 4
        
        // When
        let actual = hand.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Hand` created with a max and  and full `Card`s equals zero.
    func test_capacity_ofNewHandWithMaxAndFullCards_equalsZero() throws {
        
        // Given
        let max = 1
        let cards: [Card] = [Card()]
        let hand = try Hand(of: max, cards)
        let expected = 0
        
        // When
        let actual = hand.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals Given Max //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Hand` created with a zero to max range and empty `Card`s equals the
    /// given max.
    func test_capacity_ofNewHandWithZeroToMaxRangeAndEmptyCards_equalsGivenMax()
        throws {
        
        // Given
        let min = 0
        let max = 3
        let cards: [Card] = []
        let hand = try Hand(of: min, to: max, cards)
        let expected = max
        
        // When
        let actual = hand.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Hand` created with a range and `Card`s equals the expected value.
    func test_capacity_ofNewHandWithRangeAndCards_equalsExpected()
        throws {
        
        // Given
        let min = 1
        let max = 3
        let cards: [Card] = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = 2
        
        // When
        let actual = hand.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals Zero //
    // ~~~~~~~~~~~ //
    
    /// Tests that the capacity of a `Hand` created with a range and full `Card`s equals zero.
    func test_capacity_ofNewHandWithRangeAndFullCards_equalsZero()
        throws {
        
        // Given
        let min = 1
        let max = 1
        let cards: [Card] = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = 0
        
        // When
        let actual = hand.capacity

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 cards                                   //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    //            //
    // With Cards //
    //            //
    
    // Contains Given Cards //
    // ~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the `Card`s of a `Hand` created with `Card`s contains the given `Card`s.
    func test_cards_ofNewHandWithCards_containsGivenCards_() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)

        // When/Then
        XCTAssert(hand.contains(cards))
    }
    
    //                    //
    // With Max and Cards //
    //                    //

    // Contains Given Cards //
    // ~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the`Card`s of a `Hand` created with a max and `Card`s contains the given `Card`s.
    func test_cards_ofNewHandWithMaxAndCards_equalsGivenCardsCount() throws {
        
        // Given
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: max, cards)

        // When/Then
        XCTAssert(hand.contains(cards))
    }
    
    //                      //
    // With Range And Cards //
    //                      //

    // Contains Given Cards //
    // ~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that the`Card`s  of a `Hand` created with a range and `Card`s contains the given `Card`s.
    func test_cards_ofNewHandWithRangeAndCards_equalsGivenCardsCount() throws {
        
        // Given
        let min = 1
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: min, to: max, cards)
        
        // When/Then
        XCTAssert(hand.contains(cards))
    }
    
    //-------------------------------------------------------------------------//
    //                                 first                                   //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    // Equals nil //
    // ~~~~~~~~~~ //
    
    /// Tests that the first `Card` in a default `Hand` equals `nil`.
    func test_first_ofDefaultHand_equalsNil() {
        
        // Given
        let hand = Hand()
        
        // When
        let first = hand.first
        
        // Then
        XCTAssertNil(first)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals nil //
    // ~~~~~~~~~~ //
    
    /// Tests that the first `Card` of `Hand` created with empty `Card`s equals `nil`.
    func test_first_ofNewHandWithEmptyCards_equalsNil() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        
        // When
        let first = hand.first

        // Then
        XCTAssertNil(first)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the first `Card` of `Hand` created with `Card`s equals the expected value.
    func test_first_ofNewHandWithCards_equalsExpected() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        let expected = card1
        
        // When
        let actual = hand.first

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals last //
    // ~~~~~~~~~~~ //
    
    /// Tests that the first `Card` of `Hand` created with one`Card` equals the last `Card`.
    func test_first_ofNewHandWithOneCard_equalsLast() {
        
        // Given
        let cards = [Card()]
        let hand = Hand(of: cards)
        let expected = hand.last
        
        // When
        let actual = hand.first

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // Equals nil //
    // ~~~~~~~~~~ //
    
    /// Tests that the first `Card` of a `Hand` created with a max  and empty `Card`s equals `nil`.
    func test_first_ofNewHandWithMaxAndEmptyCards_equalsNil() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: max, cards)
        
        // When
        let first = hand.first

        // Then
        XCTAssertNil(first)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the first `Card` of a `Hand` created with a max  and empty `Card`s equals the
    /// expected value.
    func test_first_ofNewHandWithMaxAndCards_equalsExpected() throws {
        
        // Given
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: max, cards)
        let expected = card1
        
        // When
        let actual = hand.first

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals last //
    // ~~~~~~~~~~~ //
    
    /// Tests that the first `Card` of a `Hand` created with a max  and one`Card` equals the last `Card`.
    func test_first_ofNewHandWithMaxAndOneCard_equalsLast() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: max, cards)
        let expected = hand.last
        
        // When
        let actual = hand.first

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals nil //
    // ~~~~~~~~~~ //
    
    /// Tests that the first `Card` of a `Hand` created with a range and empty `Card`sequals `nil`.
    func test_first_ofNewHandWithRangeAndEmptyCards_equalsNil() throws {
        
        // Given
        let min = 0
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: min, to: max, cards)
        
        // When
        let first = hand.first

        // Then
        XCTAssertNil(first)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the first `Card` of a `Hand` created with a range and empty `Card`s equals the
    /// expected value.
    func test_first_ofNewHandWithRangeAndCards_equalsExpected() throws {
        
        // Given
        let min = 0
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: min, to: max, cards)
        let expected = card1
        
        // When
        let actual = hand.first

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Equals last //
    // ~~~~~~~~~~~ //
    
    /// Tests that the first `Card` of a `Hand` created with a range and one`Card` equals the last
    /// `Card`.
    func test_first_ofNewHandWithRangeAndOneCard_equalsLast() throws {
        
        // Given
        let min = 0
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        let expected = hand.last
        
        // When
        let actual = hand.first

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                  last                                   //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    // Equals nil //
    // ~~~~~~~~~~ //
    
    /// Tests that the last `Card` in a default `Hand` equals `nil`.
    func test_last_ofDefaultHand_equalsNil() {
        
        // Given
        let hand = Hand()
        
        // When
        let last = hand.last
        
        // Then
        XCTAssertNil(last)
    }
    
    //            //
    // With Cards //
    //            //
    
    // Equals nil //
    // ~~~~~~~~~~ //
    
    /// Tests that the last`Card` of `Hand` created with empty `Card`s equals `nil`.
    func test_last_ofNewHandWithEmptyCards_equalsNil() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        
        // When
        let last = hand.last

        // Then
        XCTAssertNil(last)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the last `Card` of `Hand` created with `Card`s equals the expected value.
    func test_last_ofNewHandWithCards_equalsExpected() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        let expected = card3
        
        // When
        let actual = hand.last

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // Equals nil //
    // ~~~~~~~~~~ //
    
    /// Tests that the last `Card` of a `Hand` created with a max and empty `Card`s equals `nil`.
    func test_last_ofNewHandWithMaxAndEmptyCards_equalsNil() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: max, cards)
        
        // When
        let last = hand.last

        // Then
        XCTAssertNil(last)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the last`Card` of a `Hand` created with a max  and empty `Card`s equals the
    /// expected value.
    func test_last_ofNewHandWithMaxAndCards_equalsExpected() throws {
        
        // Given
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: max, cards)
        let expected = card3
        
        // When
        let actual = hand.last

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // Equals nil //
    // ~~~~~~~~~~ //
    
    /// Tests that the last `Card` of a `Hand` created with a range and empty `Card`sequals `nil`.
    func test_last_ofNewHandWithRangeAndEmptyCards_equalsNil() throws {
        
        // Given
        let min = 0
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: min, to: max, cards)
        
        // When
        let last = hand.last

        // Then
        XCTAssertNil(last)
    }
    
    // Equals Expected //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that the last `Card` of a `Hand` created with a range and empty `Card`s equals the
    /// expected value.
    func test_last_ofNewHandWithRangeAndCards_equalsExpected() throws {
        
        // Given
        let min = 0
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: min, to: max, cards)
        let expected = card3
        
        // When
        let actual = hand.last

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                isEmpty()                                //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    /// Tests that a default `Hand` is empty.
    func test_isEmpty_withDefaultHand_true() {
        
        // Given
        let hand = Hand()
        
        // When/Then
        XCTAssert(hand.isEmpty())
    }
    
    //            //
    // With Cards //
    //            //

    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with empty `Card`s is empty.
    func test_isEmpty_newHandWithEmptyCards_true() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssert(hand.isEmpty())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with partial `Card`s is not empty.
    func test_isEmpty_newHandWithPartialCards_false() {
        
        // Given
        let cards = [Card()]
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssertFalse(hand.isEmpty())
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a max and empty `Card`s is empty.
    func test_isEmpty_newHandWithMaxAndEmptyCards_true() throws {
        
        // Given
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: max, cards)
        
        // When/Then
        XCTAssert(hand.isEmpty())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a max and partial `Card`s is not empty.
    func test_isEmpty_newHandWithMaxAndPartialCards_false() throws {
        
        // Given
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: max, cards)
        
        // When/Then
        XCTAssertFalse(hand.isEmpty())
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a range and empty `Card`s is empty.
    func test_isEmpty_newHandWithRangeAndEmptyCards_true() throws {
        
        // Given
        let min = 0
        let max = 5
        let cards: [Card] = []
        let hand = try Hand(of: min, to: max, cards)
        
        // When/Then
        XCTAssert(hand.isEmpty())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a range and partial `Card`s is not empty.
    func test_isEmpty_newHandWithRangeAndPartialCards_false() throws {
        
        // Given
        let min = 0
        let max = 5
        let cards = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        
        // When/Then
        XCTAssertFalse(hand.isEmpty())
    }
    
    //-------------------------------------------------------------------------//
    //                                 isFull()                                //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    /// Tests that a default `Hand` is not full.
    func test_isFull_withDefaultHand_false() {
        
        // Given
        let hand = Hand()
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    //            //
    // With Cards //
    //            //

    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with empty `Card`s is not full.
    func test_isFull_newHandWithEmptyCards_false() {
        
        // Given
        let cards: [Card] = []
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with partial `Card`s is not full.
    func test_isFull_newHandWithPartialCards_false() {
        
        // Given
        let cards = [Card()]
        let hand = Hand(of: cards)
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    //                    //
    // With Max and Cards //
    //                    //
    
    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a max and empty `Card`s is not full.
    func test_isFull_newHandWithMaxAndEmptyCards_false() throws {
        
        // Given
        let max = 2
        let cards: [Card] = []
        let hand = try Hand(of: max, cards)
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a max and partial `Card`s is not full.
    func test_isFull_newHandWithMaxAndPartialCards_false() throws {
        
        // Given
        let max = 2
        let cards = [Card()]
        let hand = try Hand(of: max, cards)
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    // With Full Cards //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a max and full `Card`s is full.
    func test_isFull_newHandWithMaxAndFullCards_true() throws {
        
        // Given
        let max = 2
        let cards = [Card(), Card()]
        let hand = try Hand(of: max, cards)
        
        // When/Then
        XCTAssert(hand.isFull())
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    // With Empty Cards //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a range and empty `Card`s is not full.
    func test_isFull_newHandWithRangeAndEmptyCards_false() throws {
        
        // Given
        let min = 0
        let max = 2
        let cards: [Card] = []
        let hand = try Hand(of: min, to: max, cards)
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    // With Partial Cards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a range and partial `Card`s is not full.
    func test_isFull_newHandWithRangeAndPartialCards_false() throws {
        
        // Given
        let min = 0
        let max = 2
        let cards = [Card()]
        let hand = try Hand(of: min, to: max, cards)
        
        // When/Then
        XCTAssertFalse(hand.isFull())
    }
    
    // With Full Cards //
    // ~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Hand` created with a range and full `Card`s is full.
    func test_isFull_newHandWithRangeAndFullCards_true() throws {
        
        // Given
        let min = 0
        let max = 2
        let cards = [Card(), Card()]
        let hand = try Hand(of: min, to: max, cards)
        
        // When/Then
        XCTAssert(hand.isFull())
    }
    
    //-------------------------------------------------------------------------//
    //                                Contains                                 //
    //-------------------------------------------------------------------------//
    
    //         //
    // Default //
    //         //
    
    /// Tests that a default `Hand` does not contain a `Card`.
    func test_contains_cardWithDefaultHand_false() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let hand = Hand()
        let expected = card1

        // When/Then
        XCTAssertFalse(hand.contains(expected))
    }
    
    //            //
    // With Cards //
    //            //
    
    /// Tests that a `Hand`created with `Card`s contains an expected`Card`.
    func test_contains_cardWithCards_true() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        let expected = card2

        // When/Then
        XCTAssert(hand.contains(expected))
    }
    
    /// Tests that a `Hand`created with `Card`s does not contain a `Card`.
    func test_contains_cardWithCards_false() {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        let expected = card4

        // When/Then
        XCTAssertFalse(hand.contains(expected))
    }

    //                    //
    // With Max and Cards //
    //                    //
    
    /// Tests that a `Hand`created with a max and `Card`s contains an expected `Card`.
    func test_contains_cardWithMaxAndCards_true() throws {
        
        // Given
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: max, cards)
        let expected = card2

        // When/Then
        XCTAssert(hand.contains(expected))
    }
    
    /// Tests that a `Hand`created with a max and `Card`s does not contain a `Card`.
    func test_contains_cardWithMaxAndCards_false() throws {
        
        // Given
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: max, cards)
        let expected = card4

        // When/Then
        XCTAssertFalse(hand.contains(expected))
    }
    
    //                      //
    // With Range And Cards //
    //                      //
    
    /// Tests that a `Hand`created with a range and `Card`s contains an expected`Card`.
    func test_contains_cardWithRangeAndCards_true() throws {
        
        // Given
        let min = 3
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: min, to: max, cards)
        let expected = card2

        // When/Then
        XCTAssert(hand.contains(expected))
    }
    
    /// Tests that a `Hand`created with a range and `Card`s does not contain a `Card`.
    func test_contains_cardWithRangeAndCards_false() throws {
        
        // Given
        let min = 3
        let max = 5
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let card4 = Card(named: "Card 4")
        let cards = [card1, card2, card3]
        let hand = try Hand(of: min, to: max, cards)
        let expected = card4

        // When/Then
        XCTAssertFalse(hand.contains(expected))
    }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                Contains                                 //
    //-------------------------------------------------------------------------//
    
    //             //
    // Added Cards //
    //             //
    
    /// Tests that a `Hand` contains a `Card` that was added to it.
    func test_contains_addedCard_true() throws {

        // Given
        let card = Card()
        let hand = Hand()

        // When
        try hand.add(card)

        // Then
        XCTAssert(hand.contains(card))
    }
    
    /// Tests that a `Hand` contains the `Card`s that were added to it.
    func test_contains_addedCards_true() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)

        // When
        try hand.add(cards)

        // Then
        XCTAssert(hand.contains(cards))
    }
    
    //               //
    // Removed Cards //
    //               //

    /// Tests that a `Hand` does not contain a `Card` that was removed from it.
    func test_contains_removedCard_false() throws {
        
        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)
        
        // When
        let removedCard = try hand.remove(card2)
        
        // Then
        XCTAssertFalse(hand.contains(removedCard))
    }
    
    /// Tests that a `Hand` does not contain the `Card`s that were removed from it.
    func test_contains_removedCards_false() throws {

        // Given
        let card1 = Card(named: "Card 1")
        let card2 = Card(named: "Card 2")
        let card3 = Card(named: "Card 3")
        let cards = [card1, card2, card3]
        let hand = Hand(of: cards)

        // When
        let removedCards = try hand.remove(cards)

        // Then
        XCTAssertFalse(hand.contains(removedCards))
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
