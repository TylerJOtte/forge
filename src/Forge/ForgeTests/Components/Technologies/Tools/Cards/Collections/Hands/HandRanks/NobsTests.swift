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

/// Unit tests for a `Nobs HandRank`.
class NobsTests: XCTestCase {
   
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                            Insufficient Cards                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating `Nobs` with less than two `PlayingCards` throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withInsufficientCards_throwsError() throws {
        
        // Given
        let rank = Rank.jack
        let suit = Suit.clubs
        let card = PlayingCard(rank, of: suit)!
        let cards = [card]
        let expected = ElementsError.insufficientElements

        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                             Excessive Cards                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating `Nobs` with more than two `PlayingCards` throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withExcessiveCards_throwsError() throws {
        
        // Given
        let rank1 = Rank.jack
        let rank2 = Rank.ace
        let rank3 = Rank.king
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let card3 = PlayingCard(rank3, of: suit)!
        let cards = [card1, card2, card3]
        let expected = ElementsError.excessiveElements

        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              Missing Cards                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating `Nobs` without a non-`jack PlayingCard` throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withoutNonJack_throwsError() throws {
        
        // Given
        let rank = Rank.jack
        let suit = Suit.clubs
        let card1 = PlayingCard(rank, of: suit)!
        let card2 = PlayingCard(rank, of: suit)!
        let cards = [card1, card2]
        let expected = ElementsError.insufficientElements

        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that creating`Nobs` without a `jack PlayingCard` throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withoutJack_throwsError() throws {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let expected = ElementsError.insufficientElements

        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }

    /// Tests that creating `Nobs` with multiple `Suit`s throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withDifferentSuits_throwsError() throws {
        
        // Given
        let rank1 = Rank.jack
        let rank2 = Rank.ace
        let suit1 = Suit.clubs
        let suit2 = Suit.spades
        let card1 = PlayingCard(rank1, of: suit1)!
        let card2 = PlayingCard(rank2, of: suit2)!
        let cards = [card1, card2]
        let expected = ElementsError.insufficientElements
        
        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
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
    
    /// Tests that the min cards  of `Nobs` equals two.
    func test_minCards_ofNobs_equalsTwo() throws {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.jack
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let nobs = try Nobs(of: cards)
        let expected = 2
        
        // When
        let actual = nobs.minCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards  of `Nobs` equals two.
    func test_maxCards_ofNobs_equalsTwo() throws {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.jack
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let nobs = try Nobs(of: cards)
        let expected = 2
        
        // When
        let actual = nobs.maxCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of `Nobs` equals two.
    func test_count_ofNobs_equalsTwo() throws {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.jack
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let nobs = try Nobs(of: cards)
        let expected = 2
        
        // When
        let actual = nobs.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of`Nobs` equals "Nobs".
    func test_title_ofNobs_equalsNobs() throws {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.jack
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let nobs = try Nobs(of: cards)
        let expected = "Nobs"
        
        // When
        let actual = nobs.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of `Nobs` equals one.
    func test_points_ofNobs_equalsOne() throws {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.jack
        let suit = Suit.clubs
        let card1 = PlayingCard(rank1, of: suit)!
        let card2 = PlayingCard(rank2, of: suit)!
        let cards = [card1, card2]
        let nobs = try Nobs(of: cards)
        let expected = 1
        
        // When
        let actual = nobs.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
