//=============================================================================//
//                                                                             //
//  SuitExtensionTests.swift                                                   //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/16/21.                                       //
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

/// Unit tests for a `PlayingCard Suit`.
class SuitExtensionTests: XCTestCase {
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                  isRed                                  //
    //-------------------------------------------------------------------------//
    
    //              //
    // PlayingCards //
    //              //
    
    /// Tests that a `hearts Suit` is a `red PlayingCard Suit`.
    func test_hearts_isRed_true() {
        
        // Given
        let suit = Suit.hearts
        
        // When/Then
        XCTAssert(suit.isRed())
    }
    
    /// Tests that a `diamonds Suit` is a `red PlayingCard Suit`.
    func test_diamonds_isRed_true() {
        
        // Given
        let suit = Suit.diamonds
        
        // When/Then
        XCTAssert(suit.isRed())
    }
    
    /// Tests that a `clubs Suit` is not a `red PlayingCard Suit`.
    func test_clubs_isRed_false() {
        
        // Given
        let suit = Suit.clubs
        
        // When/Then
        XCTAssertFalse(suit.isRed())
    }
    
    /// Tests that a `spades Suit` is not a `red PlayingCard Suit`.
    func test_spades_isRed_false() {
        
        // Given
        let suit = Suit.spades
        
        // When/Then
        XCTAssertFalse(suit.isRed())
    }
    
    /// Tests that a `null Suit` is not a `red PlayingCard Suit`.
    func test_null_isRed_false() {
        
        // Given
        let suit = Suit.null
        
        // When/Then
        XCTAssertFalse(suit.isRed())
    }
    
    //                 //
    // Non-PlayingCard //
    //                 //
    
    /// Tests that a non-`PlayingCard Suit` is not a `red PlayingCard Suit`.
    func test_nonPlayingCardSuit_isRed_false() {
        
        // Given
        let suit = Suit.stars
        
        // When/Then
        XCTAssertFalse(suit.isRed())
    }
    
    //-------------------------------------------------------------------------//
    //                                 isBlack                                 //
    //-------------------------------------------------------------------------//
    
    //              //
    // PlayingCards //
    //              //
    
    /// Tests that a `clubs Suit` is a `black PlayingCard Suit`.
    func test_clubs_isBlack_true() {
        
        // Given
        let suit = Suit.clubs
        
        // When/Then
        XCTAssert(suit.isBlack())
    }
    
    /// Tests that a `spades Suit` is a `black PlayingCard Suit`.
    func test_spades_isBlack_true() {
        
        // Given
        let suit = Suit.spades
        
        // When/Then
        XCTAssert(suit.isBlack())
    }
    
    /// Tests that a `hearts Suit` is not a `black PlayingCard Suit`.
    func test_hearts_isBlack_false() {
        
        // Given
        let suit = Suit.hearts
        
        // When/Then
        XCTAssertFalse(suit.isBlack())
    }
    
    /// Tests that a `diamonds Suit` is not a `black PlayingCard Suit`.
    func test_diamonds_isBlack_false() {
        
        // Given
        let suit = Suit.diamonds
        
        // When/Then
        XCTAssertFalse(suit.isBlack())
    }
    
    /// Tests that a `null Suit` is not a `black PlayingCard Suit`.
    func test_null_isBlack_false() {
        
        // Given
        let suit = Suit.null
        
        // When/Then
        XCTAssertFalse(suit.isBlack())
    }
    
    //                 //
    // Non-PlayingCard //
    //                 //
    
    /// Tests that a non-`PlayingCard Suit` is not a `black PlayingCard Suit`.
    func test_nonPlayingCardSuit_isBlack_false() {
        
        // Given
        let suit = Suit.stars
        
        // When/Then
        XCTAssertFalse(suit.isBlack())
    }
    
}
