//=============================================================================//
//                                                                             //
//  PairTests.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/16/21.                                       //
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

/// Unit tests for a `Pair HandRank`.
class PairTests: XCTestCase {

    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Count                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Pair` with less than two`Cards` throws an `invalidCount Error`.
    func test_init_withInsufficientCards_throwsInvalidCountError() throws {

        // Given
        let card = try Ace(of: .hearts)
        let cards = [card]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try Pair(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that creating a `Pair` with more than two`Cards` throws an `invalidCount Error`.
    func test_init_withExcessiveCards_throwsInvalidCountError() throws {

        // Given
        let card = try Ace(of: .hearts)
        let other = try Ace(of: .spades)
        let card3 = try Ace(of: .diamonds)
        let cards = [card, other, card3]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try Pair(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }

    //-------------------------------------------------------------------------//
    //                             Multiple Ranks                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Pair` with `Cards`that do not all have the same `Rank` throws an
    /// `invalidRank Error`.
    func test_init_withMultipleRanks_throwsError() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .spades)
        let cards = [ace, two]
        let expected = ElementsError.insufficientElements

        // When
        XCTAssertThrowsError(try Pair(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the points of  a`Pair` equals 2.
    func test_points_ofPair_equals2() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let cards = [ace1, ace2]
        let pair = try Pair(of: cards)
        let expected = 2

        // When
        let actual = pair.points

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//

    /// Tests that the min cards  of a `Pair` equals 2.
    func test_minCards_ofPair_equals2() throws {

        // Given
        let ace1 = try Ace(of: .clubs)
        let ace2 = try Ace(of: .spades)
        let cards = [ace1, ace2]
        let pair = try Pair(of: cards)
        let expected = 2

        // When
        let actual = pair.minCards

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the max cards  of a `Pair` equals 2.
    func test_maxCards_ofPair_equals2() throws {

        // Given
        let ace1 = try Ace(of: .clubs)
        let ace2 = try Ace(of: .spades)
        let cards = [ace1, ace2]
        let pair = try Pair(of: cards)
        let expected = 2

        // When
        let actual = pair.maxCards

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the count of a `Pair` equals 2.
    func test_count_ofPair_equals2() throws {

        // Given
        let ace1 = try Ace(of: .clubs)
        let ace2 = try Ace(of: .spades)
        let cards = [ace1, ace2]
        let pair = try Pair(of: cards)
        let expected = 2

        // When
        let actual = pair.count

        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Capacity                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the capacity of a `Pair` equals 0.
    func test_capacity_ofPair_equals0() throws {

        // Given
        let ace1 = try Ace(of: .clubs)
        let ace2 = try Ace(of: .spades)
        let cards = [ace1, ace2]
        let pair = try Pair(of: cards)
        let expected = 0

        // When
        let actual = pair.capacity

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the title of a `Pair` equals "Pair".
    func test_title_ofPair_equalsPair() throws {

        // Given
        let ace1 = try Ace(of: .clubs)
        let ace2 = try Ace(of: .spades)
        let cards = [ace1, ace2]
        let pair = try Pair(of: cards)
        let expected = "Pair"

        // When
        let actual = pair.title

        XCTAssertEqual(expected, actual)
    }
}
