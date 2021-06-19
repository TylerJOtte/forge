//=============================================================================//
//                                                                             //
//  PlayingCardDeckTests.swift                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/04/21.                                       //
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
@testable import Forge

/// Unit tests for a `PlayingCardDeck`.
class PlayingDeckTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `PlayingCardDeck` created without `Joker`s equals
    /// "Playing Card Deck".
    func test_title_ofNewPlayingCardDeckWithoutJokers_equalsPlayingCardDeck()
        throws {
        
        // Given
        let playingCardDeck = try PlayingCardDeck()
        let expected = "Playing Card Deck"
        
        // When
        let actual = playingCardDeck.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `PlayingCardDeck` created with `Joker`s equals
    /// "Playing Card Deck".
    func test_title_ofNewPlayingCardDeckWithJokers_equalsPlayingCardDeck()
        throws {
        
        // Given
        let jokers = true
        let playingCardDeck = try PlayingCardDeck(with: jokers)
        let expected = "Playing Card Deck"
        
        // When
        let actual = playingCardDeck.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Success                                  //
    //-------------------------------------------------------------------------//
    
//    /// Tests that creating a`PlayingCardDeck` with `joker`s succeeds.
//    func test_init_withJokers_true() throws {
//
//        // Given
//        let jokers = true
//
//        // When
//        let actual = try PlayingCardDeck(with: jokers)
//
//        // Then
//        XCTAssert(actual != nil)
//    }
//
//    /// Tests that creating a`PlayingCardDeck` without `joker`s succeeds.
//    func test_init_withoutJokers_true() throws {
//
//        // Given
//        let jokers = false
//
//        // When
//        let actual = try PlayingCardDeck(with: jokers)
//
//        // Then
//        XCTAssert(actual != nil)
//    }
    
    //=========================================================================//
    //                               ATTRIBUTES                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
//    /// Tests that the count of a new`PlayingCardDeck` with `joker`s is 54.
//    func test_count_withJokers_equals54() throws {
//        
//        // Given
//        let jokers = true
//        let deck = try PlayingCardDeck(with: jokers)!
//        let expected = 54
//        
//        // When
//        let actual = deck.count
//        
//        // Then
//        XCTAssertEqual(expected, actual)
//    }
//    
//    /// Tests that the count of a new`PlayingCardDeck` without `joker`s is 52.
//    func test_count_withoutJokers_equals52() throws {
//        
//        // Given
//        let jokers = false
//        let deck = try PlayingCardDeck(with: jokers)!
//        let expected = 52
//        
//        // When
//        let actual = deck.count
//        
//        // Then
//        XCTAssertEqual(expected, actual)
//    }
}
