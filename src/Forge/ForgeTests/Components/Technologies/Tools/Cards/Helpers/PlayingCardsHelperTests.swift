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
    
    //=========================================================================//
    //                                  GETTERS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                             getNumeralCards()                           //
    //-------------------------------------------------------------------------//
    
    //               //
    // With One Suit //
    //               //
    
    /// Tests that retrieving all`NumeralCard`s with an invalid `Suit` throws an `invalidSuit`
    /// `Error`.
    func test_getNumeralCards_withInvalidSuit_throwsInvalidSuitError() throws {

        // Given
        let suit = Suit.stars
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getNumeralCards(with: suit)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns ten `NumeralCard`s.
    func test_getNumeralCards_withSuit_returnsTenNumeralCards() throws {

        // Given
        let suit = Suit.hearts
        let expected = 10
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Ace`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneAce() throws {

        // Given
        let suit = Suit.hearts
        let ace = try Ace(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: ace)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Two`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTwo() throws {

        // Given
        let suit = Suit.hearts
        let two = try Two(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: two)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Three`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneThree() throws {

        // Given
        let suit = Suit.hearts
        let three = try Three(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: three)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Four`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFour() throws {

        // Given
        let suit = Suit.hearts
        let four = try Four(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: four)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Five`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFive() throws {

        // Given
        let suit = Suit.hearts
        let five = try Five(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: five)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Six`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSix() throws {

        // Given
        let suit = Suit.hearts
        let six = try Six(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: six)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Seven`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSeven() throws {

        // Given
        let suit = Suit.hearts
        let seven = try Seven(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: seven)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Eight`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneEight() throws {

        // Given
        let suit = Suit.hearts
        let eight = try Eight(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: eight)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Nine`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneNine() throws {

        // Given
        let suit = Suit.hearts
        let nine = try Nine(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: nine)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain one `Ten`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTen() throws {

        // Given
        let suit = Suit.hearts
        let ten = try Ten(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: ten)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that are
    /// equally `Suit`ed.
    func test_getNumeralCards_withSuit_returnsEquallySuitedNumeralCards()
        throws {

        // Given
        let suit = Suit.hearts
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        
        // Then
        XCTAssert(numeralCards.areEquallySuited())
    }
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that only
    /// contain the given  `Suit`.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyGivenSuit() throws {

        // Given
        let suit = Suit.hearts
        let expected = suit
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)

        // Then
        XCTAssert(numeralCards.contain(only: expected))
    }
    
    //                     //
    // With Multiple Suits //
    //                     //
    
    /// Tests that retrieving all`NumeralCard`s with `Suit`s that contain an invalid `Suit` throws an
    /// `invalidSuit Error`.
    func test_getNumeralCards_withInvalidSuits_throwsInvalidSuitError() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.stars
        let suits = [suit1, suit2]
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getNumeralCards(with: suits)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    // Default Suits //
    // ~~~~~~~~~~~~~ //
    
    
    /// Tests that retrieving all`NumeralCard`s with the default `Suit`s returns 40 `NumeralCard`s.
    func test_getNumeralCards_withDefaultSuits_returns40NumeralCards() throws {

        // Given
        let expected = 40
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards()
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Aces //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ace` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneAceOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let aceOfHearts = try Ace(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: aceOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ace` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneAceOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let aceOfSpades = try Ace(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: aceOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ace` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneAceOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let aceOfDiamonds = try Ace(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: aceOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ace` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneAceOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let aceOfClubs = try Ace(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: aceOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Twos //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Two` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTwoOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let twoOfHearts = try Two(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: twoOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Two` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTwoOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let twoOfSpades = try Two(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: twoOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Two` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTwoOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let twoOfDiamonds = try Two(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: twoOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Two` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTwoOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let twoOfClubs = try Two(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: twoOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Threes //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Three` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneThreeOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let threeOfHearts = try Three(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: threeOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Three` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneThreeOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let threeOfSpades = try Three(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: threeOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Three` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneThreeOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let threeOfDiamonds = try Three(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: threeOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Three` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneThreeOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let threeOfClubs = try Three(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: threeOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Fours //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Four` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFourOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let fourOfHearts = try Four(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: fourOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Four` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFourOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let fourOfSpades = try Four(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: fourOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Four` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFourOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let fourOfDiamonds = try Four(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: fourOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Four` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFourOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let fourOfClubs = try Four(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: fourOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Fives //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Five` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFiveOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let fiveOfHearts = try Five(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: fiveOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Five` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFiveOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let fiveOfSpades = try Five(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: fiveOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Five` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFiveOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let fiveOfDiamonds = try Five(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: fiveOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Five` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneFiveOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let fiveOfClubs = try Five(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: fiveOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Sixes //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Six` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSixOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let sixOfHearts = try Six(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: sixOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Six` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSixOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let sixOfSpades = try Six(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: sixOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Six` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSixOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let sixOfDiamonds = try Six(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: sixOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Six` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSixOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let sixOfClubs = try Six(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: sixOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Sevens //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Seven` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSevenOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let sevenOfHearts = try Seven(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: sevenOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Seven` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSevenOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let sevenOfSpades = try Seven(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: sevenOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Seven` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSevenOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let sevenOfDiamonds = try Seven(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: sevenOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Seven` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneSevenOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let sevenOfClubs = try Seven(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: sevenOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Eights //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Eight` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneEightOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let eightOfHearts = try Eight(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: eightOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Eight` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneEightOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let eightOfSpades = try Eight(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: eightOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Eight` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneEightOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let eightOfDiamonds = try Eight(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: eightOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Eight` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneEightOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let eightOfClubs = try Eight(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: eightOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Nines //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Nine` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneNineOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let nineOfHearts = try Nine(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: nineOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Nine` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneNineOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let nineOfSpades = try Nine(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: nineOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Nine` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneNineOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let nineOfDiamonds = try Nine(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: nineOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Nine` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneNineOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let nineOfClubs = try Nine(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: nineOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Tens //
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ten` of `heart`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTenOfHearts()
        throws {

        // Given
        let suit = Suit.hearts
        let tenOfHearts = try Ten(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: tenOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ten` of `spade`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTenOfSpades()
        throws {

        // Given
        let suit = Suit.spades
        let tenOfSpades = try Ten(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: tenOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ten` of `diamond`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTenOfDiamonds()
        throws {

        // Given
        let suit = Suit.diamonds
        let tenOfDiamonds = try Ten(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: tenOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contain one `Ten` of `club`s.
    func test_getNumeralCards_withSuit_returnsCardsWithOnlyOneTenOfClubs()
        throws {

        // Given
        let suit = Suit.clubs
        let tenOfClubs = try Ten(of: suit)
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.getCount(of: tenOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// contain only four  `Suit`s.
    func test_getNumeralCards_withDefaultSuits_returnsCardsWithOnlyFourSuits()
        throws {

        // Given
        let expected = 4
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards()
        let actual = numeralCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// only contains the standard  `Suit`s.
    func test_getNumeralCards_withDefaultSuit_returnsCardsWithOnlyStandardSuits()
        throws {

        // Given
        let expected = PlayingCards.suits
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards()

        // Then
        XCTAssert(numeralCards.contain(only: expected))
    }
    
    /// Tests that retrieving all`NumeralCard`s with one `Suit` returns ten `NumeralCard`s.
    func test_getNumeralCards_withOneSuit_returnsTenNumeralCards() throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 10
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with one `Suit`s returns `NumeralCard`s that
    /// contain only one `Suit`.
    func test_getNumeralCards_withOneSuit_returnsCardsWithOnlyOneSuit() throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 1
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)
        let actual = numeralCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with one `Suit`s returns `NumeralCard`s that
    /// only contain the given  `Suit`.
    func test_getNumeralCards_withOneSuit_returnsCardsWithOnlyGivenSuit()
        throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = suits
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)

        // Then
        XCTAssert(numeralCards.contain(only: expected))
    }
    
    /// Tests that retrieving all`NumeralCard`s with two `Suit`s returns 20 `NumeralCard`s.
    func test_getNumeralCards_withTwoSuits_returns20NumeralCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = 20
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with two `Suit`s returns `NumeralCard`s that
    /// contain only two  `Suit`s.
    func test_getNumeralCards_withTwoSuits_returnsCardsWithOnlyTwoSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = 2
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)
        let actual = numeralCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with two `Suit`s returns `NumeralCard`s that only
    /// contain the given  `Suit`s.
    func test_getNumeralCards_withTwoSuits_returnsCardsWithOnlyGivenSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = suits
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)

        // Then
        XCTAssert(numeralCards.contain(only: expected))
    }
    
    /// Tests that retrieving all`NumeralCard`s with three `Suit`s returns 30 `NumeralCard`s.
    func test_getNumeralCards_withThreeSuits_returns30NumeralCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = 30
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with three `Suit`s returns `NumeralCard`s that
    /// contain only three  `Suit`s.
    func test_getNumeralCards_withThreeSuits_returnsCardsWithOnlyThreeSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = 3
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)
        let actual = numeralCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with three `Suit`s returns `NumeralCard`s that only
    /// contain the given  `Suit`s.
    func test_getNumeralCards_withThreeSuits_returnsCardsWithOnlyGivenSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = suits
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)

        // Then
        XCTAssert(numeralCards.contain(only: expected))
    }
    
    /// Tests that retrieving all`NumeralCard`s with four `Suit`s returns 40 `NumeralCard`s.
    func test_getNumeralCards_withFourSuits_returns40NumeralCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = 40
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with four `Suit`s returns `NumeralCard`s that
    /// contain only four  `Suit`s.
    func test_getNumeralCards_withFourSuits_returnsCardsWithOnlyFourSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = 4
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)
        let actual = numeralCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `NumeralCard`s with four `Suit`s returns `NumeralCard`s that only
    /// contain the given  `Suit`s.
    func test_getNumeralCards_withFourSuits_returnsCardsWithOnlyGivenSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = suits
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suits)

        // Then
        XCTAssert(numeralCards.contain(only: expected))
    }
    
    //-------------------------------------------------------------------------//
    //                              getFaceCards()                             //
    //-------------------------------------------------------------------------//
    
    //               //
    // With One Suit //
    //               //
    
    /// Tests that retrieving all`FaceCard`s with an invalid `Suit` throws an `invalidSuit Error`.
    func test_getFaceCards_withInvalidSuit_throwsInvalidSuitError() throws {

        // Given
        let suit = Suit.stars
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getFaceCards(with: suit)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns three `FaceCard`s.
    func test_getFaceCards_withSuit_returnsThreeFaceCards() throws {

        // Given
        let suit = Suit.hearts
        let expected = 3
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Jack`.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneJack() throws {

        // Given
        let suit = Suit.hearts
        let jack = try Jack(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: jack)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Queen`.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneQueen() throws {

        // Given
        let suit = Suit.hearts
        let queen = try Queen(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: queen)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `King`.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneKing() throws {

        // Given
        let suit = Suit.hearts
        let king = try King(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: king)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that are equally
    /// `Suit`ed.
    func test_getFaceCards_withSuit_returnsEquallySuitedFaceCards() throws {

        // Given
        let suit = Suit.hearts
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        
        // Then
        XCTAssert(faceCards.areEquallySuited())
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain the
    /// given  `Suit`.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyGivenSuit() throws {

        // Given
        let suit = Suit.hearts
        let expected = suit
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)

        // Then
        XCTAssert(faceCards.contain(only: expected))
    }
    
    //                     //
    // With Multiple Suits //
    //                     //
    
    /// Tests that retrieving all`FaceCard`s with `Suit`s that contain an invalid `Suit` throws an
    /// `invalidSuit Error`.
    func test_getFaceCards_withInvalidSuits_throwsInvalidSuitError() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.stars
        let suits = [suit1, suit2]
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getFaceCards(with: suits)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that retrieving all`FaceCard`s with the default `Suit`s returns 12 `FaceCard`s.
    func test_getFaceCards_withDefaultSuits_returns12FaceCards() throws {

        // Given
        let expected = 12
        
        // When
        let faceCards = try PlayingCards.getFaceCards()
        let actual = faceCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Jacks //
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Jack` of `heart`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneJackOfHearts() throws {

        // Given
        let suit = Suit.hearts
        let jackOfHearts = try Jack(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: jackOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Jack` of `spade`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneJackOfSpades() throws {

        // Given
        let suit = Suit.spades
        let jackOfSpades = try Jack(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: jackOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Jack` of `diamond`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneJackOfDiamonds() throws {

        // Given
        let suit = Suit.diamonds
        let jackOfDiamonds = try Jack(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: jackOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Jack` of `club`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneJackOfClubs() throws {

        // Given
        let suit = Suit.clubs
        let jackOfClubs = try Jack(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: jackOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Queens //
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Queen` of `heart`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneQueenOfHearts() throws {

        // Given
        let suit = Suit.hearts
        let queenOfHearts = try Queen(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: queenOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Queen` of `spade`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneQueenOfSpades() throws {

        // Given
        let suit = Suit.spades
        let queenOfSpades = try Queen(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: queenOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Queen` of `diamond`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneQueenOfDiamonds() throws {

        // Given
        let suit = Suit.diamonds
        let queenOfDiamonds = try Queen(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: queenOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `Queen` of `club`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneQueenOfClubs() throws {

        // Given
        let suit = Suit.clubs
        let queenOfClubs = try Queen(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: queenOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Kings //
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `King` of `heart`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneKingOfHearts() throws {

        // Given
        let suit = Suit.hearts
        let kingOfHearts = try King(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: kingOfHearts)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `King` of `spade`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneKingOfSpades() throws {

        // Given
        let suit = Suit.spades
        let kingOfSpades = try King(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: kingOfSpades)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `King` of `diamond`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneKingOfDiamonds() throws {

        // Given
        let suit = Suit.diamonds
        let kingOfDiamonds = try King(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: kingOfDiamonds)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with a `Suit` returns `FaceCard`s that only contain one
    /// `King` of `club`s.
    func test_getFaceCards_withSuit_returnsCardsWithOnlyOneKingOfClubs() throws {

        // Given
        let suit = Suit.clubs
        let kingOfClubs = try King(of: suit)
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suit)
        let actual = faceCards.getCount(of: kingOfClubs)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with the default `Suit`s returns `FaceCard`s that contain
    /// only four  `Suit`s.
    func test_getFaceCards_withDefaultSuits_returnsCardsWithOnlyFourSuits()
        throws {

        // Given
        let expected = 4
        
        // When
        let faceCards = try PlayingCards.getFaceCards()
        let actual = faceCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with the default `Suit`s returns `FaceCard`s that only
    /// contains the standard  `Suit`s.
    func test_getFaceCards_withDefaultSuit_returnsCardsWithOnlyStandardSuits()
        throws {

        // Given
        let expected = PlayingCards.suits
        
        // When
        let faceCards = try PlayingCards.getFaceCards()

        // Then
        XCTAssert(faceCards.contain(only: expected))
    }
    
    /// Tests that retrieving all`FaceCard`s with one `Suit` returns three `FaceCard`s.
    func test_getFaceCards_withOneSuit_returnsThreeFaceCards() throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 3
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)
        let actual = faceCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`FaceCard`s with one `Suit`s returns `FaceCard`s that contain only
    /// one `Suit`.
    func test_getFaceCards_witOneSuit_returnsCardsWithOnlyOneSuit() throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 1
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)
        let actual = faceCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with one `Suit` returns `FaceCard`s that only contain
    /// the given  `Suit`.
    func test_getFaceCards_withOneSuit_returnsCardsWithOnlyGivenSuit()
        throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = suits
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)

        // Then
        XCTAssert(faceCards.contain(only: expected))
    }
    
    /// Tests that retrieving all`FaceCard`s with two `Suit`s returns six `FaceCard`s.
    func test_getFaceCards_withTwoSuits_returnsSixFaceCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = 6
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)
        let actual = faceCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with two `Suit`s returns `FaceCard`s that contain only
    /// two `Suit`s.
    func test_getFaceCards_withTwoSuits_returnsCardsWithOnlyTwoSuits() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = 2
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)
        let actual = faceCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with two `Suit`s returns `FaceCard`s that only contain
    /// the given  `Suit`.
    func test_getFaceCards_withTwoSuits_returnsCardsWithOnlyGivenSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = suits
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)

        // Then
        XCTAssert(faceCards.contain(only: expected))
    }
    
    /// Tests that retrieving all`FaceCard`s with three `Suit`s returns nine `FaceCard`s.
    func test_getFaceCards_withThreeSuits_returnsNineFaceCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = 9
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)
        let actual = faceCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with three `Suit`s returns `FaceCard`s that contain only
    /// three `Suit`s.
    func test_getFaceCards_withThreeSuits_returnsCardsWithOnlyThreeSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = 3
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)
        let actual = faceCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with three `Suit`s returns `FaceCard`s that only contain
    /// the given  `Suit`s.
    func test_getFaceCards_withThreeSuits_returnsCardsWithOnlyGivenSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = suits
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)

        // Then
        XCTAssert(faceCards.contain(only: expected))
    }
    
    /// Tests that retrieving all`FaceCard`s with four `Suit`s returns 12 `FaceCard`s.
    func test_getFaceCards_withFourSuits_returns12FaceCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = 12
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)
        let actual = faceCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with four `Suit`s returns `FaceCard`s that contain only
    /// four `Suit`s.
    func test_getFaceCards_withFourSuits_returnsCardsWithOnlyFourSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = 4
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)
        let actual = faceCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `FaceCard`s with four `Suit`s returns `FaceCard`s that only contain
    /// the given  `Suit`s.
    func test_getFaceCards_withFourSuits_returnsCardsWithOnlyGivenSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = suits
        
        // When
        let faceCards = try PlayingCards.getFaceCards(with: suits)

        // Then
        XCTAssert(faceCards.contain(only: expected))
    }
    
    //-------------------------------------------------------------------------//
    //                           getStandardCards()                             //
    //-------------------------------------------------------------------------//
    
    //               //
    // With One Suit //
    //               //
    
    /// Tests that retrieving all standard `PlayingCard`s with an invalid `Suit` throws an
    /// `invalidSuit Error`.
    func test_getStandardCards_withInvalidSuit_throwsInvalidSuitError() throws {

        // Given
        let suit = Suit.stars
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getStandardCards(with: suit)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns 13 `PlayingCard`s.
    func test_getStandardCards_withSuit_returns13PlayingCards() throws {

        // Given
        let suit = Suit.hearts
        let expected = 13
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Ace`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneAce() throws {

        // Given
        let suit = Suit.hearts
        let ace = try Ace(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: ace)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Two`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneTwo() throws {

        // Given
        let suit = Suit.hearts
        let two = try Two(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: two)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Three`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneThree() throws {

        // Given
        let suit = Suit.hearts
        let three = try Three(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: three)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Four`.
    func test_geStandardCards_withSuit_returnsCardsWithOnlyOneFour() throws {

        // Given
        let suit = Suit.hearts
        let four = try Four(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: four)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Five`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneFive() throws {

        // Given
        let suit = Suit.hearts
        let five = try Five(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: five)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Six`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneSix() throws {

        // Given
        let suit = Suit.hearts
        let six = try Six(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: six)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Seven`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneSeven() throws {

        // Given
        let suit = Suit.hearts
        let seven = try Seven(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: seven)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Eight`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneEight() throws {

        // Given
        let suit = Suit.hearts
        let eight = try Eight(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: eight)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Nine`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneNine() throws {

        // Given
        let suit = Suit.hearts
        let nine = try Nine(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: nine)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Ten`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneTen() throws {

        // Given
        let suit = Suit.hearts
        let ten = try Ten(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: ten)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Jack`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneJack() throws {

        // Given
        let suit = Suit.hearts
        let jack = try Jack(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: jack)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `Queen`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneQueen() throws {

        // Given
        let suit = Suit.hearts
        let queen = try Queen(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: queen)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains one `King`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyOneKing() throws {

        // Given
        let suit = Suit.hearts
        let king = try King(of: suit)
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.getCount(of: king)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// contain zero `Joker`s.
    func test_getStandardCards_withSuit_returnsCardsWithZeroJokers() throws {

        // Given
        let suit = Suit.hearts
        let expected = 0
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        let actual = standardCards.filter{$0 is Joker}.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// are equally `Suit`ed.
    func test_getStandardCards_withSuit_returnsEquallySuitedPlayingCards()
        throws {

        // Given
        let suit = Suit.hearts
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)
        
        // Then
        XCTAssert(standardCards.areEquallySuited())
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns `PlayingCard`s that
    /// only contains the given  `Suit`.
    func test_getStandardCards_withSuit_returnsCardsWithOnlyGivenSuit() throws {

        // Given
        let suit = Suit.hearts
        let expected = suit
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suit)

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }
    
    //                     //
    // With Multiple Suits //
    //                     //
    
    /// Tests that retrieving all standard`PlayingCard`s with `Suit`s that contain an invalid `Suit`
    /// throws an `invalidSuit Error`.
    func test_getStandardCards_withInvalidSuits_throwsInvalidSuitError() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.stars
        let suits = [suit1, suit2]
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getStandardCards(with: suits)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns 52
    /// `PlayingCard`s.
    func test_getStandardCards_withDefaultSuits_returns52PlayingCards() throws {

        // Given
        let expected = 52
        
        // When
        let standardCards = try PlayingCards.getStandardCards()
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Jacks //
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one`Jack` of `heart`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneJackOfHearts() throws {

         // Given
         let suit = Suit.hearts
         let jackOfHearts = try Jack(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: jackOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one`Jack` of `spade`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneJackOfSpades() throws {

         // Given
         let suit = Suit.spades
         let jackOfSpades = try Jack(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: jackOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `Jack` of `diamond`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneJackOfDiamonds() throws {

         // Given
         let suit = Suit.diamonds
         let jackOfDiamonds = try Jack(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: jackOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `Jack` of `club`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneJackOfClubs() throws {

         // Given
         let suit = Suit.clubs
         let jackOfClubs = try Jack(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: jackOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Queens //
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `Queen` of `heart`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneQueenOfHearts() throws {

         // Given
         let suit = Suit.hearts
         let queenOfHearts = try Queen(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: queenOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `Queen` of `spade`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneQueenOfSpades() throws {

         // Given
         let suit = Suit.spades
         let queenOfSpades = try Queen(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: queenOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `Queen` of `diamond`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneQueenOfDiamonds() throws {

         // Given
         let suit = Suit.diamonds
         let queenOfDiamonds = try Queen(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: queenOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `Queen` of `club`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneQueenOfClubs() throws {

         // Given
         let suit = Suit.clubs
         let queenOfClubs = try Queen(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: queenOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Kings //
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `King` of `heart`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneKingOfHearts() throws {

         // Given
         let suit = Suit.hearts
         let kingOfHearts = try King(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: kingOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `King` of `spade`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneKingOfSpades() throws {

         // Given
         let suit = Suit.spades
         let kingOfSpades = try King(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: kingOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `King` of `diamond`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneKingOfDiamonds() throws {

         // Given
         let suit = Suit.diamonds
         let kingOfDiamonds = try King(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: kingOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all standard `PlayingCard`s with a `Suit` returns  standard `PlayingCard`s that only contain one `King` of `club`s.
     func test_getPlayingCards_withSuit_returnsCardsWithOnlyOneKingOfClubs() throws {

         // Given
         let suit = Suit.clubs
         let kingOfClubs = try King(of: suit)
         let expected = 1
         
         // When
         let standardCards = try PlayingCards.getStandardCards(with: suit)
         let actual = standardCards.getCount(of: kingOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
    
    /// Tests that retrieving all standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that contain only four  `Suit`s.
    func test_getStandardCards_withDefaultSuits_returnsCardsWithOnlyFourSuits()
        throws {

        // Given
        let expected = 4
        
        // When
        let standardCards = try PlayingCards.getStandardCards()
        let actual = standardCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all Standard `PlayingCard`s with the default `Suit`s returns
    /// `PlayingCard`s that only contains the standard  `Suit`s.
    func test_getStandardCards_withDefaultSuit_returnsCardsWithOnlyStandardSuits()
        throws {

        // Given
        let expected = PlayingCards.suits
        
        // When
        let standardCards = try PlayingCards.getStandardCards()

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with one `Suit` returns 13
    /// `PlayingCard`s.
    func test_getStandardCards_withOneSuit_returns13PlayingCards() throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 13
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with one `Suit`s returns `PlayingCard`s
    /// that contain only one `Suit`.
    func test_getStandardCards_witOneSuit_returnsCardsWithOnlyOneSuit() throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 1
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)
        let actual = standardCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with one `Suit` returns `PlayingCard`s
    /// that only contain the given  `Suit`.
    func test_getStandardCards_withOneSuit_returnsCardsWithOnlyGivenSuit()
        throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = suits
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with two `Suit`s returns 26
    /// `PlayingCard`s.
    func test_getStandardCards_withTwoSuits_returns26PlayingCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = 26
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with two `Suit`s returns `PlayingCard`s
    /// that contain only two `Suit`s.
    func test_getStandardCards_witTwoSuits_returnsCardsWithOnlyTwoSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = 2
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)
        let actual = standardCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with two `Suit`s returns `PlayingCard`s
    /// that only contain the given  `Suit`s.
    func test_getStandardCards_withTwoSuits_returnsCardsWithOnlyGivenSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = suits
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with three `Suit`s returns 39
    /// `PlayingCard`s.
    func test_getStandardCards_withThreeSuits_returns39PlayingCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = 39
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with three `Suit`s returns `PlayingCard`s
    /// that contain only three `Suit`s.
    func test_getStandardCards_withThreeSuits_returnsCardsWithOnlyThreeSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = 3
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)
        let actual = standardCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with three `Suit`s returns `PlayingCard`s
    /// that only contain the given  `Suit`s.
    func test_getStandardCards_withThreeSuits_returnsCardsWithOnlyGivenSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = suits
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with four `Suit`s returns 52
    /// `PlayingCard`s.
    func test_getStandardCards_withFourSuits_returns52PlayingCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = 52
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with four `Suit`s returns `PlayingCard`s
    /// that contain only four `Suit`s.
    func test_getStandardCards_withFourSuits_returnsCardsWithOnlyFourSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = 4
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)
        let actual = standardCards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all standard `PlayingCard`s with four `Suit`s returns `PlayingCard`s
    /// that only contain the given  `Suit`s.
    func test_getStandardCards_withFourSuits_returnsCardsWithOnlyGivenSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = suits
        
        // When
        let standardCards = try PlayingCards.getStandardCards(with: suits)

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }

    //-------------------------------------------------------------------------//
    //                               getJokers()                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving all `Joker`s returns two `Joker`s.
    func test_getJokers_returnsTwoJokers() throws {

        // Given
        let expected = 2
        
        // When
        let jokers = try PlayingCards.getJokers()
        let actual = jokers.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`Joker`s returns with only one red `Joker`..
    func test_getJokers_returnsCardsWithOnlyOneRedJoker_true() throws {

        // Given
        let redJoker = try Joker(color: .red)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getJokers()
        let actual = cards.getCount(of: redJoker)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`Joker`s returns with only one black `Joker`..
    func test_getJokers_returnsCardsWithOnlyOneBlackJoker_true() throws {

        // Given
        let blackJoker = try Joker(color: .black)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getJokers()
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
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included, with an invalid `Suit` throws an
    /// `invalidSuit Error`.
    func test_getAllCards_withInvalidSuit_throwsInvalidSuitError() throws {

        // Given
        let suit = Suit.stars
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getAllCards(with: suit)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that retrieving all `PlayingCard`s with a `Suit`, `Joker`s included,  returns 15
    /// `PlayingCard`s.
    func test_getAllCards_withSuit_returns15PlayingCards() throws {

        // Given
        let suit = Suit.hearts
        let expected = 15
        
        // When
        let standardCards = try PlayingCards.getAllCards(with: suit)
        let actual = standardCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Ace`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneAce() throws {

        // Given
        let suit = Suit.hearts
        let ace = try Ace(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: ace)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Two`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneTwo() throws {

        // Given
        let suit = Suit.hearts
        let two = try Two(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: two)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Three`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneThree() throws {

        // Given
        let suit = Suit.hearts
        let three = try Three(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: three)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns
    /// `PlayingCard`s that only contains one `Four`.
    func test_geAllCards_withSuit_returnsCardsWithOnlyOneFour() throws {

        // Given
        let suit = Suit.hearts
        let four = try Four(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: four)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Five`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneFive() throws {

        // Given
        let suit = Suit.hearts
        let five = try Five(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: five)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Six`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneSix() throws {

        // Given
        let suit = Suit.hearts
        let six = try Six(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: six)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Seven`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneSeven() throws {

        // Given
        let suit = Suit.hearts
        let seven = try Seven(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: seven)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Eight`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneEight() throws {

        // Given
        let suit = Suit.hearts
        let eight = try Eight(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: eight)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Nine`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneNine() throws {

        // Given
        let suit = Suit.hearts
        let nine = try Nine(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: nine)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Ten`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneTen() throws {

        // Given
        let suit = Suit.hearts
        let ten = try Ten(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: ten)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Jack`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneJack() throws {

        // Given
        let suit = Suit.hearts
        let jack = try Jack(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: jack)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Queen`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneQueen() throws {

        // Given
        let suit = Suit.hearts
        let queen = try Queen(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: queen)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included, with a `Suit` returns
    /// `PlayingCard`s that only contains one `King`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneKing() throws {

        // Given
        let suit = Suit.hearts
        let king = try King(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: king)

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included, with a `Suit` returns
    /// `PlayingCard`s that only contains two `Joker`s.
    func test_getAllCards_withSuit_returnsCardsWithOnlyTwoJokers() throws {

        // Given
        let suit = Suit.hearts
        let joker = try Joker(color: .red)
        let expected = 2
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let cardsByRank = cards.splitByRank()
        let jokers = cardsByRank[joker.rank]
        let actual = jokers?.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included, with a `Suit` returns
    /// `PlayingCard`s that only contains one red `Joker`s.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneRedJoker() throws {

        // Given
        let suit = Suit.hearts
        let redJoker = try Joker(color: .red)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: redJoker)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included, with a `Suit` returns
    /// `PlayingCard`s that only contains one black `Joker`s.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneBlackJoker() throws {

        // Given
        let suit = Suit.hearts
        let blackJoker = try Joker(color: .black)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.getCount(of: blackJoker)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`PlayingCard`s with a `Suit` returns `PlayingCard`s that contain
    /// only two `Suit`s.
    func test_getAllCards_withSuit_returnsPlayingCardsWithOnlyTwoSuits() throws {

        // Given
        let suit = Suit.hearts
        let expected = 2
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let actual = cards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s with a `Suit` returns `PlayingCard`s that only
    /// contains the given and `null Suit`s.
    func test_getAllCards_withSuit_returnsCardsWithOnlyGivenAndNullSuit()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.null
        let expected = [suit1, suit2]
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit1)

        // Then
        XCTAssert(cards.contain(only: expected))
    }
    
    //                     //
    // With Multiple Suits //
    //                     //
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with `Suit`s that contain an
    /// invalid `Suit` throws an `invalidSuit Error`.
    func test_getAllCards_withInvalidSuits_throwsInvalidSuitError() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.stars
        let suits = [suit1, suit2]
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getAllCards(with: suits)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with the default `Suit`s returns 54
    /// `PlayingCard`s.
    func test_getAllCards_withDefaultSuits_returns54PlayingCards() throws {

        // Given
        let expected = 54
        
        // When
        let cards = try PlayingCards.getAllCards()
        let actual = cards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Jacks //
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one`Jack` of `heart`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneJackOfHearts() throws {

         // Given
         let suit = Suit.hearts
         let jackOfHearts = try Jack(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: jackOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `Jack` of `spade`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneJackOfSpades() throws {

         // Given
         let suit = Suit.spades
         let jackOfSpades = try Jack(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: jackOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `Jack` of `diamond`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneJackOfDiamonds() throws {

         // Given
         let suit = Suit.diamonds
         let jackOfDiamonds = try Jack(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: jackOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `Jack` of `club`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneJackOfClubs() throws {

         // Given
         let suit = Suit.clubs
         let jackOfClubs = try Jack(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: jackOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Queens //
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `Queen` of `heart`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneQueenOfHearts() throws {

         // Given
         let suit = Suit.hearts
         let queenOfHearts = try Queen(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: queenOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `Queen` of `spade`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneQueenOfSpades() throws {

         // Given
         let suit = Suit.spades
         let queenOfSpades = try Queen(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: queenOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `Queen` of `diamond`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneQueenOfDiamonds() throws {

         // Given
         let suit = Suit.diamonds
         let queenOfDiamonds = try Queen(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: queenOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `Queen` of `club`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneQueenOfClubs() throws {

         // Given
         let suit = Suit.clubs
         let queenOfClubs = try Queen(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: queenOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     // Kings //
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `King` of `heart`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneKingOfHearts() throws {

         // Given
         let suit = Suit.hearts
         let kingOfHearts = try King(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: kingOfHearts)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `King` of `spade`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneKingOfSpades() throws {

         // Given
         let suit = Suit.spades
         let kingOfSpades = try King(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: kingOfSpades)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one
     /// `King` of `diamond`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneKingOfDiamonds() throws {

         // Given
         let suit = Suit.diamonds
         let kingOfDiamonds = try King(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: kingOfDiamonds)

         // Then
         XCTAssertEqual(expected, actual)
     }
     
     /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with a `Suit` returns  `PlayingCard`s
    ///  that only contain one `King` of `club`s.
     func test_getAllCards_withSuit_returnsCardsWithOnlyOneKingOfClubs() throws {

         // Given
         let suit = Suit.clubs
         let kingOfClubs = try King(of: suit)
         let expected = 1
         
         // When
         let cards = try PlayingCards.getAllCards(with: suit)
         let actual = cards.getCount(of: kingOfClubs)

         // Then
         XCTAssertEqual(expected, actual)
     }
    
    /// Tests that retrieving all`PlayingCard`s with the default `Suit`s returns `PlayingCard`s
    /// that contain only five  `Suit`s.
    func test_getAllCards_withDefaultSuits_returnsCardsWithOnlyFiveSuits()
        throws {

        // Given
        let expected = 5
        
        // When
        let cards = try PlayingCards.getAllCards()
        let actual = cards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s with the default `Suit`s returns `PlayingCard`s that
    /// only contain the standard and `null Suit`s.
    func test_getAllCards_withDefaultSuit_returnsCardsWithOnlyStandardAndNullSuits()
        throws {

        // Given
        let expected = PlayingCards.allSuits
        
        // When
        let standardCards = try PlayingCards.getStandardCards()

        // Then
        XCTAssert(standardCards.contain(only: expected))
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with one `Suit` returns 15
    /// `PlayingCard`s.
    func test_getAllCards_withOneSuit_returns15PlayingCards() throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 15
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)
        let actual = cards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s with one `Suit`s returns `PlayingCard`s that
    /// contain only two `Suit`s.
    func test_getAllCards_witOneSuit_returnsCardsWithOnlyTwoSuits() throws {

        // Given
        let suit = Suit.hearts
        let suits = [suit]
        let expected = 2
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)
        let actual = cards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with one `Suit`s returns
    /// `PlayingCard`s that only contain the given and `null Suit`s.
    func test_getAllCards_withOneSuit_returnsCardsWithOnlyGivenAndNullSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.null
        let suits = [suit1]
        let expected = [suit1, suit2]
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)

        // Then
        XCTAssert(cards.contain(only: expected))
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with two `Suit`s returns 28
    /// `PlayingCard`s.
    func test_getAllCards_withTwoSuits_returns28PlayingCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = 28
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)
        let actual = cards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s with two `Suit`s returns `PlayingCard`s that
    /// contain only three `Suit`s.
    func test_getAllCards_withTwoSuits_returnsCardsWithOnlyThreeSuits() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let expected = 3
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)
        let actual = cards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with two `Suit`s returns
    /// `PlayingCard`s that only contain the given  and `null Suit`s.
    func test_getAllCards_withTwoSuits_returnsCardsWithOnlyGivenAndNullSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.null
        let suits = [suit1, suit2]
        let expected = [suit1, suit2, suit3]
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)

        // Then
        XCTAssert(cards.contain(only: expected))
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with three `Suit`s returns 41
    /// `PlayingCard`s.
    func test_getAllCards_withThreeSuits_returns41PlayingCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = 41
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)
        let actual = cards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s with three `Suit`s returns `PlayingCard`s that
    /// contain only four `Suit`s.
    func test_getAllCards_withThreeSuits_returnsCardsWithOnlyFourSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let expected = 4
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)
        let actual = cards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with three `Suit`s returns
    /// `PlayingCard`s that only contain the given  and `null Suit`s.
    func test_getAllCards_withThreeSuits_returnsCardsWithOnlyGivenAndNullSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.null
        let suits = [suit1, suit2, suit3]
        let expected = [suit1, suit2, suit3, suit4]
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)

        // Then
        XCTAssert(cards.contain(only: expected))
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included, with four `Suit`s returns 54
    /// `PlayingCard`s.
    func test_getAllCards_withFourSuits_returns54PlayingCards() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = 54
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)
        let actual = cards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s with four `Suit`s returns `PlayingCard`s that
    /// contain only five `Suit`s.
    func test_getAllCards_withFourSuits_returnsCardsWithOnlyFiveSuits() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suits = [suit1, suit2, suit3, suit4]
        let expected = 5
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)
        let actual = cards.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with four `Suit`s returns
    /// `PlayingCard`s that only contain the given  and `null Suit`s.
    func test_getAllCards_withFourSuits_returnsCardsWithOnlyGivenAndNullSuits()
        throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let suit5 = Suit.null
        let suits = [suit1, suit2, suit3, suit4]
        let expected = [suit1, suit2, suit3, suit4, suit5]
        
        // When
        let cards = try PlayingCards.getAllCards(with: suits)

        // Then
        XCTAssert(cards.contain(only: expected))
    }
}
