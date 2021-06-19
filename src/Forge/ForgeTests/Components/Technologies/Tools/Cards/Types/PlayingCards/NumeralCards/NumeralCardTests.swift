//=============================================================================//
//                                                                             //
//  NumeralCardTests.swift                                                     //
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

/// Unit tests for a `NumeralCard`.
class NumeralCardTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Ranks                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `NumeralCard` with a non-standard numeral `PlayingCard Rank`
    /// throws an `invalidRank Error`.
    func test_init_withNonStandardNumeralPlayingCardRank_throwsInvalidRank()
        throws {

        // Given
        let rank = Rank.jack
        let suit = Suit.hearts
        let points = 1
        let position = 1
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try NumeralCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `NumeralCard` with a`null PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.null
        let points = 1
        let position = 1
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try NumeralCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a `NumeralCard` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.stars
        let points = 1
        let position = 1
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try NumeralCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                            Invalid Positions                            //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `NumeralCard` with a position less than 1 throws an `invalidPosition`
    /// `Error`.
    func test_init_withPositionLessThanOne_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = 0
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try NumeralCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `NumeralCard` with a position equal to 11 throws an `invalidPosition`
    /// `Error`.
    func test_init_withPositionEqualTo11_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = 11
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try NumeralCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `NumeralCard` with a position equal to 12 throws an `invalidPosition`
    /// `Error`.
    func test_init_withPositionEqualTo12_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = 12
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try NumeralCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `NumeralCard` with a position equal to 13 throws an `invalidPosition`
    /// `Error`.
    func test_init_withPositionEqualTo13_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = 13
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try NumeralCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `NumeralCard` with a position greater than 14 throws an
    /// `invalidPosition Error`.
    func test_init_withPositionGreaterThan14_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = 15
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try NumeralCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a new `NumeralCard` equals the given "`Rank` Of `Suit`".
    func test_title_ofNewNumeralCard_equalsGivenRankOfSuit() throws {
        
        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = 1
        let numeralCard = try NumeralCard(rank, of: suit, worth: points,
                                          at: position)
        let expected = "Ace Of Hearts"
        
        // When
        let actual = numeralCard.title

        // Then
        XCTAssertEqual(expected, actual)
    }
}
