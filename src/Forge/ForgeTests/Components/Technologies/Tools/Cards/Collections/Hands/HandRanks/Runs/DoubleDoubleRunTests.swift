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
    //                               Failure                                   //
    //-------------------------------------------------------------------------//
    
                             //                   //
                             // Insuffcient Cards //
                             //                   //
    
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
    

}
