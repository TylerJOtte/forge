//=============================================================================//
//                                                                             //
//  ThreeOfAKindTests.swift                                                    //
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

/// Unit tests for a `ThreeOfAKind HandRank`.
class ThreeOfAKindTests: XCTestCase {

    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Count                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `ThreeOfAKind` with less than three`Cards` throws an `invalidCount`
    /// `Error`.
    func test_init_withInsufficientCards_throwsInvalidCountError() throws {

        // Given
        let card1 = try Ace(of: .hearts)
        let card2 = try Ace(of: .spades)
        let cards = [card1, card2]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try ThreeOfAKind(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that creating a `ThreeOfAKind` with more than three `Cards` throws an
    /// `invalidCount Error`.
    func test_init_withExcessiveCards_throwsInvalidCountError() throws {

        // Given
        let card1 = try Ace(of: .hearts)
        let card2 = try Ace(of: .spades)
        let card3 = try Ace(of: .diamonds)
        let card4 = try Ace(of: .clubs)
        let cards = [card1, card2, card3, card4]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try ThreeOfAKind(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }

    //-------------------------------------------------------------------------//
    //                             Multiple Ranks                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `ThreeOfAKind` with `Cards`that do not all have the same `Rank` throws
    /// an `invalidRank Error`.
    func test_init_withMultipleRanks_throwsError() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let two = try Two(of: .spades)
        let cards = [ace1, ace2, two]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try ThreeOfAKind(of: cards)) { error in

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

    /// Tests that the points of  a`ThreeOfAKind` equals 6.
    func test_points_ofThreeOfAKind_equals6() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let cards = [ace1, ace2, ace3]
        let threeOfAKind = try ThreeOfAKind(of: cards)
        let expected = 6

        // When
        let actual = threeOfAKind.points

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//

    /// Tests that the min cards  of a `ThreeOfAKind` equals 3.
    func test_minCards_ofThreeOfAKind_equals3() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let cards = [ace1, ace2, ace3]
        let threeOfAKind = try ThreeOfAKind(of: cards)
        let expected = 3

        // When
        let actual = threeOfAKind.minCards

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the max cards  of a `ThreeOfAKind` equals 3.
    func test_maxCards_ofThreeOfAKind_equals3() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let cards = [ace1, ace2, ace3]
        let threeOfAKind = try ThreeOfAKind(of: cards)
        let expected = 3

        // When
        let actual = threeOfAKind.maxCards

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the count of a `ThreeOfAKind` equals 3.
    func test_count_ofThreeOfAKind_equals3() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let cards = [ace1, ace2, ace3]
        let threeOfAKind = try ThreeOfAKind(of: cards)
        let expected = 3

        // When
        let actual = threeOfAKind.count

        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Capacity                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the capacity of a `ThreeOfAKind` equals 0.
    func test_capacity_ofThreeOfAKind_equals0() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let cards = [ace1, ace2, ace3]
        let threeOfAKind = try ThreeOfAKind(of: cards)
        let expected = 0

        // When
        let actual = threeOfAKind.capacity

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the title of a `ThreeOfAKind` equals "Three Of A Kind".
    func test_title_ofThreeOfAKind_equalsThreeOfAKind() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let cards = [ace1, ace2, ace3]
        let threeOfAKind = try ThreeOfAKind(of: cards)
        let expected = "Three Of A Kind"

        // When
        let actual = threeOfAKind.title

        XCTAssertEqual(expected, actual)
    }
}
