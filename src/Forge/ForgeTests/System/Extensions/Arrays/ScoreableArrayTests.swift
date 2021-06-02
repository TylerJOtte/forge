//=============================================================================//
//                                                                             //
//  ScoreableArrayTests.swift                                                  //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/02/21.                                       //
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

/// Unit tests for a `Scoreable Array`.
class ScoreableArrayTests: XCTestCase {
 
    //=========================================================================//
    //                               CALCULATORS                               //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               sumPoints()                               //
    //-------------------------------------------------------------------------//
    
    //              //
    // NumeralCards //
    //              //
    
    /// Tests that summing the points of all `NumeralCard`s with a `Suit` equals 55.
    func test_sumPoints_ofNumeralCardsWithSuit_equals50() throws {
        
        // Given
        let cards = try PlayingCards.getNumeralCards(with: .hearts)
        let expected = 55
        
        // When
        let actual = cards.sumPoints()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //           //
    // FaceCards //
    //           //

    /// Tests that summing the points of all `FaceCard`s with a `Suit` equals 30.
    func test_sumPoints_ofFaceCardsWithSuit_equals30() throws {
        
        // Given
        let cards = try PlayingCards.getFaceCards(with: .hearts)
        let expected = 30
        
        // When
        let actual = cards.sumPoints()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                       //
    // Standard PlayingCards //
    //                       //
    
    /// Tests that summing the points of all standard `PlayingCard`s  with a `Suit` equals 85.
    func test_sumPoints_ofStandardPlayingCardsWithSuit_equals85() throws {
        
        // Given
        let cards = try PlayingCards.getCards(with: .hearts)
        let expected = 85
        
        // When
        let actual = cards.sumPoints()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the points of all standard `PlayingCard`s  with all `Suit` equals 340.
    func test_sumPoints_ofStandardPlayingCardsWithAllSuits_equals340() throws {
        
        // Given
        let cards = try PlayingCards.getCards()
        let expected = 340
        
        // When
        let actual = cards.sumPoints()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                  //
    // All PlayingCards //
    //                  //
    
    /// Tests that summing the points of all `PlayingCard`s with a `Suit` and `Jokers` equals 85.
    func test_sumPoints_ofPlayingCardsWithJokers_equals85() throws {
        
        // Given
        let jokers = true
        let cards = try PlayingCards.getCards(with: .hearts, include: jokers)
        let expected = 85
        
        // When
        let actual = cards.sumPoints()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the points of all `PlayingCard`s  with all `Suit` and `Jokers` equals 340.
    func test_sumPoints_ofPlayingCardsWithAllSuitsAndJOkers_equals340() throws {
        
        // Given
        let jokers = true
        let cards = try PlayingCards.getCards(include: jokers)
        let expected = 340
        
        // When
        let actual = cards.sumPoints()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
