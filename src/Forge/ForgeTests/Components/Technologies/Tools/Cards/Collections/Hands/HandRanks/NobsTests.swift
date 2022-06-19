//=============================================================================//
//                                                                             //
//  NobsTests.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/12/21.                                       //
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
import SwiftUI
@testable import Forge

/// Unit tests for a `Nobs HandRank`.
class NobsTests: XCTestCase {

    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    //-------------------------------------------------------------------------//
    //                              Invalid Ranks                              //
    //-------------------------------------------------------------------------//


    /// Tests that creating `Nobs` with a`Jack` as the cut `Card` throws an `invalidRank Error`.
    func test_init_withJackCutCard_throwsInvalidRankError() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let cutCard = try Jack(of: .hearts)
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Nobs(with: jack, and: cutCard)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }

    /// Tests that creating `Nobs` with a`Joker` as the cut `Card` throws an `invalidRank Error`.
    func test_init_withJokerCutCard_throwsInvalidRankError() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let cutCard = Joker(color: .red)
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Nobs(with: jack, and: cutCard)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }

    //-------------------------------------------------------------------------//
    //                             Multiple Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating `Nobs` with a `Jack` and a cut `Card` of a different `Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withMultipleSuits_throwsInvalidSuitError() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let cutCard = try Ace(of: .diamonds)
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Nobs(with: jack, and: cutCard)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }

    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the title of a new`Nobs` created with `Card`s equals "Nobs".
    func test_title_ofNewNobsWithCards_equalsNobs() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let cutCard = try Ace(of: .hearts)
        let nobs = try Nobs(with: jack, and: cutCard)
        let expected = "Nobs"

        // When
        let actual = nobs.title

        // Then
        XCTAssertEqual(expected, actual)
    }

    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the points of `Nobs` equals one.
    func test_points_ofNobs_equalsOne() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let cutCard = try Ace(of: .hearts)
        let nobs = try Nobs(with: jack, and: cutCard)
        let expected = 1

        // When
        let actual = nobs.points

        // Then
        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//

    /// Tests that the min cards  of `Nobs` equals two.
    func test_minCards_ofNobs_equalsTwo() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let cutCard = try Ace(of: .hearts)
        let nobs = try Nobs(with: jack, and: cutCard)
        let expected = 2

        // When
        let actual = nobs.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }

    /// Tests that the max cards  of `Nobs` equals two.
    func test_maxCards_ofNobs_equalsTwo() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let cutCard = try Ace(of: .hearts)
        let nobs = try Nobs(with: jack, and: cutCard)
        let expected = 2

        // When
        let actual = nobs.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the count of `Nobs` equals two.
    func test_count_ofNobs_equalsTwo() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let cutCard = try Ace(of: .hearts)
        let nobs = try Nobs(with: jack, and: cutCard)
        let expected = 2

        // When
        let actual = nobs.count

        // Then
        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                               Capacity                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the capacity of `Nobs` equals 0.
    func test_capacity_ofNobs_equals0() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let cutCard = try Ace(of: .hearts)
        let nobs = try Nobs(with: jack, and: cutCard)
        let expected = 0

        // When
        let actual = nobs.capacity

        XCTAssertEqual(expected, actual)
    }
}
