//=============================================================================//
//                                                                             //
//  FifteenTests.swift                                                         //
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

/// Unit tests for the `Fifteen` class.
class FifteenTests: XCTestCase {
   
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Success                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Fifteen HandRank` with `PlayingCard`s that have points that sum to 15
    /// succeeds.
    func test_init_with15PointsSum_succeeds() {
        
        // Given
        let rank1 = Rank.ten
        let rank2 = Rank.five
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        
        // When
        let fifteen = Fifteen(of: cards)
        
        // Then
        XCTAssert(fifteen != nil)
    }
    
    //-------------------------------------------------------------------------//
    //                               Failure                                   //
    //-------------------------------------------------------------------------//
    
                                   //       //
                                   // Count //
                                   //       //

    /// Tests that creating a `Fifteen HandRank` with less than two `PlayingCards` returns nil.
    func test_init_withInsufficientCards_returnsNil() {

        // Given
        let rank = Rank.ten
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let cards = [card]
        
        // When
        let fifteen = Fifteen(of: cards)
        
        // Then
        XCTAssert(fifteen == nil)
    }

                               //            //
                               // Points Sum //
                               //            //
    
    /// Tests that creating a `Fifteen HandRank` with `PlayingCard`s that have points that sum to
    /// less than 15 returns nil.
    func test_init_withUnder15PointsSum_returnsNil() {
        
        // Given
        let rank1 = Rank.ten
        let rank2 = Rank.four
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        
        // When
        let fifteen = Fifteen(of: cards)
        
        // Then
        XCTAssert(fifteen == nil)
    }
    
    /// Tests that creating a `Fifteen HandRank` with `PlayingCard`s that have points that sum to
    /// over 15 returns nil.
    func test_init_withOver15PointsSum_returnsNil() {
        
        // Given
        let rank1 = Rank.ten
        let rank2 = Rank.six
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        
        // When
        let fifteen = Fifteen(of: cards)
        
        // Then
        XCTAssert(fifteen == nil)
    }
}
