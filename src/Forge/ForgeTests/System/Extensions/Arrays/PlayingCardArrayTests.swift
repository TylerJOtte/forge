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
    
    /// Tests that splitting all `NumeralCard`s by `Suit` has a count of four.
    func test_splitBySuit_AllNumeralCards_hasCountOfFour() throws {
        
        // Given
        let cards = try PlayingCards.getNumeralCards()
        let expected = 4
        
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
    
    /// Tests that splitting all `FaceCard`s by `Suit` has a count of four.
    func test_splitBySuit_AllFaceCards_hasCountOfFour() throws {
        
        // Given
        let cards = try PlayingCards.getFaceCards()
        let expected = 4
        
        // When
        let cardsBySuit = cards.splitBySuit()
        let actual = cardsBySuit.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //        //
    // Jokers //
    //        //

    /// Tests that splitting all`Joker`s  by `Suit` has a count of one.
    func test_splitBySuit_AllJokers_hasCountOfOne() throws {
        
        // Given
        let cards = try PlayingCards.getJokers()
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
    func test_splitBySuit_AllStandardPlayingCards_hasCountOfFour() throws {
        
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
    func test_splitBySuit_PlayingCardsWithOneSuitAndJokers_hasCountOfTwo() throws {
        
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
    func test_splitBySuit_AllPlayingCards_hasCountOfFive() throws {
        
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
    
    //-------------------------------------------------------------------------//
    //                            areEquallySuited()                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that `PlayingCards` with the same `Suit` are equally `Suit`ed.
    func test_areEquallySuited_PlayingCardsWithSameSuit_true() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let cards = [ace, two]
        
        // When/Then
        XCTAssert(cards.areEquallySuited())
    }
    
    /// Tests that `PlayingCards` with different `Suit`s are not equally `Suit`ed.
    func test_areEquallySuited_PlayingCardsWithDifferentSuits_false() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .spades)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.areEquallySuited())
    }
}
