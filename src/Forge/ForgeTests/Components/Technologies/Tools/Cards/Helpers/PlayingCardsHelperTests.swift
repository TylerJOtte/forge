//=============================================================================//
//                                                                             //
//  PlayingCardsHelperTests.swift                                              //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/20/21.                                       //
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

/// Unit tests for a `PlayingCards` helper.
class PlayingCardsHelperTests: XCTestCase {
    
    // TODO: Find a way to test assertions for commented out code below
    
    //=========================================================================//
    //                                  GETTERS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                             getNumeralCards()                           //
    //-------------------------------------------------------------------------//
    
    //               //
    // With One Suit //
    //               //
    
//    /// Tests that retrieving all `NumeralCard`s with an invalid `Suit` an `invalidSuit`
//    /// `Error`.
//    func test_getNumeralCards_withInvalidSuit_throwsInvalidSuitError() {
//
//        // Given
//        let suit = Suit.stars
//        let expected = DepictionError.invalidSuit
//
//        // When
//        XCTAssertThrowsError(PlayingCards.getNumeralCards(with: suit)) {
//            error in
//
//            // Then
//            XCTAssertEqual(expected, error as? DepictionError)
//        }
//    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns ten `NumeralCard`s.
    func test_getNumeralCards_withSuit_returnsTenNumeralCards() {

        // Given
        let suit = Suit.hearts
        let expected = 10
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with an `ace rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneAceRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.ace
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with a `two rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTwoRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.two
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with a `three rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneThreeRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.three
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with a `four rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFourRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.four
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with a `five rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFiveRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.five
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with a `six rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSixRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.six
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with a `seven rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSevenRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.seven
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with an `eight rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneEightRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.eight
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with a `nine rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneNineRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.nine
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `NumeralCard` with a `ten rank`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTenRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.ten
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain the given  `Suit`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyGivenSuit() {

        // Given
        let suit = Suit.hearts
        let expected = suit
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suit)

        // Then
        XCTAssert(numeralCards.contain(only: expected))
    }
    
    //                     //
    // With Multiple Suits //
    //                     //
    
//    /// Tests that retrieving all `NumeralCard`s with `Suit`s that contain an invalid `Suit` an
//    /// `invalidSuit Error`.
//    func test_getNumeralCards_withInvalidSuits_throwsInvalidSuitError() {
//
//        // Given
//        let suit1 = Suit.hearts
//        let suit2 = Suit.stars
//        let suits = [suit1, suit2]
//        let expected = DepictionError.invalidSuit
//
//        // When
//        XCTAssertThrowsError(PlayingCards.getNumeralCards(with: suits)) {
//            error in
//
//            // Then
//            XCTAssertEqual(expected, error as? DepictionError)
//        }
//    }
    
    // One Suit //
    // ~~~~~~~~ //
    
    /// Tests that retrieving all`NumeralCard`s with one `Suit` returns ten `NumeralCard`s.
    func test_getNumeralCards_withOneSuit_returnsTenNumeralCards() {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 10
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suits)
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with one `Suit`s returns `NumeralCard`s that
    /// only contain the given  `Suit`.
    func test_getNumeralCards_withOneSuit_returnsCardsWithOnlyGivenSuit()
        {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = suits
        
        // When
        let numeralCards = PlayingCards.getNumeralCards(with: suits)

        // Then
        XCTAssert(numeralCards.contain(only: expected))
    }
    
    // Default Suits //
    // ~~~~~~~~~~~~~ //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns 40 `NumeralCard`s.
    func test_getNumeralCards_withDefaultSuits_returns40NumeralCards() {

        // Given
        let expected = 40
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Aces //
            
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ace` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneAceOfHearts()
        throws {

        // Given
        let aceOfHearts = try Ace(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: aceOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ace` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneAceOfSpades()
        throws {

        // Given
        let aceOfSpades = try Ace(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: aceOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ace` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneAceOfDiamonds()
        throws {

        // Given
        let aceOfDiamonds = try Ace(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: aceOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ace` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneAceOfClubs()
        throws {

        // Given
        let aceOfClubs = try Ace(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: aceOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Twos //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Two` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneTwoOfHearts()
        throws {

        // Given
        let twoOfHearts = try Two(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: twoOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Two` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneTwoOfSpades()
        throws {

        // Given
        let twoOfSpades = try Two(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: twoOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Two` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneTwoOfDiamonds()
        throws {

        // Given
        let twoOfDiamonds = try Two(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: twoOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Two` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneTwoOfClubs()
        throws {

        // Given
        let twoOfClubs = try Two(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: twoOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Threes //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Three` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneThreeOfHearts()
        throws {

        // Given
        let threeOfHearts = try Three(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: threeOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Three` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneThreeOfSpades()
        throws {

        // Given
        let threeOfSpades = try Three(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: threeOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Three` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneThreeOfDiamonds()
        throws {

        // Given
        let threeOfDiamonds = try Three(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: threeOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Three` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneThreeOfClubs()
        throws {

        // Given
        let threeOfClubs = try Three(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: threeOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Fours //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Four` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneFourOfHearts()
        throws {

        // Given
        let fourOfHearts = try Four(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: fourOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Four` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneFourOfSpades()
        throws {

        // Given
        let fourOfSpades = try Four(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: fourOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Four` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneFourOfDiamonds()
        throws {

        // Given
        let fourOfDiamonds = try Four(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: fourOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Four` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneFourOfClubs()
        throws {

        // Given
        let fourOfClubs = try Four(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: fourOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Fives //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Five` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneFiveOfHearts()
        throws {

        // Given
        let fiveOfHearts = try Five(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: fiveOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Five` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneFiveOfSpades()
        throws {

        // Given
        let fiveOfSpades = try Five(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: fiveOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Five` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneFiveOfDiamonds()
        throws {

        // Given
        let fiveOfDiamonds = try Five(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: fiveOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Five` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneFiveOfClubs()
        throws {

        // Given
        let fiveOfClubs = try Five(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: fiveOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Sixes //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Six` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneSixOfHearts()
        throws {

        // Given
        let sixOfHearts = try Six(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: sixOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Six` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneSixOfSpades()
        throws {

        // Given
        let sixOfSpades = try Six(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: sixOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Six` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneSixOfDiamonds()
        throws {

        // Given
        let sixOfDiamonds = try Six(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: sixOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Six` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneSixOfClubs()
        throws {

        // Given
        let sixOfClubs = try Six(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: sixOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Sevens //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Seven` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneSevenOfHearts()
        throws {

        // Given
        let sevenOfHearts = try Seven(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: sevenOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Seven` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneSevenOfSpades()
        throws {

        // Given
        let sevenOfSpades = try Seven(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: sevenOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Seven` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneSevenOfDiamonds()
        throws {

        // Given
        let sevenOfDiamonds = try Seven(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: sevenOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Seven` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneSevenOfClubs()
        throws {

        // Given
        let sevenOfClubs = try Seven(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: sevenOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Eights //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Eight` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneEightOfHearts()
        throws {

        // Given
        let eightOfHearts = try Eight(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: eightOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Eight` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneEightOfSpades()
        throws {

        // Given
        let eightOfSpades = try Eight(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: eightOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Eight` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneEightOfDiamonds()
        throws {

        // Given
        let eightOfDiamonds = try Eight(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: eightOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Eight` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneEightOfClubs()
        throws {

        // Given
        let eightOfClubs = try Eight(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: eightOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Nines //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Nine` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneNineOfHearts()
        throws {

        // Given
        let nineOfHearts = try Nine(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: nineOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Nine` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneNineOfSpades()
        throws {

        // Given
        let nineOfSpades = try Nine(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: nineOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Nine` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneNineOfDiamonds()
        throws {

        // Given
        let nineOfDiamonds = try Nine(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: nineOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Nine` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneNineOfClubs()
        throws {

        // Given
        let nineOfClubs = try Nine(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: nineOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Tens //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ten` of `heart`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneTenOfHearts()
        throws {

        // Given
        let tenOfHearts = try Ten(of: .hearts)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: tenOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ten` of `spade`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneTenOfSpades()
        throws {

        // Given
        let tenOfSpades = try Ten(of: .spades)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: tenOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ten` of `diamond`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneTenOfDiamonds()
        throws {

        // Given
        let tenOfDiamonds = try Ten(of: .diamonds)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: tenOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ten` of `club`s.
    func test_getNumeralCards_withDefaultSuits_returnsOnlyOneTenOfClubs()
        throws {

        // Given
        let tenOfClubs = try Ten(of: .clubs)
        let expected = 1
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()
        let actual = numeralCards.getCount(of: tenOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }

    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain the standard  `Suit`s.
    func test_getNumeralCards_withDefaultSuits_returnsCardsWithOnlyStandardSuits()
        throws {

        // Given
        let expected = PlayingCards.suits
        
        // When
        let numeralCards = PlayingCards.getNumeralCards()

        // Then
        XCTAssert(numeralCards.contain(only: expected))
    }

    //-------------------------------------------------------------------------//
    //                              getFaceCards()                             //
    //-------------------------------------------------------------------------//
    
    //               //
    // With One Suit //
    //               //
    
//    /// Tests that retrieving all `FaceCard`s with an invalid `Suit` an `invalidSuit Error`.
//    func test_getFaceCards_withInvalidSuit_throwsInvalidSuitError() {
//
//        // Given
//        let suit = Suit.stars
//        let expected = DepictionError.invalidSuit
//
//        // When
//        XCTAssertThrowsError(PlayingCards.getFaceCards(with: suit)) {
//            error in
//
//            // Then
//            XCTAssertEqual(expected, error as? DepictionError)
//        }
//    }
    
    /// Tests that retrieving all `FaceCard`s with a `Suit` returns three `FaceCard`s.
    func test_getFaceCards_withSuit_returnsThreeFaceCards() {

        // Given
        let suit = Suit.hearts
        let expected = 3
        
        // When
        let faceCards = PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `FaceCard` with a `jack rank`.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneJackRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.jack
        let expected = 1
        
        // When
        let faceCards = PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `FaceCard` with a `queen rank`.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneQueenRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.queen
        let expected = 1
        
        // When
        let faceCards = PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `FaceCard` with a `king rank`.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneKingRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.king
        let expected = 1
        
        // When
        let faceCards = PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with a `Suit` returns `FaceCard`s that only contain the
    /// given  `Suit`.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyGivenSuit() {

        // Given
        let suit = Suit.hearts
        let expected = suit
        
        // When
        let faceCards = PlayingCards.getFaceCards(with: suit)

        // Then
        XCTAssert(faceCards.contain(only: expected))
    }
    
    //                     //
    // With Multiple Suits //
    //                     //
    
//    /// Tests that retrieving all`FaceCard`s with `Suit`s that contain an invalid `Suit` an
//    /// `invalidSuit Error`.
//    func test_getFaceCards_withInvalidSuits_throwsInvalidSuitError() {
//
//        // Given
//        let suit1 = Suit.hearts
//        let suit2 = Suit.stars
//        let suits = [suit1, suit2]
//        let expected = DepictionError.invalidSuit
//
//        // When
//        XCTAssertThrowsError(PlayingCards.getFaceCards(with: suits)) {
//            error in
//
//            // Then
//            XCTAssertEqual(expected, error as? DepictionError)
//        }
//    }
    
    // One Suit //
    // ~~~~~~~~ //
    
    /// Tests that retrieving all`FaceCard`s with one `Suit` returns ten `FaceCard`s.
    func test_getFaceCards_withOneSuit_returnsTenFaceCards() {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 3
        
        // When
        let faceCards = PlayingCards.getFaceCards(with: suits)
        let actual = faceCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with one `Suit`s returns `FaceCard`s that only contain the
    /// given  `Suit`.
    func test_getFaceCards_withOneSuit_returnsCardsWithOnlyGivenSuit()
        {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = suits
        
        // When
        let faceCards = PlayingCards.getFaceCards(with: suits)

        // Then
        XCTAssert(faceCards.contain(only: expected))
    }
    
    // Default Suits //
    // ~~~~~~~~~~~~~ //
    
    /// Tests that retrieving all`FaceCard`s with the default `Suit`s returns 12 `FaceCard`s.
    func test_getFaceCards_withDefaultSuits_returns12FaceCards() {

        // Given
        let expected = 12
        
        // When
        let faceCards = PlayingCards.getFaceCards()
        let actual = faceCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Jacks //
     
    /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
    /// contain one`Jack` of `heart`s.
    func test_getFaceCards_withDefaultSuits_returnsOnlyOneJackOfHearts() throws {

         // Given
        let jackOfHearts = try Jack(of: .hearts)
        let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: jackOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `Jack` of `spade`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneJackOfSpades()
        throws {

         // Given
         let jackOfSpades = try Jack(of: .spades)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: jackOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `Jack` of `diamond`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneJackOfDiamonds()
        throws {
        
        // Given
        let jackOfDiamonds = try Jack(of: .diamonds)
        let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: jackOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `Jack` of `club`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneJackOfClubs() throws {

         // Given
         let jackOfClubs = try Jack(of: .clubs)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: jackOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Queens //
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `Queen` of `heart`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneQueenOfHearts()
        throws {

         // Given
         let queenOfHearts = try Queen(of: .hearts)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: queenOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `Queen` of `spade`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneQueenOfSpades()
        throws {

         // Given
         let queenOfSpades = try Queen(of: .spades)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: queenOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `Queen` of `diamond`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneQueenOfDiamonds()
        throws {

         // Given
         let queenOfDiamonds = try Queen(of: .diamonds)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: queenOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `Queen` of `club`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneQueenOfClubs()
        throws {

         // Given
         let queenOfClubs = try Queen(of: .clubs)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: queenOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Kings //
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `King` of `heart`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneKingOfHearts()
        throws {

         // Given
         let kingOfHearts = try King(of: .hearts)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: kingOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `King` of `spade`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneKingOfSpades()
        throws {

         // Given
        let kingOfSpades = try King(of: .spades)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: kingOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `King` of `diamond`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneKingOfDiamonds()
        throws {

         // Given
         let kingOfDiamonds = try King(of: .diamonds)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: kingOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
     /// contain one `King` of `club`s.
     func test_getFaceCards_withDefaultSuits_returnsOnlyOneKingOfClubs() throws {

         // Given
         let kingOfClubs = try King(of: .clubs)
         let expected = 1
         
         // When
         let faceCards = PlayingCards.getFaceCards()
         let actual = faceCards.getCount(of: kingOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
    
    /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
    /// contains the standard  `Suit`s.
    func test_getFaceCards_withDefaultSuits_returnsCardsWithOnlyStandardSuits()
        throws {

        // Given
        let expected = PlayingCards.suits
        
        // When
        let faceCards = PlayingCards.getFaceCards()

        // Then
        XCTAssert(faceCards.contain(only: expected))
    }
    
    //-------------------------------------------------------------------------//
    //                           getStandardCards()                            //
    //-------------------------------------------------------------------------//
    
    //               //
    // With One Suit //
    //               //
    
//    /// Tests that retrieving all standard `PlayingCard`s with an invalid `Suit` an
//    /// `invalidSuit Error`.
//    func test_getStandardCards_withInvalidSuit_throwsInvalidSuitError() {
//
//        // Given
//        let suit = Suit.stars
//        let expected = DepictionError.invalidSuit
//
//        // When
//        XCTAssertThrowsError(PlayingCards.getStandardCards(with: suit)) {
//            error in
//
//            // Then
//            XCTAssertEqual(expected, error as? DepictionError)
//        }
//    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns 13 `PlayingCard`s.
    func test_getStandardCards_withSuit_returns13PlayingCards() {

        // Given
        let suit = Suit.hearts
        let expected = 13
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with an `ace rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneAceRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.ace
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `two rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneTwoRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.two
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `three rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneThreeRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.three
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `four rank`.
    func test_geStandardCards_withSuit_returnsCardsWithOnlyOneFourRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.four
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `five rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneFiveRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.five
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `six rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneSixRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.six
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `seven rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneSevenRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.seven
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with an `eight rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneEightRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.eight
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `nine rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneNineRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.nine
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `ten rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneTenRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.ten
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `jack rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneJackRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.jack
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `queen rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneQueenRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.queen
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contain one `PlayingCard` with a `king rank`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneKingRank()
        {

        // Given
        let suit = Suit.hearts
        let rank = Rank.king
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// contain zero `PlayingCard` with a `joker rank`.
    func test_getStandardCards_withSuit_returnsCardsWithZeroJokerRanks() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.joker
        let expected = 0
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains the given  `Suit`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyGivenSuit() {

        // Given
        let suit = Suit.hearts
        let expected = suit
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suit)

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }
    
    //                     //
    // With Multiple Suits //
    //                     //
    
//    /// Tests that retrieving all standard`PlayingCard`s with `Suit`s that contain an invalid `Suit`
//    /// an `invalidSuit Error`.
//    func test_getStandardCards_withInvalidSuits_throwsInvalidSuitError() {
//
//        // Given
//        let suit1 = Suit.hearts
//        let suit2 = Suit.stars
//        let suits = [suit1, suit2]
//        let expected = DepictionError.invalidSuit
//
//        // When
//        XCTAssertThrowsError(PlayingCards.getStandardCards(with: suits)) {
//            error in
//
//            // Then
//            XCTAssertEqual(expected, error as? DepictionError)
//        }
//    }
    
    // One Suit //
    // ~~~~~~~~ //
    
    /// Tests that retrieving all standard `PlayingCard`s with one `Suit` returns 13
    /// `PlayingCard`s.
    func test_getStandardCards_withOneSuit_returns13PlayingCards() {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 13
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suits)
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with one `Suit` returns `PlayingCard`s
    /// that only contain the given  `Suit`.
    func test_getStandardCards_withOneSuit_returnsCardsWithOnlyGivenSuit()
        {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = suits
        
        // When
        let standardCards = PlayingCards.getStandardCards(with: suits)

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }
    
    // Default Suits //
    // ~~~~~~~~~~~~~ //
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns 52
    /// `PlayingCard`s.
    func test_getStandardCards_withDefaultSuits_returns52PlayingCards() {

        // Given
        let expected = 52
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Aces //
            
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ace` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneAceOfHearts()
        throws {

        // Given
        let aceOfHearts = try Ace(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: aceOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ace` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneAceOfSpades()
        throws {

        // Given
        let aceOfSpades = try Ace(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: aceOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ace` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneAceOfDiamonds()
        throws {

        // Given
        let aceOfDiamonds = try Ace(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: aceOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ace` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneAceOfClubs()
        throws {

        // Given
        let aceOfClubs = try Ace(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: aceOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
        
    // Twos //
        
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Two` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneTwoOfHearts()
        throws {

        // Given
        let twoOfHearts = try Two(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: twoOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Two` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneTwoOfSpades()
        throws {

        // Given
        let twoOfSpades = try Two(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: twoOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Two` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneTwoOfDiamonds()
        throws {

        // Given
        let twoOfDiamonds = try Two(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: twoOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Two` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneTwoOfClubs()
        throws {

        // Given
        let twoOfClubs = try Two(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: twoOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
        
    // Threes //
        
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Three` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneThreeOfHearts()
        throws {

        // Given
        let threeOfHearts = try Three(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: threeOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Three` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneThreeOfSpades()
        throws {

        // Given
        let threeOfSpades = try Three(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: threeOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Three` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneThreeOfDiamonds()
        throws {

        // Given
        let threeOfDiamonds = try Three(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: threeOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Three` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneThreeOfClubs()
        throws {

        // Given
        let threeOfClubs = try Three(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: threeOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
        
    // Fours //
        
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Four` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneFourOfHearts()
        throws {

        // Given
        let fourOfHearts = try Four(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: fourOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Four` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneFourOfSpades()
        throws {

        // Given
        let fourOfSpades = try Four(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: fourOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Four` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneFourOfDiamonds()
        throws {

        // Given
        let fourOfDiamonds = try Four(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: fourOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Four` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneFourOfClubs()
        throws {

        // Given
        let fourOfClubs = try Four(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: fourOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Fives //
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Five` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneFiveOfHearts()
        throws {

        // Given
        let fiveOfHearts = try Five(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: fiveOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Five` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneFiveOfSpades()
        throws {

        // Given
        let fiveOfSpades = try Five(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: fiveOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
        
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Five` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneFiveOfDiamonds()
        throws {

        // Given
        let fiveOfDiamonds = try Five(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: fiveOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Five` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneFiveOfClubs()
        throws {

        // Given
        let fiveOfClubs = try Five(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: fiveOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Sixes //
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Six` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneSixOfHearts()
        throws {

        // Given
        let sixOfHearts = try Six(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: sixOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Six` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneSixOfSpades()
        throws {

        // Given
        let sixOfSpades = try Six(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: sixOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Six` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneSixOfDiamonds()
        throws {

        // Given
        let sixOfDiamonds = try Six(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: sixOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Six` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneSixOfClubs()
        throws {

        // Given
        let sixOfClubs = try Six(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: sixOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Sevens //
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Seven` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneSevenOfHearts()
        throws {

        // Given
        let sevenOfHearts = try Seven(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: sevenOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Seven` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneSevenOfSpades()
        throws {

        // Given
        let sevenOfSpades = try Seven(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: sevenOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Seven` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneSevenOfDiamonds()
        throws {

        // Given
        let sevenOfDiamonds = try Seven(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: sevenOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Seven` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneSevenOfClubs()
        throws {

        // Given
        let sevenOfClubs = try Seven(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: sevenOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Eights //
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Eight` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneEightOfHearts()
        throws {

        // Given
        let eightOfHearts = try Eight(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: eightOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Eight` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneEightOfSpades()
        throws {

        // Given
        let eightOfSpades = try Eight(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: eightOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Eight` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneEightOfDiamonds()
        throws {

        // Given
        let eightOfDiamonds = try Eight(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: eightOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Eight` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneEightOfClubs()
        throws {

        // Given
        let eightOfClubs = try Eight(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: eightOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Nines //
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Nine` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneNineOfHearts()
        throws {

        // Given
        let nineOfHearts = try Nine(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: nineOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Nine` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneNineOfSpades()
        throws {

        // Given
        let nineOfSpades = try Nine(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: nineOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Nine` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneNineOfDiamonds()
        throws {

        // Given
        let nineOfDiamonds = try Nine(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: nineOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Nine` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneNineOfClubs()
        throws {

        // Given
        let nineOfClubs = try Nine(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: nineOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Tens //
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ten` of `heart`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneTenOfHearts()
        throws {

        // Given
        let tenOfHearts = try Ten(of: .hearts)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: tenOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ten` of `spade`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneTenOfSpades()
        throws {

        // Given
        let tenOfSpades = try Ten(of: .spades)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: tenOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ten` of `diamond`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneTenOfDiamonds()
        throws {

        // Given
        let tenOfDiamonds = try Ten(of: .diamonds)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: tenOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ten` of `club`s.
    func test_getStandardCards_withDefaultSuits_returnsOnlyOneTenOfClubs()
        throws {

        // Given
        let tenOfClubs = try Ten(of: .clubs)
        let expected = 1
        
        // When
        let standardCards = PlayingCards.getStandardCards()
        let actual = standardCards.getCount(of: tenOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Jacks //
     
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one`Jack` of `heart`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneJackOfHearts()
        throws {

         // Given
        let jackOfHearts = try Jack(of: .hearts)
        let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: jackOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Jack` of `spade`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneJackOfSpades()
        throws {

         // Given
         let jackOfSpades = try Jack(of: .spades)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: jackOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Jack` of `diamond`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneJackOfDiamonds()
        throws {
        
        // Given
        let jackOfDiamonds = try Jack(of: .diamonds)
        let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: jackOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Jack` of `club`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneJackOfClubs()
        throws {

         // Given
         let jackOfClubs = try Jack(of: .clubs)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: jackOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Queens //
     
     /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Queen` of `heart`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneQueenOfHearts()
        throws {

         // Given
         let queenOfHearts = try Queen(of: .hearts)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: queenOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Queen` of `spade`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneQueenOfSpades()
        throws {

         // Given
         let queenOfSpades = try Queen(of: .spades)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: queenOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Queen` of `diamond`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneQueenOfDiamonds()
        throws {

         // Given
         let queenOfDiamonds = try Queen(of: .diamonds)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: queenOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Queen` of `club`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneQueenOfClubs()
        throws {

         // Given
         let queenOfClubs = try Queen(of: .clubs)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: queenOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Kings //
     
     /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `King` of `heart`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneKingOfHearts()
        throws {

         // Given
         let kingOfHearts = try King(of: .hearts)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: kingOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `King` of `spade`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneKingOfSpades()
        throws {

         // Given
        let kingOfSpades = try King(of: .spades)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: kingOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `King` of `diamond`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneKingOfDiamonds()
        throws {

         // Given
         let kingOfDiamonds = try King(of: .diamonds)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: kingOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `King` of `club`s.
     func test_getStandardCards_withDefaultSuits_returnsOnlyOneKingOfClubs()
        throws {

         // Given
         let kingOfClubs = try King(of: .clubs)
         let expected = 1
         
         // When
         let standardCards = PlayingCards.getStandardCards()
         let actual = standardCards.getCount(of: kingOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
    
    /// Tests that retrieving all Standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contains the standard  `Suit`s.
    func test_getStandardCards_withDefaultSuits_returnsCardsWithOnlyStandardSuits()
        throws {

        // Given
        let expected = PlayingCards.suits
        
        // When
        let standardCards = PlayingCards.getStandardCards()

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }

    //-------------------------------------------------------------------------//
    //                               getJokers()                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving all `Joker`s returns two `Joker`s.
    func test_getJokers_returnsTwoJokers() {

        // Given
        let expected = 2
        
        // When
        let jokers = PlayingCards.getJokers()
        let actual = jokers.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`Joker`s returns with only one red `Joker`..
    func test_getJokers_returnsCardsWithOnlyOneRedJoker_true() {

        // Given
        let redJoker = Joker(color: .red)
        let expected = 1
        
        // When
        let cards = PlayingCards.getJokers()
        let actual = cards.getCount(of: redJoker)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`Joker`s returns with only one black `Joker`..
    func test_getJokers_returnsCardsWithOnlyOneBlackJoker_true() {

        // Given
        let blackJoker = Joker(color: .black)
        let expected = 1
        
        // When
        let cards = PlayingCards.getJokers()
        let actual = cards.getCount(of: blackJoker)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                              getAllCards()                              //
    //-------------------------------------------------------------------------//
    
    //               //
    // With One Suit //
    //               //
    
//    /// Tests that retrieving all`PlayingCard`s, `Joker`s included, with an invalid `Suit` an
//    /// `invalidSuit Error`.
//    func test_getAllCards_withInvalidSuit_throwsInvalidSuitError() {
//
//        // Given
//        let suit = Suit.stars
//        let expected = DepictionError.invalidSuit
//
//        // When
//        XCTAssertThrowsError(PlayingCards.getAllCards(with: suit)) {
//            error in
//
//            // Then
//            XCTAssertEqual(expected, error as? DepictionError)
//        }
//    }
    
    /// Tests that retrieving all `PlayingCard`s with a `Suit`, `Joker`s included,  returns 15
    /// `PlayingCard`s.
    func test_getAllCards_withSuit_returns15PlayingCards() {

        // Given
        let suit = Suit.hearts
        let expected = 15
        
        // When
        let standardCards = PlayingCards.getAllCards(with: suit)
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with an `ace rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneAceRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.ace
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `two rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneTwoRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.two
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `three rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneThreeRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.three
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `four rank`.
    func test_geAllCards_withSuit_returnsCardsWithOnlyOneFourRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.four
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `five rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneFiveRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.five
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `six rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneSixRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.six
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `seven rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneSevenRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.seven
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with an `eight rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneEightRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.eight
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `nine rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneNineRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.nine
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `ten rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneTenRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.ten
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `jack rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneJackRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.jack
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `queen rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneQueenRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.queen
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contain one `PlayingCard` with a `king rank`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneKingRank() {

        // Given
        let suit = Suit.hearts
        let rank = Rank.king
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: rank)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included, with a `Suit` returns
    /// `PlayingCard`s that only contains one red `Joker`s.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneRedJoker() {

        // Given
        let suit = Suit.hearts
        let redJoker = Joker(color: .red)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: redJoker)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included, with a `Suit` returns
    /// `PlayingCard`s that only contains one black `Joker`s.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneBlackJoker() {

        // Given
        let suit = Suit.hearts
        let blackJoker = Joker(color: .black)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: blackJoker)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s with a `Suit` returns `PlayingCard`s that only
    /// contains the given and `null Suit`s.
    func test_getAllCards_withSuit_returnsCardsWithOnlyGivenAndNullSuit()
        {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.null
        let expected = [suit1, suit2]
        
        // When
        let cards = PlayingCards.getAllCards(with: suit1)

        // Then
        XCTAssert(cards.contain(only: expected))
    }
    
    //                     //
    // With Multiple Suits //
    //                     //
//
//    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with `Suit`s that contain an
//    /// invalid `Suit` an `invalidSuit Error`.
//    func test_getAllCards_withInvalidSuits_throwsInvalidSuitError() {
//
//        // Given
//        let suit1 = Suit.hearts
//        let suit2 = Suit.stars
//        let suits = [suit1, suit2]
//        let expected = DepictionError.invalidSuit
//
//        // When
//        XCTAssertThrowsError(PlayingCards.getAllCards(with: suits)) {
//            error in
//
//            // Then
//            XCTAssertEqual(expected, error as? DepictionError)
//        }
//    }
    
    // One Suit //
    // ~~~~~~~~ //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with one `Suit` returns 15
    /// `PlayingCard`s.
    func test_getAllCards_withOneSuit_returns15PlayingCards() {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 15
        
        // When
        let cards = PlayingCards.getAllCards(with: suits)
        let actual = cards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with one `Suit`s returns
    /// `PlayingCard`s that only contain the given and `null Suit`s.
    func test_getAllCards_withOneSuit_returnsCardsWithOnlyGivenAndNullSuits()
        {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.null
        let suits = [suit1]
        let expected = [suit1, suit2]
        
        // When
        let cards = PlayingCards.getAllCards(with: suits)

        // Then
        XCTAssert(cards.contain(only: expected))
    }
    
    
    // Default Suits //
    // ~~~~~~~~~~~~~ //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns 54
    /// `PlayingCard`s.
    func test_getAllCards_withDefaultSuits_returns54PlayingCards() {

        // Given
        let expected = 54
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Aces //
        
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ace` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneAceOfHearts() throws {

        // Given
        let aceOfHearts = try Ace(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: aceOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ace` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneAceOfSpades() throws {

        // Given
        let aceOfSpades = try Ace(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: aceOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ace` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneAceOfDiamonds() throws {

        // Given
        let aceOfDiamonds = try Ace(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: aceOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ace` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneAceOfClubs() throws {

        // Given
        let aceOfClubs = try Ace(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: aceOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Twos //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Two` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneTwoOfHearts() throws {

        // Given
        let twoOfHearts = try Two(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: twoOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Two` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneTwoOfSpades() throws {

        // Given
        let twoOfSpades = try Two(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: twoOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Two` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneTwoOfDiamonds() throws {

        // Given
        let twoOfDiamonds = try Two(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: twoOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Two` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneTwoOfClubs() throws {

        // Given
        let twoOfClubs = try Two(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: twoOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Threes //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Three` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneThreeOfHearts() throws {

        // Given
        let threeOfHearts = try Three(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: threeOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Three` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneThreeOfSpades() throws {

        // Given
        let threeOfSpades = try Three(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: threeOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Three` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneThreeOfDiamonds()
        throws {

        // Given
        let threeOfDiamonds = try Three(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: threeOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Three` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneThreeOfClubs() throws {

        // Given
        let threeOfClubs = try Three(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: threeOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Fours //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Four` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneFourOfHearts() throws {

        // Given
        let fourOfHearts = try Four(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: fourOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Four` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneFourOfSpades() throws {

        // Given
        let fourOfSpades = try Four(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: fourOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Four` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneFourOfDiamonds()
        throws {

        // Given
        let fourOfDiamonds = try Four(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: fourOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Four` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneFourOfClubs() throws {

        // Given
        let fourOfClubs = try Four(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: fourOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Fives //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Five` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneFiveOfHearts() throws {

        // Given
        let fiveOfHearts = try Five(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: fiveOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Five` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneFiveOfSpades() throws {

        // Given
        let fiveOfSpades = try Five(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: fiveOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Five` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneFiveOfDiamonds()
        throws {

        // Given
        let fiveOfDiamonds = try Five(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: fiveOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Five` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneFiveOfClubs() throws {

        // Given
        let fiveOfClubs = try Five(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: fiveOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Sixes //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Six` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneSixOfHearts() throws {

        // Given
        let sixOfHearts = try Six(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: sixOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Six` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneSixOfSpades() throws {

        // Given
        let sixOfSpades = try Six(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: sixOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Six` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneSixOfDiamonds() throws {

        // Given
        let sixOfDiamonds = try Six(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: sixOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Six` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneSixOfClubs() throws {

        // Given
        let sixOfClubs = try Six(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: sixOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Sevens //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Seven` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneSevenOfHearts() throws {

        // Given
        let sevenOfHearts = try Seven(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: sevenOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Seven` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneSevenOfSpades() throws {

        // Given
        let sevenOfSpades = try Seven(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: sevenOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Seven` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneSevenOfDiamonds()
        throws {

        // Given
        let sevenOfDiamonds = try Seven(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: sevenOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Seven` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneSevenOfClubs() throws {

        // Given
        let sevenOfClubs = try Seven(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: sevenOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Eights //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Eight` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneEightOfHearts() throws {

        // Given
        let eightOfHearts = try Eight(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: eightOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Eight` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneEightOfSpades() throws {

        // Given
        let eightOfSpades = try Eight(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: eightOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Eight` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneEightOfDiamonds()
        throws {

        // Given
        let eightOfDiamonds = try Eight(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: eightOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Eight` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneEightOfClubs() throws {

        // Given
        let eightOfClubs = try Eight(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: eightOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Nines //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Nine` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneNineOfHearts() throws {

        // Given
        let nineOfHearts = try Nine(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: nineOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Nine` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneNineOfSpades() throws {

        // Given
        let nineOfSpades = try Nine(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: nineOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Nine` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneNineOfDiamonds()
        throws {

        // Given
        let nineOfDiamonds = try Nine(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: nineOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Nine` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneNineOfClubs() throws {

        // Given
        let nineOfClubs = try Nine(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: nineOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Tens //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ten` of `heart`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneTenOfHearts() throws {

        // Given
        let tenOfHearts = try Ten(of: .hearts)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: tenOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ten` of `spade`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneTenOfSpades() throws {

        // Given
        let tenOfSpades = try Ten(of: .spades)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: tenOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ten` of `diamond`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneTenOfDiamonds() throws {

        // Given
        let tenOfDiamonds = try Ten(of: .diamonds)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: tenOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Ten` of `club`s.
    func test_getAllCards_withDefaultSuits_returnsOnlyOneTenOfClubs() throws {

        // Given
        let tenOfClubs = try Ten(of: .clubs)
        let expected = 1
        
        // When
        let cards = PlayingCards.getAllCards()
        let actual = cards.getCount(of: tenOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Jacks //
     
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one`Jack` of `heart`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneJackOfHearts() throws {

         // Given
        let jackOfHearts = try Jack(of: .hearts)
        let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: jackOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Jack` of `spade`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneJackOfSpades() throws {

         // Given
         let jackOfSpades = try Jack(of: .spades)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: jackOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
    /// `PlayingCard`s that only contain one `Jack` of `diamond`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneJackOfDiamonds()
        throws {
        
        // Given
        let jackOfDiamonds = try Jack(of: .diamonds)
        let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: jackOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Jack` of `club`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneJackOfClubs() throws {

         // Given
         let jackOfClubs = try Jack(of: .clubs)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: jackOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Queens //
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Queen` of `heart`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneQueenOfHearts()
        throws {

         // Given
         let queenOfHearts = try Queen(of: .hearts)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: queenOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Queen` of `spade`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneQueenOfSpades()
        throws {

         // Given
         let queenOfSpades = try Queen(of: .spades)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: queenOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Queen` of `diamond`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneQueenOfDiamonds()
        throws {

         // Given
         let queenOfDiamonds = try Queen(of: .diamonds)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: queenOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `Queen` of `club`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneQueenOfClubs() throws {

         // Given
         let queenOfClubs = try Queen(of: .clubs)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: queenOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Kings //
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `King` of `heart`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneKingOfHearts() throws {

         // Given
         let kingOfHearts = try King(of: .hearts)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: kingOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `King` of `spade`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneKingOfSpades() throws {

         // Given
        let kingOfSpades = try King(of: .spades)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: kingOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `King` of `diamond`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneKingOfDiamonds()
        throws {

         // Given
         let kingOfDiamonds = try King(of: .diamonds)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: kingOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns
     /// `PlayingCard`s that only contain one `King` of `club`s.
     func test_getAllCards_withDefaultSuits_returnsOnlyOneKingOfClubs() throws {

         // Given
         let kingOfClubs = try King(of: .clubs)
         let expected = 1
         
         // When
         let cards = PlayingCards.getAllCards()
         let actual = cards.getCount(of: kingOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
    
    /// Tests that retrieving all `PlayingCard`s with the default `Suit`s returns `PlayingCard`s that
    /// only contain the standard and `null Suit`s.
    func test_getAllCards_withDefaultSuits_returnsCardsWithOnlyStandardAndNullSuits()
    throws {

        // Given
        let expected = PlayingCards.allSuits
        
        // When
        let standardCards = PlayingCards.getAllCards()

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }
}
