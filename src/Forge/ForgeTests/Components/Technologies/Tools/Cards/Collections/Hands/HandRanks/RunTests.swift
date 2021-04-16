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
import SwiftUI
@testable import Forge

/// Unit tests for a `Run HandRank`.
class RunTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Success                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Run HandRank` with `PlayingCard`s that are in sequential order
    /// succeeds.
    func test_init_withSequentialCards_succeeds() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.four
        let rank5 = Rank.five
        let rank6 = Rank.six
        let rank7 = Rank.seven
        let rank8 = Rank.eight
        let rank9 = Rank.nine
        let rank10 = Rank.ten
        let rank11 = Rank.jack
        let rank12 = Rank.queen
        let rank13 = Rank.king
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let card6 = PlayingCard(rank6, of: suit)!
        let card7 = PlayingCard(rank7, of: suit)!
        let card8 = PlayingCard(rank8, of: suit)!
        let card9 = PlayingCard(rank9, of: suit)!
        let card10 = PlayingCard(rank10, of: suit)!
        let card11 = PlayingCard(rank11, of: suit)!
        let card12 = PlayingCard(rank12, of: suit)!
        let card13 = PlayingCard(rank13, of: suit)!
        let cards = [card1, card2, card3, card4, card5, card6, card7, card8,
                     card9, card10, card11, card12, card13]
        
        // When
        let run = Run(of: cards)
        
        // Then
        XCTAssert(run != nil)
    }
    
    //-------------------------------------------------------------------------//
    //                               Failure                                   //
    //-------------------------------------------------------------------------//
    
                            //                   //
                            // Insuffcient Cards //
                            //                   //

    /// Tests that creating a `Run HandRank` with less than three `PlayingCards` returns nil.
    func test_init_withInsufficientCards_returnsNil() {

        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        
        // When
        let run = Run(of: cards)
        
        // Then
        XCTAssert(run == nil)
    }
    
    /// Tests that creating a double `Run HandRank` with less than four `PlayingCards` returns nil.
    func test_init_doubleRunWithInsufficientCards_returnsNil() {

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
        let pairs = 1
        
        // When
        let run = Run(of: cards, with: pairs)
        
        // Then
        XCTAssert(run == nil)
    }
    
    /// Tests that creating a double double `Run HandRank` with less than five `PlayingCards`
    /// returns nil.
    func test_init_doubleDoubleRunWithInsufficientCards_returnsNil() {

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
        let pairs = 2
        
        // When
        let run = Run(of: cards, with: pairs)
        
        // Then
        XCTAssert(run == nil)
    }
    
    /// Tests that creating a tirple `Run HandRank` with less than five `PlayingCards` returns nil.
    func test_init_tripleRunWithInsufficientCards_returnsNil() {

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
        let pairs = 3
        
        // When
        let run = Run(of: cards, with: pairs)
        
        // Then
        XCTAssert(run == nil)
    }
    
                             //                 //
                             // Excessive Cards //
                             //                 //

    /// Tests that creating a double `Run HandRank` with more than five `PlayingCards` returns nil.
    func test_init_doubleRunWithExcessiveCards_returnsNil() {

        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.four
        let rank6 = Rank.five
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
        let pairs = 1
        
        // When
        let run = Run(of: cards, with: pairs)
        
        // Then
        XCTAssert(run == nil)
    }
    
    /// Tests that creating a double double`Run HandRank` with more than five `PlayingCards`
    /// returns nil.
    func test_init_doubleDoubleRunWithExcessiveCards_returnsNil() {

        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.three
        let rank5 = Rank.four
        let rank6 = Rank.five
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
        let pairs = 2
        
        // When
        let run = Run(of: cards, with: pairs)
        
        // Then
        XCTAssert(run == nil)
    }
    
    /// Tests that creating a triple`Run HandRank` with more than five `PlayingCards` returns nil.
    func test_init_tripleRunWithExcessiveCards_returnsNil() {

        // Given
        let rank1 = Rank.ace
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
        let pairs = 3
        
        // When
        let run = Run(of: cards, with: pairs)
        
        // Then
        XCTAssert(run == nil)
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a  standard n-`Card Run HandRank` equals "`Run` of n".
    func test_title_ofRun_equalsRunOfN() {
        
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let cards = [card1, card2, card3]
        let run = Run(of: cards)!
        let expected = "Run Of 3"
        
        // When
        let actual = run.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a double n-`Card Run HandRank` equals "`Run` of n".
    func test_title_ofDoubleRun_equalsDoubleRunOfN() {
        
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
        let pairs = 1
        let doubleRun = Run(of: cards, with: pairs)!
        let expected = "Double Run Of 4"
        
        // When
        let actual = doubleRun.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
