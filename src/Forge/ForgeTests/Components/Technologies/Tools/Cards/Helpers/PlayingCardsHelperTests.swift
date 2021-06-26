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
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns `NumeralCard`s that are
    /// equally `Suit`ed.
    func test_getNumeralCards_withSuit_returnsEquallySuitedNumeralCards() throws {

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
    
    /// Tests that retrieving all`NumeralCard`s with the default `Suit`s returns `NumeralCard`s that
    /// contain only four  `Suit`s.
    func test_getNumeralCards_withDefaultSuits_returnsCardsWithOnlyFourSuits() throws {

        // Given
        let expected = 4
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards()
        let actual = numeralCards.splitBySuit().count
        
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
    
    /// Tests that retrieving all`NumeralCard`s with one `Suit`s returns `NumeralCard`s that
    /// contain only one `Suit`.
    func test_getNumeralCards_witOneSuit_returnsCardsWithOnlyOneSuit() throws {

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
    func test_getNumeralCards_withTwoSuits_returnsCardsWithOnlyTwoSuits() throws {

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
    func test_getNumeralCards_withThreeSuits_returnsCardsWithOnlyThreeSuits() throws {

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
    func test_getNumeralCards_withFourSuits_returnsCardsWithOnlyFourSuits() throws {

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
    func test_getFaceCards_withThreeSuits_returnsCardsWithOnlyThreeSuits() throws {

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
    /// are equally `Suit`ed.
    func test_getStandardCards_withSuit_returnsEquallySuitedPlayingCards() throws {

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
    func test_getStandardCards_witTwoSuits_returnsCardsWithOnlyTwoSuits() throws {

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
    func test_getStandardCards_withThreeSuits_returnsCardsWithOnlyThreeSuits() throws {

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
    
    /// Tests that retrieving all`Jokers`s returns `FaceCard`s that contain only one `Suit`.
    func test_getJokers_returnsCardsWithOnlyOneSuit()
        throws {

        // Given
        let expected = 1
        
        // When
        let jokers = try PlayingCards.getJokers()
        let actual = jokers.splitBySuit().count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`Jokers`s returns `Jokers`s that contain only `null Suit`s.
    func test_getJokers_returnsCardsWithOnlyNullSuits() throws {

        // Given
        let expected = Suit.null
        
        // When
        let jokers = try PlayingCards.getJokers()
        
        // Then
        XCTAssert(jokers.contain(only: expected))
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
    func test_getAllCards_withSuit_returnsCardsWithOnlyGivenAndNullSuit() throws {

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
    func test_getAllCards_witTwoSuits_returnsCardsWithOnlyThreeSuits() throws {

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
    func test_getAllCards_withThreeSuits_returnsCardsWithOnlyFourSuits() throws {

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
}
