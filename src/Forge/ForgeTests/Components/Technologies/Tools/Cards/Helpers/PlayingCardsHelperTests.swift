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
        let cardsByRank = numeralCards.splitByRank()
        let aces = cardsByRank[ace.rank]
        let actual = aces?.count

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
        let cardsByRank = numeralCards.splitByRank()
        let twos = cardsByRank[two.rank]
        let actual = twos?.count

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
        let cardsByRank = numeralCards.splitByRank()
        let threes = cardsByRank[three.rank]
        let actual = threes?.count

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
        let cardsByRank = numeralCards.splitByRank()
        let fours = cardsByRank[four.rank]
        let actual = fours?.count

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
        let cardsByRank = numeralCards.splitByRank()
        let fives = cardsByRank[five.rank]
        let actual = fives?.count

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
        let cardsByRank = numeralCards.splitByRank()
        let sixes = cardsByRank[six.rank]
        let actual = sixes?.count

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
        let cardsByRank = numeralCards.splitByRank()
        let sevens = cardsByRank[seven.rank]
        let actual = sevens?.count

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
        let cardsByRank = numeralCards.splitByRank()
        let eights = cardsByRank[eight.rank]
        let actual = eights?.count

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
        let cardsByRank = numeralCards.splitByRank()
        let nines = cardsByRank[nine.rank]
        let actual = nines?.count

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
        let cardsByRank = numeralCards.splitByRank()
        let tens = cardsByRank[ten.rank]
        let actual = tens?.count

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
        let cardsByRank = faceCards.splitByRank()
        let jacks = cardsByRank[jack.rank]
        let actual = jacks?.count

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
        let cardsByRank = faceCards.splitByRank()
        let queens = cardsByRank[queen.rank]
        let actual = queens?.count

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
        let cardsByRank = faceCards.splitByRank()
        let kings = cardsByRank[king.rank]
        let actual = kings?.count

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
        let cardsByRank = standardCards.splitByRank()
        let aces = cardsByRank[ace.rank]
        let actual = aces?.count

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
        let cardsByRank = standardCards.splitByRank()
        let twos = cardsByRank[two.rank]
        let actual = twos?.count

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
        let cardsByRank = standardCards.splitByRank()
        let threes = cardsByRank[three.rank]
        let actual = threes?.count

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
        let cardsByRank = standardCards.splitByRank()
        let fours = cardsByRank[four.rank]
        let actual = fours?.count

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
        let cardsByRank = standardCards.splitByRank()
        let fives = cardsByRank[five.rank]
        let actual = fives?.count

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
        let cardsByRank = standardCards.splitByRank()
        let sixes = cardsByRank[six.rank]
        let actual = sixes?.count

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
        let cardsByRank = standardCards.splitByRank()
        let sevens = cardsByRank[seven.rank]
        let actual = sevens?.count

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
        let cardsByRank = standardCards.splitByRank()
        let eights = cardsByRank[eight.rank]
        let actual = eights?.count

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
        let cardsByRank = standardCards.splitByRank()
        let nines = cardsByRank[nine.rank]
        let actual = nines?.count

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
        let cardsByRank = standardCards.splitByRank()
        let tens = cardsByRank[ten.rank]
        let actual = tens?.count

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
        let cardsByRank = standardCards.splitByRank()
        let jacks = cardsByRank[jack.rank]
        let actual = jacks?.count

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
        let cardsByRank = standardCards.splitByRank()
        let queens = cardsByRank[queen.rank]
        let actual = queens?.count

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
        let cardsByRank = standardCards.splitByRank()
        let kings = cardsByRank[king.rank]
        let actual = kings?.count

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
    
    /// Tests that retrieving all `PlayingCard`s, `Joker`s included,  with a `Suit` returns
    /// `PlayingCard`s that only contains one `Ace`.
    func test_getAllCards_withSuit_returnsCardsWithOnlyOneAce() throws {

        // Given
        let suit = Suit.hearts
        let ace = try Ace(of: suit)
        let expected = 1
        
        // When
        let cards = try PlayingCards.getAllCards(with: suit)
        let cardsByRank = cards.splitByRank()
        let aces = cardsByRank[ace.rank]
        let actual = aces?.count

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
        let cardsByRank = cards.splitByRank()
        let twos = cardsByRank[two.rank]
        let actual = twos?.count

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
        let cardsByRank = cards.splitByRank()
        let threes = cardsByRank[three.rank]
        let actual = threes?.count

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
        let cardsByRank = cards.splitByRank()
        let fours = cardsByRank[four.rank]
        let actual = fours?.count

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
        let cardsByRank = cards.splitByRank()
        let fives = cardsByRank[five.rank]
        let actual = fives?.count

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
        let cardsByRank = cards.splitByRank()
        let sixes = cardsByRank[six.rank]
        let actual = sixes?.count

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
        let cardsByRank = cards.splitByRank()
        let sevens = cardsByRank[seven.rank]
        let actual = sevens?.count

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
        let cardsByRank = cards.splitByRank()
        let eights = cardsByRank[eight.rank]
        let actual = eights?.count

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
        let cardsByRank = cards.splitByRank()
        let nines = cardsByRank[nine.rank]
        let actual = nines?.count

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
        let cardsByRank = cards.splitByRank()
        let tens = cardsByRank[ten.rank]
        let actual = tens?.count

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
        let cardsByRank = cards.splitByRank()
        let jacks = cardsByRank[jack.rank]
        let actual = jacks?.count

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
        let cardsByRank = cards.splitByRank()
        let queens = cardsByRank[queen.rank]
        let actual = queens?.count

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
        let cardsByRank = cards.splitByRank()
        let kings = cardsByRank[king.rank]
        let actual = kings?.count

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
