//=============================================================================//
//                                                                             //
//  FourOfAKindTests.swift                                                     //
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

/// Unit tests for a `FourOfAKind HandRank`.
class FourOfAKindTests: XCTestCase {

    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Count                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `FourOfAKind` with less than four`Cards` throws an `invalidCount`
    /// `Error`.
    func test_init_withInsufficientCards_throwsInvalidCountError() throws {

        // Given
        let card1 = try Ace(of: .hearts)
        let card2 = try Ace(of: .spades)
        let card3 = try Ace(of: .diamonds)
        let cards = [card1, card2, card3]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try FourOfAKind(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that creating a `FourOfAKind` with more than four `Cards` throws an `invalidCount`
    /// `Error`.
    func test_init_withExcessiveCards_throwsInvalidCountError() throws {

        // Given
        let card1 = try Ace(of: .hearts)
        let card2 = try Ace(of: .spades)
        let card3 = try Ace(of: .diamonds)
        let card4 = try Ace(of: .clubs)
        let card5 = try Ace(of: .hearts)
        let cards = [card1, card2, card3, card4, card5]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try FourOfAKind(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }

    //-------------------------------------------------------------------------//
    //                             Multiple Ranks                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `FourOfAKind` with `Cards`that do not all have the same `Rank` throws
    /// an `invalidRank Error`.
    func test_init_withMultipleRanks_throwsError() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let two = try Two(of: .clubs)
        let cards = [ace1, ace2, ace3, two]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try FourOfAKind(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the points of  a`FourOfAKind` equals 12.
    func test_points_ofFourOfAKind_equals12() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let ace4 = try Ace(of: .clubs)
        let cards = [ace1, ace2, ace3, ace4]
        let fourOfAKind = try FourOfAKind(of: cards)
        let expected = 12

        // When
        let actual = fourOfAKind.points

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//

    /// Tests that the min cards  of a `FourOfAKind` equals 4.
    func test_minCards_ofFourOfAKind_equals4() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let ace4 = try Ace(of: .clubs)
        let cards = [ace1, ace2, ace3, ace4]
        let fourOfAKind = try FourOfAKind(of: cards)
        let expected = 4

        // When
        let actual = fourOfAKind.minCards

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the max cards  of a `FourOfAKind` equals 4.
    func test_maxCards_ofFourOfAKind_equals4() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let ace4 = try Ace(of: .clubs)
        let cards = [ace1, ace2, ace3, ace4]
        let fourOfAKind = try FourOfAKind(of: cards)
        let expected = 4

        // When
        let actual = fourOfAKind.maxCards

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the count of a `FourOfAKind` equals 4.
    func test_count_ofFourOfAKind_equals4() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let ace4 = try Ace(of: .clubs)
        let cards = [ace1, ace2, ace3, ace4]
        let fourOfAKind = try FourOfAKind(of: cards)
        let expected = 4

        // When
        let actual = fourOfAKind.count

        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Capacity                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the capacity of a `FourOfAKind` equals 0.
    func test_capacity_ofFourOfAKind_equals0() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let ace4 = try Ace(of: .clubs)
        let cards = [ace1, ace2, ace3, ace4]
        let fourOfAKind = try FourOfAKind(of: cards)
        let expected = 0

        // When
        let actual = fourOfAKind.capacity

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the title of a `FourOfAKind` equals "Four Of A Kind".
    func test_title_ofFourOfAKind_equalsFourOfAKind() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let ace4 = try Ace(of: .clubs)
        let cards = [ace1, ace2, ace3, ace4]
        let fourOfAKind = try FourOfAKind(of: cards)
        let expected = "Four Of A Kind"

        // When
        let actual = fourOfAKind.title

        XCTAssertEqual(expected, actual)
    }
}
