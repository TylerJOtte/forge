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

/// Unit tests for the `Fifteen HandRank`.
class FifteenTests: XCTestCase {
   
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                            Insufficient Cards                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Fifteen` with less than two`PlayingCards` throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withInsufficientCards_throwsError() throws {

        // Given
        let rank1 = Rank.ten
        let suit = Suit.clubs
        let card = PlayingCard(rank1, of: suit)!
        let cards = [card]
        let expected = ElementsError.insufficientElements
        
        // When
        XCTAssertThrowsError(try Fifteen(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                             Excessive Cards                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Fifteen` with more than five`PlayingCards` throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withExcessiveCards_returnsNil() throws {

        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.four
        let rank5 = Rank.five
        let rank6 = Rank.six
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let card6 = PlayingCard(rank6, of: suit)!
        let cards = [card1, card2, card3, card4, card5, card6]
        let expected = ElementsError.excessiveElements
        
        // When
        XCTAssertThrowsError(try Fifteen(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }

    //-------------------------------------------------------------------------//
    //                           Insufficient Points                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Fifteen HandRank` with `PlayingCard`s that have points that sum to
    /// less than 15 throws a `RewardsError.invalidPoints`.
    func test_init_withUnder15PointsSum_returnsNil() throws {
        
        // Given
        let rank1 = Rank.ten
        let rank2 = Rank.four
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let expected = RewardsError.invalidPoints
        
        // When
        XCTAssertThrowsError(try Fifteen(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? RewardsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                            Excessive Points                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Fifteen HandRank` with `PlayingCard`s that have points that sum to
    /// more than 15 throws a `RewardsError.invalidPoints`.
    func test_init_withOver15PointsSum_returnsNil() throws {
        
        // Given
        let rank1 = Rank.ten
        let rank2 = Rank.six
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        
        let expected = RewardsError.invalidPoints
        
        // When
        XCTAssertThrowsError(try Fifteen(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? RewardsError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the min cards  of a `Fifteen` equals two.
    func test_minCards_ofFifteen_equalsTwo() throws {
        
        // Given
        let rank1 = Rank.ten
        let rank2 = Rank.five
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let fifteen = try Fifteen(of: cards)
        let expected = 2
        
        // When
        let actual = fifteen.minCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards  of a `Fifteen` equals five.
    func test_maxCards_ofFifteen_equalsFive() throws {
        
        // Given
        let rank1 = Rank.ten
        let rank2 = Rank.five
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let fifteen = try Fifteen(of: cards)
        let expected = 5
        
        // When
        let actual = fifteen.maxCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a `Fifteen` equals the # of `PlayingCards` given.
    func test_count_ofFifteen_equalsNCardsGiven() throws {
        
        // Given
        let rank1 = Rank.one
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.four
        let rank5 = Rank.five
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let card4 = PlayingCard(rank4, of: suit)!
        let card5 = PlayingCard(rank5, of: suit)!
        let cards = [card1, card2, card3, card4, card5]
        let fifteen = try Fifteen(of: cards)
        let expected = 5
        
        // When
        let actual = fifteen.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a`Fifteen` equals "Fifteen".
    func test_title_ofFifteen_equalsFifteen() throws {
        
        // Given
        let rank1 = Rank.ten
        let rank2 = Rank.five
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let fifteen = try Fifteen(of: cards)
        let expected = "Fifteen"
        
        // When
        let actual = fifteen.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a `Fifteen` equals two.
    func test_points_ofFifteen_equalsTwo() throws {
        
        // Given
        let rank1 = Rank.ten
        let rank2 = Rank.five
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let fifteen = try Fifteen(of: cards)
        let expected = 2
        
        // When
        let actual = fifteen.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
