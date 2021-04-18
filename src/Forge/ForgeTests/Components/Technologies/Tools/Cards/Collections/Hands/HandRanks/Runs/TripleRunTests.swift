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
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let cards = [card1, card2, card3, card4]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.two
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let rank6 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let card6 = PlayingCard(rank6, of: suit)!
        let cards = [card1, card2, card3, card4, card5, card6]
        let expected = ElementsError.invalidDuplicateCount
        
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
    func test_minCards_ofDoubleRun_equalsFour() throws {
        
        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let rank6 = Rank.four
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let card6 = PlayingCard(rank6, of: suit)!
        let cards = [card1, card2, card3, card4, card5, card6]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let rank6 = Rank.four
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let card6 = PlayingCard(rank6, of: suit)!
        let cards = [card1, card2, card3, card4, card5, card6]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let rank6 = Rank.four
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let card6 = PlayingCard(rank6, of: suit)!
        let cards = [card1, card2, card3, card4, card5, card6]
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
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
        let tripleRun = try TripleRun(of: cards)
        let expected = 6
        
        // When
        let actual = tripleRun.pairPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
