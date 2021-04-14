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
    
                                   //       //
                                   // Count //
                                   //       //

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
}
