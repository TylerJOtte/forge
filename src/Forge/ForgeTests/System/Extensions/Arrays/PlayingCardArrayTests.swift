//=============================================================================//
//                                                                             //
//  PlayingCardArrayTests.swift                                                //
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

/// Unit tests for a `PlayingCard Array`.
class PlayingCardArrayTests: XCTestCase {
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              splitBySuit()                              //
    //-------------------------------------------------------------------------//
    
    //              //
    // NumeralCards //
    //              //
    
    /// Tests that splitting all`NumeralCard`s with one `Suit` by `Suit` has a count of one.
    func test_splitBySuit_NumeralCardsWithOneSuit_hasCountOfOne() throws {
        
        // Given
        let cards = try PlayingCards.getNumeralCards(with: .hearts)
        let expected = 1
        
        // When
        let cardsBySuit = cards.splitBySuit()
        let actual = cardsBySuit.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //           //
    // FaceCards //
    //           //

    /// Tests that splitting all`FaceCard`s with one `Suit` by `Suit` has a count of one.
    func test_splitBySuit_FaceCardsWithOneSuit_hasCountOfOne() throws {
        
        // Given
        let cards = try PlayingCards.getFaceCards(with: .hearts)
        let expected = 1
        
        // When
        let cardsBySuit = cards.splitBySuit()
        let actual = cardsBySuit.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                       //
    // Standard PlayingCards //
    //                       //
    
    /// Tests that splitting all standard `PlayingCard`s with one `Suit` by `Suit` has a count of one.
    func test_splitBySuit_StandardPlayingCardsWithOneSuit_hasCountOfOne() throws {
        
        // Given
        let cards = try PlayingCards.getCards(with: .hearts)
        let expected = 1
        
        // When
        let cardsBySuit = cards.splitBySuit()
        let actual = cardsBySuit.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting all standard `PlayingCard`s by `Suit` has a count of four.
    func test_splitBySuit_StandardPlayingCards_hasCountOfFour() throws {
        
        // Given
        let cards = try PlayingCards.getCards()
        let expected = 4
        
        // When
        let cardsBySuit = cards.splitBySuit()
        let actual = cardsBySuit.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //                  //
    // All PlayingCards //
    //                  //
    
    /// Tests that splitting all `PlayingCard`s with one `Suit`and `Jokers` by `Suit` has a count of
    /// two.
    func test_splitBySuit_PlayingCardsWithOneSuitAndJOkers_hasCountOfTwo() throws {
        
        // Given
        let jokers = true
        let cards = try PlayingCards.getCards(with: .hearts, include: jokers)
        let expected = 2
        
        // When
        let cardsBySuit = cards.splitBySuit()
        let actual = cardsBySuit.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting all `PlayingCard`s by `Suit` has a count of five.
    func test_splitBySuit_PlayingCards_hasCountOfFour() throws {
        
        // Given
        let jokers = true
        let cards = try PlayingCards.getCards(include: jokers)
        let expected = 5
        
        // When
        let cardsBySuit = cards.splitBySuit()
        let actual = cardsBySuit.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
