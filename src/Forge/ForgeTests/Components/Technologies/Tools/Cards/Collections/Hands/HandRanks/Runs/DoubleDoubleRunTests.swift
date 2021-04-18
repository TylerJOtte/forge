//=============================================================================//
//                                                                             //
//  DoubleDoubleRunTests.swift                                                 //
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

/// Unit tests for a `DoubleDoubleRun HandRank`.
class DoubleDoubleRunTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                            Insufficient Cards                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `DoubleDoubleRun` with less than five `PlayingCards` throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withInsufficientCards_throwsError() throws {

        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.two
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
        XCTAssertThrowsError(try DoubleDoubleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                           Incorrect Pair Count                          //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `DoubleDoubleRun` with one pair throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withInsuficcientPairs_throwsError() throws {

        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.two
        let rank4 = Rank.three
        let rank5 = Rank.four
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
        XCTAssertThrowsError(try DoubleDoubleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that creating a `DoubleDoubleRun` with more than two pairs throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withExcessivePairs_throwsError() throws {

        // Given
        let rank1 = Rank.one
        let rank2 = Rank.one
        let rank3 = Rank.two
        let rank4 = Rank.two
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
        XCTAssertThrowsError(try DoubleDoubleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                           Non-Sequential Cards                          //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `DoubleDoubleRun` with`PlayingCards`that are not in sequential order
    ///  throws an `ElementsError.areNotSequential Error`.
    func test_init_withNontSequentialCards_throwsError() throws {

        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.two
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
        let expected = ElementsError.areNotSequential
        
        // When
        XCTAssertThrowsError(try DoubleDoubleRun(of: cards)) { error in
            
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
    
    /// Tests that the min cards  of a `DoublDoubleRun` equals five.
    func test_minCards_ofDoubleRun_equalsFour() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 5
        
        // When
        let actual = doubleDoubleRun.minCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards  of a `DoubleDoubleRun` equals the system max.
    func test_maxCards_ofDoubleDoubleRun_equalsSystemMax() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = Int.max
        
        // When
        let actual = doubleDoubleRun.maxCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a `DoubleDoubleRun` equals the # of `PlayingCards` given.
    func test_count_ofDoubleDoubleRun_equalsNCardsGiven() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 5
        
        // When
        let actual = doubleDoubleRun.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//


    /// Tests that the title of a `DoubleDoubleRun` equals "Double Double Run".
    func test_title_ofDoubleDoubleRun_equalsDoubleDoubleRun() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = "Double Double Run"
        
        // When
        let actual = doubleDoubleRun.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the total points of  a`DoubleDoubleRun`with the min `PlayingCard`s equals16.
    func test_points_withMinCards_equals16() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 16
        
        // When
        let actual = doubleDoubleRun.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the total points of  a`DoubleDoubleRun`with the six `PlayingCard`s equals 20
    func test_points_withSixCards_equals20() throws {
        
        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.two
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 20
        
        // When
        let actual = doubleDoubleRun.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Runs                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the # of runs in a`DoubleDoubleRun` equals four.
    func test_runs_ofDoubleDoubleRun_equalsFour() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 4
        
        // When
        let actual = doubleDoubleRun.runs
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Pairs                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the # of pairs in a`DoubleDoubleRun` equals two.
    func test_pairs_ofDoubleDoubleRun_equalsTwo() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 2
        
        // When
        let actual = doubleDoubleRun.pairs
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                              Sequence                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the sequence total of a`DoubleDoubleRun`with min `PlayingCard`s equals three.
    func test_sequence_withMinCards_equalsThree() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 3
        
        // When
        let actual = doubleDoubleRun.sequence
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the sequence total of a`DoubleDoubleRun`with six `PlayingCard`s equals three.
    func test_sequence_withSixCards_equalsFour() throws {
        
        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.two
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 4
        
        // When
        let actual = doubleDoubleRun.sequence
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                              Run Points                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that the run points of  a`DoubleDoubleRun`with the min `PlayingCard`s equals twelve.
    func test_runPoints_withMinCards_equalsTwelve() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 12
        
        // When
        let actual = doubleDoubleRun.runPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the run points of  a`DoubleDoubleRun`with the six `PlayingCard`s equals sixteen.
    func test_runPoints_withSixCards_equalsSixteen() throws {
        
        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.two
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 16
        
        // When
        let actual = doubleDoubleRun.runPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                              Pair Points                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that the pair points of  a`DoubleDoubleRun` equals four.
    func test_pairPoints_ofDoubleDoubleRun_equalsFour() throws {
        
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
        let doubleDoubleRun = try DoubleDoubleRun(of: cards)
        let expected = 4
        
        // When
        let actual = doubleDoubleRun.pairPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
