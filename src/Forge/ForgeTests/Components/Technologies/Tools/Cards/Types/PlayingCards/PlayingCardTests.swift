//=============================================================================//
//                                                                             //
//  PlayingCardTests.swift                                                     //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/15/21.                                       //
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

/// Unit tests for a `PlayingCard`.
class PlayingCardTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Ranks                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `PlayingCard` with a non-standard`PlayingCard Rank` throws an
    /// `invalidRank Error`.
    func test_init_withNonStandardPlayingCardRank_throwsInvalidRank() throws {

        // Given
        let rank = Rank.one
        let suit = Suit.hearts
        let points = 1
        let position = 1
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `PlayingCard` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.stars
        let points = 1
        let position = 11
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //                        //
    // Joker & non-null Suits //
    //                        //
    
    /// Tests that creating a `PlayingCard` with a `hearts PlayingCard Suit` and a `joker`
    /// `PlayingCard Rank` throws an `invalidSuit Error`.
    func test_init_withHeartsAndJoker_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.joker
        let suit = Suit.hearts
        let points = 0
        let position = 0
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a `PlayingCard` with a `diamonds PlayingCard Suit` and a `joker`
    /// `PlayingCard Rank` throws an `invalidSuit Error`.
    func test_init_withDiamondsAndJoker_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.joker
        let suit = Suit.diamonds
        let points = 0
        let position = 0
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a `PlayingCard` with a `clubs PlayingCard Suit` and a `joker`
    /// `PlayingCard Rank` throws an `invalidSuit Error`.
    func test_init_withClubsAndJoker_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.joker
        let suit = Suit.clubs
        let points = 0
        let position = 0
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a `PlayingCard` with a `spades PlayingCard Suit` and a `joker`
    /// `PlayingCard Rank` throws an `invalidSuit Error`.
    func test_init_withSpadesAndJoker_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.joker
        let suit = Suit.spades
        let points = 0
        let position = 0
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                            Invalid Positions                            //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `PlayingCard` with a position less than 0 throws an `invalidPosition`
    /// `Error`.
    func test_init_withPositionLessThan0_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = -1
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `FaceCard` with a position greater than 14 throws an `invalidPosition`
    /// `Error`.
    func test_init_withPositionGreaterThan14_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = 15
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
}
