//=============================================================================//
//                                                                             //
//  PlayingCardCollectionTests.swift                                           //
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

/// Unit tests for a `PlayingCard Collection`.
class PlayingCardCollectionTests: XCTestCase {
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                            areEquallySuited()                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Collection` of `PlayingCards` that all contain the same `Suit` are equally
    /// `Suit`ed.
    func test_areEquallySuited_PlayingCardsThatAllContainSameSuit_true() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let cards = [ace, two]
        
        // When/Then
        XCTAssert(cards.areEquallySuited())
    }
    
    /// Tests that a `Collection` of `PlayingCards` with varioius `Suit`s are not equally
    /// `Suit`ed.
    func test_areEquallySuited_PlayingCardsWithVariousSuits_false() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .spades)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.areEquallySuited())
    }
    
    //-------------------------------------------------------------------------//
    //                                contains()                               //
    //-------------------------------------------------------------------------//
    
    //                     //
    // Contains Other Suit //
    //                     //
    
    /// Tests that a `Collection` of empty `PlayingCards` does not contains other `Suit`s than the
    /// given `Suit`.
    func test_containsOtherSuit_withEmptyPlayingCardsAndGivenSuit_false()
        throws {
        
        // Given
        let suit = Suit.hearts
        let cards: [PlayingCard] = []
        
        // When/Then
        XCTAssertFalse(cards.contain(other: suit))
    }
    
    /// Tests that a `Collection` of `PlayingCards` with only one `Suit` does not contain `Suit`
    /// other than the given `Suit`.
    func test_containsOtherSuit_withPlayingCardsOfOneSuitAndSameGivenSuit_false()
        throws {
        
        // Given
        let suit = Suit.hearts
        let ace = try Ace(of: suit)
        let two = try Two(of: suit)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.contain(other: suit))
    }
    
    /// Tests that a `Collection` of `PlayingCards` with various `Suit`s contains other `Suit`s
    /// than the given `Suit`.
    func test_containsOtherSuit_withPlayingCardsOfVariousSuitsAndGivenSuit_true()
        throws {
        
        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let ace = try Ace(of: suit1)
        let two = try Two(of: suit2)
        let cards = [ace, two]
        
        // When/Then
        XCTAssert(cards.contain(other: suit1))
    }
    
    //                    //
    // Contains Only Suit //
    //                    //
    
    /// Tests that a `Collection` of empty `PlayingCards` does not only the given `Suit`.
    func test_containsOnlySuit_withEmptyPlayingCardsAndGivenSuit_false()
        throws {
        
        // Given
        let suit = Suit.hearts
        let cards: [PlayingCard] = []
        
        // When/Then
        XCTAssertFalse(cards.contain(only: suit))
    }
    
    /// Tests that a `Collection` of `PlayingCards` with only one `Suit` contains only that given
    /// `Suit`.
    func test_containsOnlySuit_withPlayingCardsOfOneSuitAndSameGivenSuit_true()
        throws {
        
        // Given
        let suit = Suit.hearts
        let ace = try Ace(of: suit)
        let two = try Two(of: suit)
        let cards = [ace, two]
        
        // When/Then
        XCTAssert(cards.contain(only: suit))
    }
    
    /// Tests that a `Collection` of `PlayingCards` with various `Suit`s does not contain only one
    /// given `Suit`.
    func test_containsOnlySuit_withPlayingCardsOfVariousSuitsAndGivenSuit_false()
        throws {
        
        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let ace = try Ace(of: suit1)
        let two = try Two(of: suit2)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.contain(only: suit1))
    }
    
    //=========================================================================//
    //                                SPLITTERS                                //
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
        let cards = try PlayingCards.getStandardCards(with: .hearts)
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
        let cards = try PlayingCards.getStandardCards()
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
        let cards = try PlayingCards.getAllCards(with: .hearts)
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
        let cards = try PlayingCards.getAllCards()
        let expected = 5
        
        // When
        let cardsBySuit = cards.splitBySuit()
        let actual = cardsBySuit.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
