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

/// Unit tests for the `PlayingCardDeck` class.
class PlayingDeckTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Success                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a`PlayingCardDeck` with `joker`s succeeds.
    func test_init_withJokers_true() {
        
        // Given
        let jokers = true
        
        // When
        let actual = PlayingCardDeck(with: jokers)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCardDeck` without `joker`s succeeds.
    func test_init_withoutJokers_true() {
        
        // Given
        let jokers = false
        
        // When
        let actual = PlayingCardDeck(with: jokers)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    //=========================================================================//
    //                               ATTRIBUTES                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a new`PlayingCardDeck` with `joker`s is 54.
    func test_count_withJokers_equals54() {
        
        // Given
        let jokers = true
        let deck = PlayingCardDeck(with: jokers)!
        let expected = 54
        
        // When
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the count of a new`PlayingCardDeck` without `joker`s is 52.
    func test_count_withoutJokers_equals52() {
        
        // Given
        let jokers = false
        let deck = PlayingCardDeck(with: jokers)!
        let expected = 52
        
        // When
        let actual = deck.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
