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

/// Unit tests for the `Hand` class.
class NobsTests: XCTestCase {
   
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Success                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Nobs HandRank` with a non-`jack PlayingCard` and a `jack`
    /// `PlayingCard` of the same `Suit` succeeds.
    func test_init_withSameSuit_succeeds() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.jack
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        
        // When
        let nobs = Nobs(of: cards)
        
        // Then
        XCTAssert(nobs != nil)
    }
    
    //-------------------------------------------------------------------------//
    //                               Failure                                   //
    //-------------------------------------------------------------------------//
    
                                  //       //
                                  // Count //
                                  //       //
    
    /// Tests that creating a `Nobs HandRank` with less than two `PlayingCards` returns nil.
    func test_init_withInsufficientCards_returnsNil() {
        
        // Given
        let rank = Rank.jack
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let cards = [card]
        
        // When
        let nobs = Nobs(of: cards)
        
        // Then
        XCTAssert(nobs == nil)
    }
    
    /// Tests that creating a `Nobs HandRank` with more than two `PlayingCards` returns nil.
    func test_init_withExcessiveCards_returnsNil() {
        
        // Given
        let rank1 = Rank.jack
        let rank2 = Rank.ace
        let rank3 = Rank.two
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let cards = [card1, card2, card3]
        
        // When
        let nobs = Nobs(of: cards)
        
        // Then
        XCTAssert(nobs == nil)
    }
    
                                  //       //
                                  // Cards //
                                  //       //
    
    /// Tests that creating a `Nobs HandRank` without a `jack PlayingCard` returns nil.
    func test_init_withoutJack_returnsNil() {
        
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
        let nobs = Nobs(of: cards)
        
        // Then
        XCTAssert(nobs == nil)
    }
    
    /// Tests that creating a `Nobs HandRank` without a non-`jack PlayingCard` returns nil.
    func test_init_withoutNonJack_returnsNil() {
        
        // Given
        let rank = Rank.jack
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank, of: suit)!
        let card2 = PlayingCard(rank, of: suit)!
        let cards = [card1, card2]
        
        // When
        let nobs = Nobs(of: cards)
        
        // Then
        XCTAssert(nobs == nil)
    }

                                  //       //
                                  // Suits //
                                  //       //
    
    /// Tests that creating a `Nobs HandRank` with non-`jack PlayingCard` and a `jack`
    /// `PlayingCard` of a different `Suit` returns nil.
    func test_init_withDifferentSuits_returnsNil() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.jack
        let color = Color.black
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let suit1 = Suit(color, symbol1)
        let suit2 = Suit(color, symbol2)
        let card1 = PlayingCard(rank1, of: suit1)!
        let card2 = PlayingCard(rank2, of: suit2)!
        let cards = [card1, card2]
        
        // When
        let nobs = Nobs(of: cards)
        
        // Then
        XCTAssert(nobs == nil)
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    /// Tests that a `Nobs HandRank` has the expected title.
    func test_title_withNewNobs_isExpected() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.jack
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let nobs = Nobs(of: cards)!
        let expected = "Nobs"
        
        // When
        let actual = nobs.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that a `Nobs HandRank` has the expected points.
    func test_points_withNewNobs_isExpected() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.jack
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let nobs = Nobs(of: cards)!
        let expected = 1
        
        // When
        let actual = nobs.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
