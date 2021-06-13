//=============================================================================//
//                                                                             //
//  MultiRunTests.swift                                                        //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/14/21.                                       //
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

/// Unit tests for the `MultiRun` class.
class MultiRunTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Min                                //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `MultiRun` with a min less than four throws an `invalidMin Error`.
    func test_init_withMinLessThanFour_throwsInvalidMinError() throws {

        // Given
        let min = 3
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .spades)
        let cards = [jack, queen, king1, king2]
        let count = 2
        let expected = RangeError.invalidMin

        // When
        XCTAssertThrowsError(try MultiRun(of: min, cards, with: count)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                          Invalid Pair Count                             //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `MultiRun` with zero `Pair`s throws an `invalidKindCount Error`.
    func test_init_withZeroPairs_throwsInvalidKindCountError() throws {

        // Given
        let min = 4
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let count = 2
        let expected = HandRankError.invalidKindCount

        // When
        XCTAssertThrowsError(try MultiRun(of: min, cards, with: count)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? HandRankError)
        }
    }
    
    /// Tests that creating a `MultiRun` with more `Pair`s than expected throws an
    /// `invalidKindCount Error`.
    func test_init_witExcessivePairs_throwsInvalidKindCountError() throws {

        // Given
        let min = 4
        let jack = try Jack(of: .hearts)
        let queen1 = try Queen(of: .hearts)
        let queen2 = try Queen(of: .spades)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .spades)
        let cards = [jack, queen1, queen2, king1, king2]
        let count = 2
        let expected = HandRankError.invalidKindCount

        // When
        XCTAssertThrowsError(try MultiRun(of: min, cards, with: count)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? HandRankError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                           Invalid Run Count                             //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `MultiRun` with zero `Run`s throws an `invalidRun Error`.
    func test_init_withZeroRuns_throwsInvalidRunError() throws {

        // Given
        let min = 4
        let ten = try Ten(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .spades)
        let cards = [ten, queen, king1, king2]
        let count = 2
        let expected = HandRankError.invalidRun

        // When
        XCTAssertThrowsError(try MultiRun(of: min, cards, with: count)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? HandRankError)
        }
    }
    
    /// Tests that creating a `MultiRun` with more `Run`s than expected throws an
    /// `invalidRunCount Error`.
    func test_init_witExcessiveRuns_throwsInvalidRunError() throws {

        // Given
        let min = 4
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .spades)
        let cards = [ace, two, three, jack, queen, king1, king2]
        let count = 2
        let expected = HandRankError.invalidRun

        // When
        XCTAssertThrowsError(try MultiRun(of: min, cards, with: count)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? HandRankError)
        }
    }
}
