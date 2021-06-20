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
    
    //-------------------------------------------------------------------------//
    //                              getFaceCards()                             //
    //-------------------------------------------------------------------------//
    
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
    
    //-------------------------------------------------------------------------//
    //                           getStandardCards()                             //
    //-------------------------------------------------------------------------//
    
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
    
    //-------------------------------------------------------------------------//
    //                              getAllCards()                              //
    //-------------------------------------------------------------------------//
    
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
}
