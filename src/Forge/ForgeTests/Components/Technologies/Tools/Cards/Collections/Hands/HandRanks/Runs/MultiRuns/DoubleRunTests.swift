//=============================================================================//
//                                                                             //
//  DoubleRunTests.swift                                                       //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/17/21.                                       //
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

/// Unit tests for a `DoubleRun HandRank`.
class DoubleRunTests: XCTestCase {

    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                            Insufficient Cards                           //
    //-------------------------------------------------------------------------//

//    /// Tests that creating a `DoubleRun` with less than four `PlayingCards` throws an
//    /// `ElementsError.insufficientElements Error`.
//    func test_init_withInsufficientCards_throwsError() throws {
//
//        // Given
//        let ace = try Ace(of: .hearts)
//        let two = try Two(of: .hearts)
//        let three = try Three(of: .hearts)
//        let cards = [ace, two, three]
//        let expected = ElementsError.invalidCount
//
//        // When
//        XCTAssertThrowsError(try DoubleRun(of: cards)) { error in
//
//            // Then
//            XCTAssertEqual(expected, error as? ElementsError)
//        }
//    }

    //-------------------------------------------------------------------------//
    //                           Incorrect Pair Count                          //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `DoubleRun` with zero pairs throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withZeroPairs_throwsError() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        let cards = [ace, two, three, four]
        let expected = HandRankError.invalidKindCount

        // When
        XCTAssertThrowsError(try DoubleRun(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? HandRankError)
        }
    }

    /// Tests that creating a `DoubleRun` with more than one pair throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withExcessivePairs_throwsError() throws {

//        // Given
//        let jack1 = try Jack(of: .hearts)
//        let jack2 = try Jack(of: .diamonds)
//        let queen1 = try Queen(of: .hearts)
//        let queen2 = try Queen(of: .diamonds)
//        let cards = [jack1, jack2, queen1, queen2]
//        let expected = HandRankError.invalidKindCount
//
//        // When
//        XCTAssertThrowsError(try DoubleRun(of: cards)) { error in
//
//            // Then
//            XCTAssertEqual(expected, error as? HandRankError)
//        }
    }

    //-------------------------------------------------------------------------//
    //                           Non-Sequential Cards                          //
    //-------------------------------------------------------------------------//

//    /// Tests that creating a `DoubleRun` with`PlayingCards`that are not in sequential order throws
//    ///  an `ElementsError.areNotSequential Error`.
//    func test_init_withNontSequentialCards_throwsError() throws {
//
//        // Given
//        let jack = try Jack(of: .hearts)
//        let queen = try Queen(of: .hearts)
//        let king1 = try King(of: .hearts)
//        let king2 = try King(of: .diamonds)
//        let cards = [jack, king1, king2, queen]
//        let expected = ElementsError.areNotSequential
//
//        // When
//        XCTAssertThrowsError(try DoubleRun(of: cards)) { error in
//
//            // Then
//            XCTAssertEqual(expected, error as? ElementsError)
//        }
//    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the title of a new `DoubleRun` created with `Card`s equals "Double Run".
    func test_title_ofNewDoubleRunWithCards_equalsDoubleRun() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let cards = [jack, queen, king1, king2]
        let doubleRun = try DoubleRun(of: cards)
        let expected = "Double Run"

        // When
        let actual = doubleRun.title

        // Then
        XCTAssertEqual(expected, actual)
    }

    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//

    /// Tests that the min cards  of a `DoubleRun` equals four.
    func test_minCards_ofDoubleRun_equalsFour() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let cards = [jack, queen, king1, king2]
        let doubleRun = try DoubleRun(of: cards)
        let expected = 4

        // When
        let actual = doubleRun.minCards

        // Then
        XCTAssertEqual(expected, actual)
    }

    /// Tests that the max cards  of a `DoubleRun` equals the system max.
    func test_maxCards_ofDoubleRun_equalsSystemMax() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let cards = [jack, queen, king1, king2]
        let doubleRun = try DoubleRun(of: cards)
        let expected = Int.max

        // When
        let actual = doubleRun.maxCards

        // Then
        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the count of a `DoubleRun` equals the # of `PlayingCards` given.
    func test_count_ofDoubleRun_equalsNCardsGiven() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let cards = [jack, queen, king1, king2]
        let doubleRun = try DoubleRun(of: cards)
        let expected = 4

        // When
        let actual = doubleRun.count

        // Then
        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the total points of  a`DoubleRun`with the min `PlayingCard`s equals eight.
    func test_points_withMinCards_equalsEight() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let cards = [jack, queen, king1, king2]
        let doubleRun = try DoubleRun(of: cards)
        let expected = 8

        // When
        let actual = doubleRun.points

        // Then
        XCTAssertEqual(expected, actual)
    }

    /// Tests that the total points of  a`DoubleRun`with five `PlayingCard`s equals ten.
    func test_points_withFiveCards_equalsTen() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let cards = [ten, jack, queen, king1, king2]
        let doubleRun = try DoubleRun(of: cards)
        let expected = 10

        // When
        let actual = doubleRun.points

        // Then
        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                Runs                                     //
    //-------------------------------------------------------------------------//

//    /// Tests that the # of runs in a`DoubleRun` equals two.
//    func test_runs_ofDoubleRun_equalsTwo() throws {
//
//        // Given
//        let jack = try Jack(of: .hearts)
//        let queen = try Queen(of: .hearts)
//        let king1 = try King(of: .hearts)
//        let king2 = try King(of: .diamonds)
//        let cards = [jack, queen, king1, king2]
//        let doubleRun = try DoubleRun(of: cards)
//        let expected = 2
//
//        // When
//        let actual = doubleRun.runs
//
//        // Then
//        XCTAssertEqual(expected, actual)
//    }
//
    //-------------------------------------------------------------------------//
    //                               Pairs                                     //
    //-------------------------------------------------------------------------//
//
//    /// Tests that the # of pairs in a`DoubleRun` equals one.
//    func test_pairs_ofDoubleRun_equalsOne() throws {
//
//        // Given
//        let jack = try Jack(of: .hearts)
//        let queen = try Queen(of: .hearts)
//        let king1 = try King(of: .hearts)
//        let king2 = try King(of: .diamonds)
//        let cards = [jack, queen, king1, king2]
//        let doubleRun = try DoubleRun(of: cards)
//        let expected = 1
//
//        // When
//        let actual = doubleRun.pairs
//
//        // Then
//        XCTAssertEqual(expected, actual)
//    }

    //-------------------------------------------------------------------------//
    //                              Sequence                                   //
    //-------------------------------------------------------------------------//

//    /// Tests that the sequence total of a`DoubleRun`with four `PlayingCard`s equals three.
//    func test_sequence_withFourCards_equalsThree() throws {
//
//        // Given
//        let jack = try Jack(of: .hearts)
//        let queen = try Queen(of: .hearts)
//        let king1 = try King(of: .hearts)
//        let king2 = try King(of: .diamonds)
//        let cards = [jack, queen, king1, king2]
//        let doubleRun = try DoubleRun(of: cards)
//        let expected = 3
//
//        // When
//        let actual = doubleRun.sequence
//
//        // Then
//        XCTAssertEqual(expected, actual)
//    }
//
//    /// Tests that the sequence total of a`DoubleRun`with five `PlayingCard`s equals four.
//    func test_sequence_withFiveCards_equalsFour() throws {
//
//        // Given
//        let ten = try Ten(of: .hearts)
//        let jack = try Jack(of: .hearts)
//        let queen = try Queen(of: .hearts)
//        let king1 = try King(of: .hearts)
//        let king2 = try King(of: .diamonds)
//        let cards = [ten, jack, queen, king1, king2]
//        let doubleRun = try DoubleRun(of: cards)
//        let expected = 4
//
//        // When
//        let actual = doubleRun.sequence
//
//        // Then
//        XCTAssertEqual(expected, actual)
//    }
//
    //-------------------------------------------------------------------------//
    //                              Run Points                                 //
    //-------------------------------------------------------------------------//

    /// Tests that the run points of  a`DoubleRun`with four `PlayingCard`s equals six.
//    func test_runPoints_withFourCards_equalsSix() throws {
//
//        // Given
//        let jack = try Jack(of: .hearts)
//        let queen = try Queen(of: .hearts)
//        let king1 = try King(of: .hearts)
//        let king2 = try King(of: .diamonds)
//        let cards = [jack, queen, king1, king2]
//        let doubleRun = try DoubleRun(of: cards)
//        let expected = 6
//
//        // When
//        let actual = doubleRun.runPoints
//
//        // Then
//        XCTAssertEqual(expected, actual)
//    }
//
//    /// Tests that the run points of  a`DoubleRun`with five`PlayingCard`s equals eight.
//    func test_runPoints_withFiveCards_equalsEight() throws {
//
//        // Given
//        let ten = try Ten(of: .hearts)
//        let jack = try Jack(of: .hearts)
//        let queen = try Queen(of: .hearts)
//        let king1 = try King(of: .hearts)
//        let king2 = try King(of: .diamonds)
//        let cards = [ten, jack, queen, king1, king2]
//        let doubleRun = try DoubleRun(of: cards)
//        let expected = 8
//
//        // When
//        let actual = doubleRun.runPoints
//
//        // Then
//        XCTAssertEqual(expected, actual)
//    }
//
    //-------------------------------------------------------------------------//
    //                              Pair Points                                //
    //-------------------------------------------------------------------------//
//
//    /// Tests that the pair points of  a`DoubleRun` equals two.
//    func test_pairPoints_ofDoubleRun_equalsTwo() throws {
//
//        // Given
//        let jack = try Jack(of: .hearts)
//        let queen = try Queen(of: .hearts)
//        let king1 = try King(of: .hearts)
//        let king2 = try King(of: .diamonds)
//        let cards = [jack, queen, king1, king2]
//        let doubleRun = try DoubleRun(of: cards)
//        let expected = 2
//
//        // When
//        let actual = doubleRun.pairPoints
//
//        // Then
//        XCTAssertEqual(expected, actual)
//    }
}
