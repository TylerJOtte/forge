//=============================================================================//
//                                                                             //
//  FlushTests.swift                                                           //
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

/// Unit tests for a `Flush HandRank`.
class FlushTests: XCTestCase {
   
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Success                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Flush HandRank` with `PlayingCard`s that all have the same `Suit`
    /// succeeds.
    func test_init_withSameSuit_succeeds() {
        
        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.four
        let rank5 = Rank.five
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
        
        // When
        let flush = Flush(of: cards)
        
        // Then
        XCTAssert(flush != nil)
    }
    
    //-------------------------------------------------------------------------//
    //                               Failure                                   //
    //-------------------------------------------------------------------------//
    
                                   //       //
                                   // Count //
                                   //       //

    /// Tests that creating a `Flush HandRank` with less than four `PlayingCards` returns nil.
    func test_init_withInsufficientCards_returnsNil() {

        // Given
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
        
        // When
        let flush = Flush(of: cards)
        
        // Then
        XCTAssert(flush == nil)
    }
    
    /// Tests that creating a `Flush HandRank` with more than five `PlayingCards` returns nil.
    func test_init_withExcessiveCards_returnsNil() {

        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.four
        let rank5 = Rank.five
        let rank6 = Rank.six
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
        
        // When
        let flush = Flush(of: cards)
        
        // Then
        XCTAssert(flush == nil)
    }
}
