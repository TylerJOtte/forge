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

/// Unit tests for a `Run HandRank`.
class DoubleRunTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Failure                                   //
    //-------------------------------------------------------------------------//
    
                             //                   //
                             // Insuffcient Cards //
                             //                   //

    /// Tests that creating a `DoubleRun` with less than four `PlayingCards` throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withInsufficientCards_throwsError() throws {

        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let cards = [card1, card2, card3]
        let expected = ElementsError.insufficientElements
        
        // When
        XCTAssertThrowsError(try DoubleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
                           //                      //
                           // Incorrect Pair Count //
                           //                      //
    
    /// Tests that creating a `DoubleRun` with zero pairs throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withZeroPairs_throwsError() throws {

        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.four
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let cards = [card1, card2, card3, card4]
        let expected = ElementsError.invalidDuplicateCount
        
        // When
        XCTAssertThrowsError(try DoubleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that creating a `DoubleRun` with more than one pair throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withMultiplePairs_throwsError() throws {

        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.ace
        let rank3 = Rank.two
        let rank4 = Rank.two
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let cards = [card1, card2, card3, card4]
        let expected = ElementsError.invalidDuplicateCount
        
        // When
        XCTAssertThrowsError(try DoubleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
                          //                      //
                          // Non-Sequential Cards //
                          //                      //

    /// Tests that creating a `DoubleRun` with`PlayingCards`that are not in sequential order throws
    ///  an `ElementsError.areNotSequential Error`.
    func test_init_withNontSequentialCards_throwsError() throws {

        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.three
        let rank3 = Rank.three
        let rank4 = Rank.two
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let cards = [card1, card2, card3, card4]
        let expected = ElementsError.areNotSequential
        
        // When
        XCTAssertThrowsError(try DoubleRun(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
                            
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the title of a `DoubleRun` equals "Double Run".
    func test_title_ofDoubleRun_equalsDoubleRun() throws {
        
        let rank1 = Rank.one
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
        let doubleRun = try DoubleRun(of: cards)
        let expected = "Double Run"
        
        // When
        let actual = doubleRun.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Runs                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the # of runs in a`DoubleRun` equals two.
    func test_runs_ofDoubleRun_equalsTwo() throws {
        
        let rank1 = Rank.one
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
        let doubleRun = try DoubleRun(of: cards)
        let expected = 2
        
        // When
        let actual = doubleRun.runs
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Pairs                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the # of pairs in a`DoubleRun` equals one.
    func test_pairs_ofDoubleRun_equalsOne() throws {
        
        let rank1 = Rank.one
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
        let doubleRun = try DoubleRun(of: cards)
        let expected = 1
        
        // When
        let actual = doubleRun.pairs
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                              Sequence                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the sequence total of a`DoubleRun`with four `PlayingCard`s equals three.
    func test_sequence_withFourCards_equalsThree() throws {
        
        let rank1 = Rank.one
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
        let doubleRun = try DoubleRun(of: cards)
        let expected = 3
        
        // When
        let actual = doubleRun.sequence
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the sequence total of a`DoubleRun`with five `PlayingCard`s equals four.
    func test_sequence_withFiveCards_equalsFour() throws {
        
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
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
        let doubleRun = try DoubleRun(of: cards)
        let expected = 4
        
        // When
        let actual = doubleRun.sequence
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
                                    //      //
                                    // Runs //
                                    //      //
    
    /// Tests that the run points of  a`DoubleRun`with four `PlayingCard`s equals six.
    func test_runPoints_withFourCards_equalsSix() throws {
        
        let rank1 = Rank.one
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
        let doubleRun = try DoubleRun(of: cards)
        let expected = 6
        
        // When
        let actual = doubleRun.runPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the run points of  a`DoubleRun`with five`PlayingCard`s equals eight.
    func test_runPoints_withFiveCards_equalsEight() throws {
        
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
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
        let doubleRun = try DoubleRun(of: cards)
        let expected = 8
        
        // When
        let actual = doubleRun.runPoints
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
                                   //       //
                                   // Pairs //
                                   //       //

    /// Tests that the pair points of  a`DoubleRun` equals two.
    func test_pairPoints_ofDoubleRun_equalsTwo() throws {

        let rank1 = Rank.one
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
        let doubleRun = try DoubleRun(of: cards)
        let expected = 2

        // When
        let actual = doubleRun.pairPoints

        // Then
        XCTAssertEqual(expected, actual)
    }
}
