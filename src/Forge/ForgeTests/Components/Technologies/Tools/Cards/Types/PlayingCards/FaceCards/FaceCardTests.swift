//=============================================================================//
//                                                                             //
//  FaceCardTests.swift                                                        //
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

/// Unit tests for a `FaceCard`.
class FaceCardTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`FaceCard` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.king
        let suit = Suit.null
        let points = 10
        let position = 13
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try FaceCard(rank, of: suit, worth: points,
                                          at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a `FaceCard` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.king
        let suit = Suit.stars
        let points = 10
        let position = 13
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try FaceCard(rank, of: suit, worth: points,
                                          at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              Invalid Ranks                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `FaceCard` with a non-standard royal`PlayingCard Rank` throws an
    /// `invalidRank Error`.
    func test_init_withNonStandardRoyalPlayingCardRank_throwsInvalidRank()
        throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = 1
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try FaceCard(rank, of: suit, worth: points,
                                          at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                            Invalid Positions                            //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `FaceCard` with a position less than 11 throws an `invalidPosition`
    /// `Error`.
    func test_init_withPositionLessThan11_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.king
        let suit = Suit.hearts
        let points = 10
        let position = 10
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try FaceCard(rank, of: suit, worth: points,
                                          at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `FaceCard` with a position greater than 13 throws an `invalidPosition`
    /// `Error`.
    func test_init_withPositionGreaterThan13_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.king
        let suit = Suit.hearts
        let points = 10
        let position = 14
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try FaceCard(rank, of: suit, worth: points,
                                          at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
}
