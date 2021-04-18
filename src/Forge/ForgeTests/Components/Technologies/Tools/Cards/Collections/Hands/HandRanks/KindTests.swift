//=============================================================================//
//                                                                             //
//  KindTests.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/18/21.                                       //
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
class KindTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                            Insufficient Cards                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Kind` with less than two`PlayingCards` throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withInsufficientCards_throwsError() throws {

        // Given
        let rank1 = Rank.ace
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank1, of: suit)!
        let cards = [card]
        let expected = ElementsError.insufficientElements
        
        // When
        XCTAssertThrowsError(try Kind(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                             Multiple Ranks                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Kind` with `PlayingCards`that do not all have the same `Rank` throws
    /// an `ElementsError.insufficientElements Error`.
    func test_init_withMultipleRanks_throwsError() throws {

        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let color = Color.black
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let suit1 = Suit(color, symbol1)
        let suit2 = Suit(color, symbol2)
        let card1 = PlayingCard(rank1, of: suit1)!
        let card2 = PlayingCard(rank2, of: suit2)!
        let cards = [card1, card2]
        let expected = ElementsError.insufficientElements
        
        // When
        XCTAssertThrowsError(try Kind(of: cards)) { error in
            
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
    
    /// Tests that the min cards  of a `Kind` equals two.
    func test_minCards_ofKind_equalsTwo() throws {

        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let suit1 = Suit(color, symbol1)
        let suit2 = Suit(color, symbol2)
        let card1 = PlayingCard(rank, of: suit1)!
        let card2 = PlayingCard(rank, of: suit2)!
        let cards = [card1, card2]
        let kind = try Kind(of: cards)
        let expected = 2
        
        // When
        let actual = kind.minCards
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards  of a `Kind` equals the system max
    func test_maxCards_ofKind_equalsSystemMax() throws {

        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let suit1 = Suit(color, symbol1)
        let suit2 = Suit(color, symbol2)
        let card1 = PlayingCard(rank, of: suit1)!
        let card2 = PlayingCard(rank, of: suit2)!
        let cards = [card1, card2]
        let kind = try Kind(of: cards)
        let expected = Int.max
        
        // When
        let actual = kind.maxCards
        
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a `Kind` equals the # of `PlayingCards` given.
    func test_count_ofKind_equalsNCardsGiven() throws {
        
        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let suit1 = Suit(color, symbol1)
        let suit2 = Suit(color, symbol2)
        let card1 = PlayingCard(rank, of: suit1)!
        let card2 = PlayingCard(rank, of: suit2)!
        let cards = [card1, card2]
        let kind = try Kind(of: cards)
        let expected = 2
        
        // When
        let actual = kind.count
        
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Kind` with two `Card`s equals "Pair".
    func test_title_withTwoCards_equalsPair() throws {
        
        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let suit1 = Suit(color, symbol1)
        let suit2 = Suit(color, symbol2)
        let card1 = PlayingCard(rank, of: suit1)!
        let card2 = PlayingCard(rank, of: suit2)!
        let cards = [card1, card2]
        let kind = try Kind(of: cards)
        let expected = "Pair"
        
        // When
        let actual = kind.title
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Kind` with three`Card`s equals "3 Of A Kind".
    func test_title_withThreeCards_equalsThreeOfAKind() throws {
        
        // Given
        let rank = Rank.ace
        let color1 = Color.black
        let color2 = Color.red
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let symbol3 = Symbol.diamond
        let suit1 = Suit(color1, symbol1)
        let suit2 = Suit(color1, symbol2)
        let suit3 = Suit(color2, symbol3)
        let card1 = PlayingCard(rank, of: suit1)!
        let card2 = PlayingCard(rank, of: suit2)!
        let card3 = PlayingCard(rank, of: suit3)!
        let cards = [card1, card2, card3]
        let kind = try Kind(of: cards)
        let expected = "3 Of A Kind"
        
        // When
        let actual = kind.title
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Kind` with four`Card`s equals "4 Of A Kind".
    func test_title_withFourCards_equalsFourOfAKind() throws {
        
        // Given
        let rank = Rank.ace
        let color1 = Color.black
        let color2 = Color.red
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let symbol3 = Symbol.diamond
        let symbol4 = Symbol.heart
        let suit1 = Suit(color1, symbol1)
        let suit2 = Suit(color1, symbol2)
        let suit3 = Suit(color2, symbol3)
        let suit4 = Suit(color2, symbol4)
        let card1 = PlayingCard(rank, of: suit1)!
        let card2 = PlayingCard(rank, of: suit2)!
        let card3 = PlayingCard(rank, of: suit3)!
        let card4 = PlayingCard(rank, of: suit4)!
        let cards = [card1, card2, card3, card4]
        let kind = try Kind(of: cards)
        let expected = "4 Of A Kind"
        
        // When
        let actual = kind.title
        
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the points of  a`Kind`with the two `PlayingCard`s equals two.
    func test_points_withTwoCards_equalsTwo() throws {
        
        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let suit1 = Suit(color, symbol1)
        let suit2 = Suit(color, symbol2)
        let card1 = PlayingCard(rank, of: suit1)!
        let card2 = PlayingCard(rank, of: suit2)!
        let cards = [card1, card2]
        let kind = try Kind(of: cards)
        let expected = 2
        
        // When
        let actual = kind.points
        
        XCTAssertEqual(expected, actual)
    }
    
}
