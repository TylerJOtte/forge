//=============================================================================//
//                                                                             //
//  TripleRunTests.swift                                                       //
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

/// Unit tests for a `TripleRun HandRank`.
class TripleRunTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                            Insufficient Cards                           //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `TripleRun` with less than five `PlayingCards` throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_tripleRunWithInsufficientCards_returnsNil() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let cards = [jack, queen, king1, king2]
        let expected = ElementsError.insufficientElements

        // When
        XCTAssertThrowsError(try TripleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                           Incorrect Pair Count                          //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `TripleRun` with two pairs throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withZeroPairs_throwsError() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen1 = try Queen(of: .hearts)
        let queen2 = try Queen(of: .diamonds)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let cards = [jack, queen1, queen2, king1, king2]
        let expected = ElementsError.invalidDuplicateCount
        
        // When
        XCTAssertThrowsError(try TripleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that creating a `TripleRun` with more than three pairs throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withExcessivePairs_throwsError() throws {

        // Given
        let jack1 = try Jack(of: .hearts)
        let jack2 = try Jack(of: .diamonds)
        let queen1 = try Queen(of: .hearts)
        let queen2 = try Queen(of: .diamonds)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let cards = [jack1, jack2, queen1, queen2, king1, king2]
        let expected = ElementsError.invalidDuplicateCount
        
        // When
        XCTAssertThrowsError(try TripleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                           Non-Sequential Cards                          //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `TripleRun` with`PlayingCards`that are not in sequential order throws
    ///  an `ElementsError.areNotSequential Error`.
    func test_init_withNontSequentialCards_throwsError() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, king1, queen, king2, king3]
        let expected = ElementsError.areNotSequential
        
        // When
        XCTAssertThrowsError(try TripleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the min cards  of a `TripleRun` equals five.
    func test_minCards_ofTripleRun_equalsFour() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 5
        
        // When
        let actual = tripleRun.minCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards  of a `TripleRun` equals the system max.
    func test_maxCards_ofTripleRun_equalsSystemMax() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = Int.max
        
        // When
        let actual = tripleRun.maxCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a `TripleRun` equals the # of `PlayingCards` given.
    func test_count_ofTripleRun_equalsNCardsGiven() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 5
        
        // When
        let actual = tripleRun.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `TripleRun` equals "Triple Run".
    func test_title_ofTripleRun_equalsTripleRun() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = "Triple Run"

        // When
        let actual = tripleRun.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the total points of  a`TripleRun`with the min `PlayingCard`s equals 15.
    func test_points_withMinCards_equals15() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 15
        
        // When
        let actual = tripleRun.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the total points of  a`TripleRun`with the six `PlayingCard`s equals 18
    func test_points_withSixCards_equals18() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [ten, jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 18
        
        // When
        let actual = tripleRun.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Runs                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the # of runs in a`TripleRun` equals three.
    func test_runs_ofTripleRun_equalsThree() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 3
        
        // When
        let actual = tripleRun.runs
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the # of pairs in a`TripleRun` equals three
    func test_pairs_ofTripleRun_equalsThree() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 3
        
        // When
        let actual = tripleRun.pairs
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                              Sequence                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the sequence total of a`TripleRun`with min `PlayingCard`s equals three.
    func test_sequence_withMinCards_equalsThree() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 3
        
        // When
        let actual = tripleRun.sequence
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the sequence total of a`TripleRun`with six `PlayingCard`s equals three.
    func test_sequence_withSixCards_equalsFour() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [ten, jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 4
        
        // When
        let actual = tripleRun.sequence
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                              Run Points                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that the run points of  a`TripleRun`with the min `PlayingCard`s equals nine.
    func test_runPoints_withMinCards_equalsNine() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 9
        
        // When
        let actual = tripleRun.runPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the run points of  a`TripleRun`with the six `PlayingCard`s equals twelve.
    func test_runPoints_withSixCards_equalsTwelve() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [ten, jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 12
        
        // When
        let actual = tripleRun.runPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                              Pair Points                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that the pair points of  a`TripleRun` equals six.
    func test_pairPoints_ofTripleRun_equalsSix() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .diamonds)
        let king3 = try King(of: .clubs)
        let cards = [jack, queen, king1, king2, king3]
        let tripleRun = try TripleRun(of: cards)
        let expected = 6
        
        // When
        let actual = tripleRun.pairPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
