//=============================================================================//
//                                                                             //
//  CribbageHandTests.swift                                                    //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/29/21.                                       //
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

/// Unit tests for a`CribbageHand`.
class CribbageHandTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                             Excessive Cards                             //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `CribbageHand` with more than four `Card`s throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withExcessiveCards_throwsError() throws {

        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let aceOfHearts = try Ace(of: .hearts)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades,
                     aceOfHearts]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try CribbageHand(with: cards)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }

    //-------------------------------------------------------------------------//
    //                                  Jokers                                 //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `CribbageHand` with a `Joker` throws an `invalidRank Error`.
    func test_init_withJoker_throwsError() throws {

        // Given
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let joker = Joker(color: .red)
        let cards = [fiveOfDiamonds, fiveOfClubs, fiveOfSpades, joker]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try CribbageHand(with: cards)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }

    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the title of a default `CribbageHand` equals "Cribbage Hand".
    func test_title_ofDefaultCribbageHand_equalsCribbageHand() {

        // Given
        let hand = CribbageHand()
        let expected = "Cribbage Hand"

        // When
        let actual = hand.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `CribbageHand` equals "Cribbage Hand".
    func test_title_ofCribbageHand_equalsCribbageHand() throws {

        // Given
        let fiveOfHearts = try Five(of: .hearts)
        let fiveOfSpades = try Five(of: .spades)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let jackOfClubs = try Jack(of: .clubs)
        let cards = [fiveOfHearts, fiveOfSpades, fiveOfDiamonds, jackOfClubs]
        let cribbageHand = try CribbageHand(with: cards)
        let expected = "Cribbage Hand"

        // When
        let actual = cribbageHand.title

        // Then
        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//

    /// Tests that the min `Card`s  of a default`CribbageHand` equals zero.
    func test_minCards_ofDefaultCribbageHand_equalsZero() {

        // Given
        let hand = CribbageHand()
        let expected = 0

        // When
        let actual = hand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the min `Card`s  of a`CribbageHand` equals zero.
    func test_minCards_ofCribbageHand_equalsZero() throws {

        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades]
        let expected = 0
        let cribbageHand = try CribbageHand(with: cards)

        // When
        let actual = cribbageHand.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }

    /// Tests that the max `Card`s  of a`CribbageHand` equals four.
    func test_maxCards_ofCribbageHand_equalsFour() throws {

        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades]
        let expected = 4
        let cribbageHand = try CribbageHand(with: cards)

        // When
        let actual = cribbageHand.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the count of a`CribbageHand` equals the # of `Card`s given.
    func test_count_ofCribbageHand_equalsNCards() throws {

        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades]
        let expected = 4
        let cribbageHand = try CribbageHand(with: cards)

        // When
        let actual = cribbageHand.count

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Tests that a `CribbageHand` with one `Suit` and a cut `Card` of the same `Suit` has a
    /// `Flush`.
    func test_hasFlush_withOneSuit_true() throws {
        
        // Given
        let suit: Suit = .hearts
        let ace = try Ace(of: suit)
        let two = try Two(of: suit)
        let six = try Two(of: suit)
        let ten = try Ten(of: suit)
        let cards = [ace, two, six, ten]
        let hand = try CribbageHand(with: cards)
        let cutCard = try King(of: suit)
        
        // When/Then
        XCTAssert(hand.hasFlush(with: cutCard))
    }
    
    /// Tests that a `CribbageHand` with one `Suit` and a cut `Card` of a different  `Suit`does not
    /// have a `Flush`.
    func test_hasFlush_withCutCardOfDifferentSuit_false() throws {
        
        // Given
        let suit: Suit = .hearts
        let ace = try Ace(of: suit)
        let two = try Two(of: suit)
        let six = try Two(of: suit)
        let ten = try Ten(of: suit)
        let cards = [ace, two, six, ten]
        let hand = try CribbageHand(with: cards)
        let cutCard = try King(of: .spades)
        
        // When/Then
        XCTAssertFalse(hand.hasFlush(with: cutCard))
    }
    
    /// Tests that a `CribbageHand` with multiple `Suit`s does not have a `Flush`.
    func test_hasFlush_withDifferentSuits_false() throws {
        
        // Given
        let suit: Suit = .hearts
        let ace = try Ace(of: suit)
        let two = try Two(of: suit)
        let six = try Two(of: suit)
        let ten = try Ten(of: .spades)
        let cards = [ace, two, six, ten]
        let hand = try CribbageHand(with: cards)
        let cutCard = try King(of: suit)
        
        // When/Then
        XCTAssertFalse(hand.hasFlush(with: cutCard))
    }
    
    /// Tests that a non-full `CribbageHand` with one `Suit`does not have a `Flush`.
    func test_hasFlush_withNonFullHandOfOneSuit_false() throws {
        
        // Given
        let suit: Suit = .hearts
        let ace = try Ace(of: suit)
        let two = try Two(of: suit)
        let six = try Two(of: suit)
        let cards = [ace, two, six]
        let hand = try CribbageHand(with: cards)
        let cutCard = try King(of: suit)
        
        // When/Then
        XCTAssertFalse(hand.hasFlush(with: cutCard))
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                 Fifteens                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving the `Fifteens` in a `CribbageHand` with a`Joker` as the cut `Card`
    /// throws an `invalidRank Error`.
    func test_getFifteens_withJokerCutCard_throwsInvalidRankError() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        let cards = [ace, two, three, four]
        let hand = try CribbageHand(with: cards)
        let cutCard = Joker(color: .red)
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try hand.getFifteens(with: cutCard)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    /// Tests that retrieving the `Fifteens` in a `CribbageHand` with total `Card` points less than 15
    /// does not return any `Fifteen`s.
    func test_getFifteens_withTotalCardPointsGreaterThan15_returnsEmpty()
        throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        let cards = [ace, two, three, four]
        let hand = try CribbageHand(with: cards)
        let cutCard = try Four(of: .spades)
        let expected: [Fifteen] = []
        
        // When
        let actual = try hand.getFifteens(with: cutCard)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `Fifteens` in a `CribbageHand` with total `Card` points equal to 15
    /// returns only one expected `Fifteen`.
    func test_getFifteens_withTotalCardPointsOf15_returnsOneFifteen() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        let cards = [ace, two, three, four]
        let hand = try CribbageHand(with: cards)
        let cutCard = try Five(of: .hearts)
        let fifteenCards = [ace, two, three, four, cutCard]
        let expected = [try Fifteen(of: fifteenCards)]
        
        // When
        let actual = try hand.getFifteens(with: cutCard)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `Fifteens` in a `CribbageHand` with total four `Five PlayingCard`s
    /// returns four `Fifteen`s.
    func test_getFifteens_withFourFivePlayingCards_returnsFourFifteens() throws {
        
        // Given
        let fiveOfHearts = try Five(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfSpades = try Five(of: .spades)
        let fiveOfClubs = try Five(of: .clubs)
        let cards = [fiveOfHearts, fiveOfDiamonds, fiveOfSpades, fiveOfClubs]
        let hand = try CribbageHand(with: cards)
        let cutCard = try Ace(of: .hearts)
        let expected = 4
        
        // When
        let actual = try hand.getFifteens(with: cutCard).count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `Fifteens` in a perfect `CribbageHand` returns eight `Fifteen`s.
    func test_getFifteens_withPerfectHand_returnsEightFifteens() throws {
        
        // Given
        let fiveOfHearts = try Five(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfSpades = try Five(of: .spades)
        let jackOfClubs = try Jack(of: .clubs)
        let cards = [fiveOfHearts, fiveOfDiamonds, fiveOfSpades, jackOfClubs]
        let hand = try CribbageHand(with: cards)
        let cutCard = try Five(of: .clubs)
        let expected = 8
        
        // When
        let actual = try hand.getFifteens(with: cutCard).count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Nobs                                    //
    //-------------------------------------------------------------------------//

    /// Tests that retrieving `Nobs` in a `CribbageHand` that contains it returns the expected `Nobs`.
    func test_getNobs_whenExists_returnsExpectedNobs() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ace, two, ten, jack]
        let hand = try CribbageHand(with: cards)
        let cutCard = try Ace(of: .hearts)
        let expected = try Nobs(with: jack, and: cutCard)
        
        // When
        let actual = try hand.getNobs(with: cutCard)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving `Nobs` in a `CribbageHand` that does not contain it returns `nil`.
    func test_getNobs_whenDoesNotExist_returnsNil() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .diamonds)
        let cards = [ace, two, ten, jack]
        let hand = try CribbageHand(with: cards)
        let cutCard = try Ace(of: .hearts)
        
        // When
        let actual = try hand.getNobs(with: cutCard)
        
        // Then
        XCTAssertNil(actual)
    }
    

    /// Tests that retrieving`Nobs`in a `CribbageHand` with a`Jack` as the cut `Card` throws an
    /// `invalidRank Error`.
    func test_getNobs_withValidCardsthrowsInvalidRankError() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ace, two, ten, jack]
        let hand = try CribbageHand(with: cards)
        let cutCard = try Jack(of: .hearts)
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try hand.getNobs(with: cutCard)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }

    /// Tests that retrieving`Nobs`in a `CribbageHand` with a`Joker` as the cut `Card` throws an
    /// `invalidRank Error`.
    func test_init_withJokerCutCard_throwsInvalidRankError() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ace, two, ten, jack]
        let hand = try CribbageHand(with: cards)
        let cutCard = Joker(color: .red)
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try hand.getNobs(with: cutCard)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
}
