//=============================================================================//
//                                                                             //
//  RunTests.swift                                                             //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/13/21.                                       //
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

/// Unit tests for a `Run HandRank`.
class Runests: XCTestCase {

    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Count                              //
    //-------------------------------------------------------------------------//
    
    //         //
    // Run Min //
    //         //
    
    /// Tests that creating a `Run` with less than three`Cards`using the throws an `invalidCount`
    /// `Error`.
    func test_convenienceInit_withInsufficientCards_throwsInvalidCountError()
        throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ten, jack]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try Run(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                           Non-Sequential Cards                          //
    //-------------------------------------------------------------------------//

    //              //
    // NumeralCards //
    //              //
    
    /// Tests that creating a `Run` with a high `Ace` and low sequential `Numeral Card`s  throws an
    /// `invalidRank Error`.
    func test_init_withHighAceAndLowSequentialNumeralCards_throwsInvalidRankError()
        throws {

        // Given
        let isHigh = true
        let ace = try Ace(of: .hearts, and: isHigh)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        let cards = [ace, two, three, four]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Run(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    /// Tests that creating a `Run` with a low `Ace` and non-sequential `NumeralCard`s throws an
    /// `invalidRank Error`.
    func test_init_withLowAceAndNonSequentialNumeralCards_throwsInvalidRankError()
        throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        let five = try Five(of: .hearts)
        let six = try Six(of: .hearts)
        let seven = try Seven(of: .hearts)
        let eight = try Eight(of: .hearts)
        let nine = try Nine(of: .hearts)
        let ten = try Ten(of: .hearts)
        let cards = [ace, two, three, four, five, six, seven, eight, ten, nine]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Run(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    //                      //
    // Numeral to FaceCards //
    //                      //
    
    /// Tests that creating a `Run` with non-sequential numeral to royal`Card` throws an `invalidRank`
    /// `Error`.
    func test_init_withNonSequentialNumeralToRoyalCards_throwsInvalidRankError()
        throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [jack, ten, queen, king]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Run(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    //           //
    // FaceCards //
    //           //
    
    /// Tests that creating a `Run` with non-sequential low royal`Card` throws an `invalidRank`
    /// `Error`.
    func test_init_withNonSequentialLowRoyalCard_throwsInvalidRankError()
        throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [king, queen, jack]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Run(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    /// Tests that creating a `Run` with non-sequential high royal`Card`s throws an `invalidRank`
    /// `Error`.
    func test_init_withNonSequentialHighRoyalCards_throwsInvalidRankError()
        throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [jack, king, queen]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Run(of: cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    /// Tests that creating a `Run` with sequential royal to low`Ace Card`s  throws an `invalidRank`
    /// `Error`.
    func test_init_withSequentialRoyalToLowAceCards_throwsInvalidRankError()
        throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let ace = try King(of: .hearts)
        let cards = [jack, queen, king, ace]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Run(of: cards)) { error in

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

    /// Tests that the points of  a`Run` with three `Card`s equals 3.
    func test_points_ofRunWith3Cards_equals3() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let cards = [ten, jack, queen]
        let run = try Run(of: cards)
        let expected = 3

        // When
        let actual = run.points

        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the points of  a`Run` with four `Card`s equals 4.
    func test_points_ofRunWith4Cards_equals4() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let run = try Run(of: cards)
        let expected = 4

        // When
        let actual = run.points

        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the points of  a`Run` with five `Card`s equals 5.
    func test_points_ofRunWith5Cards_equals5() throws {

        // Given
        let isHigh = true
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        let cards = [ten, jack, queen, king, ace]
        let run = try Run(of: cards)
        let expected = 5

        // When
        let actual = run.points

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//

    /// Tests that the min cards  of a `Run` equals 3.
    func test_minCards_ofRun_equals3() throws {

        // Given
        let isHigh = true
        let nine = try Nine(of: .hearts)
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        let cards = [nine, ten, jack, queen, king, ace]
        let run = try Run(of: cards)
        let expected = 3

        // When
        let actual = run.minCards

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the max cards  of a `Run` equals `Int.max`.
    func test_maxCards_ofRun_equalsSystemMax() throws {

        // Given
        let isHigh = true
        let nine = try Nine(of: .hearts)
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        let cards = [nine, ten, jack, queen, king, ace]
        let run = try Run(of: cards)
        let expected = Int.max

        // When
        let actual = run.maxCards

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the count of  a`Run` with three `Card`s equals 3.
    func test_count_ofRunWith3Cards_equals3() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let cards = [ten, jack, queen]
        let run = try Run(of: cards)
        let expected = 3

        // When
        let actual = run.count

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the count of  a`Run` with four `Card`s equals 4.
    func test_count_ofRunWith4Cards_equals4() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let run = try Run(of: cards)
        let expected = 4

        // When
        let actual = run.count

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the count of  a`Run` with five `Card`s equals 5.
    func test_count_ofRunWith5Cards_equals5() throws {

        // Given
        let isHigh = true
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        let cards = [ten, jack, queen, king, ace]
        let run = try Run(of: cards)
        let expected = 5

        // When
        let actual = run.count

        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Capacity                                  //
    //-------------------------------------------------------------------------//

    /// Tests that the capacity of  a`Run` with three `Card`s equals the expected value.
    func test_capacity_ofRunWith3Cards_equalsExpected() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let cards = [ten, jack, queen]
        let run = try Run(of: cards)
        let expected = 9223372036854775804

        // When
        let actual = run.capacity

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the capacity of  a`Run` with four `Card`s equals the expected value..
    func test_capacity_ofRunWith4Cards_equalsExpected() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let run = try Run(of: cards)
        let expected = 9223372036854775803

        // When
        let actual = run.capacity

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the capacity of  a`Run` with five `Card`s equals the expected value.
    func test_capacity_ofRunWith5Cards_equalsExpected() throws {

        // Given
        let isHigh = true
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        let cards = [ten, jack, queen, king, ace]
        let run = try Run(of: cards)
        let expected = 9223372036854775802

        // When
        let actual = run.capacity

        XCTAssertEqual(expected, actual)
    }

    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the title of  a`Run` with three `Card`s equals "Run".
    func test_title_ofRunWith3Cards_equalsRun() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let cards = [ten, jack, queen]
        let run = try Run(of: cards)
        let expected = "Run"

        // When
        let actual = run.title

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the title of  a`Run` with four `Card`s equals "Run".
    func test_title_ofRunWith4Cards_equalsRun() throws {

        // Given
        let nine = try Nine(of: .hearts)
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [nine, ten, jack, queen, king]
        let run = try Run(of: cards)
        let expected = "Run"

        // When
        let actual = run.title

        XCTAssertEqual(expected, actual)
    }

    /// Tests that the title of  a`Run` with five `Card`s equals "Run".
    func test_title_ofRunWith5Cards_equalsRun() throws {

        // Given
        let isHigh = true
        let nine = try Nine(of: .hearts)
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        let cards = [nine, ten, jack, queen, king, ace]
        let run = try Run(of: cards)
        let expected = "Run"

        // When
        let actual = run.title

        XCTAssertEqual(expected, actual)
    }
}
