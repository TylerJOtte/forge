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
    
    // Empty PlayingCards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` of empty `PlayingCards` does not contains other `Suit`s than the
    /// given `Suit`.
    func test_containsOtherSuit_withEmptyPlayingCardsAndSuit_false()
        throws {
        
        // Given
        let suit = Suit.hearts
        let cards: [PlayingCard] = []
        
        // When/Then
        XCTAssertFalse(cards.contain(other: suit))
    }
    
    // PlayingCards With One Suit //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` of `PlayingCards` with only one `Suit` does not contain a `Suit`
    /// other than a given `Suit` that equals the `PlayingCard`'s only `Suit`.
    func test_containsOtherSuit_withPlayingCardsOfOneSuitAndEqualSuit_false()
        throws {
        
        // Given
        let suit = Suit.hearts
        let ace = try Ace(of: suit)
        let two = try Two(of: suit)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.contain(other: suit))
    }
    
    /// Tests that a `Collection` of `PlayingCards` with only one `Suit` contains a `Suit` other
    /// than a given `Suit` that does not equal the `PlayingCard`'s only `Suit`.
    func test_containsOtherSuit_withPlayingCardsOfOneSuitAndInequalSuit_true()
        throws {
        
        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let ace = try Ace(of: suit1)
        let two = try Two(of: suit1)
        let cards = [ace, two]
        
        // When/Then
        XCTAssert(cards.contain(other: suit2))
    }
    
    // PlayingCards With Various Suits //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` of `PlayingCards` with various `Suit`s contains other `Suit`s
    /// than a given `Suit`.
    func test_containsOtherSuit_withPlayingCardsOfVariousSuitsAndSuit_true()
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
    
    // Empty PlayingCards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` of empty `PlayingCards` does not contain only the given `Suit`.
    func test_containsOnlySuit_withEmptyPlayingCardsAndSuit_false()
        throws {
        
        // Given
        let suit = Suit.hearts
        let cards: [PlayingCard] = []
        
        // When/Then
        XCTAssertFalse(cards.contain(only: suit))
    }
    
    // PlayingCards With One Suit //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` of `PlayingCards` with only one `Suit` contains only a given
    /// `Suit` that equals  the `PlayingCard`'s only `Suit`.
    func test_containsOnlySuit_withPlayingCardsOfOneSuitAndEqualSuit_true()
        throws {
        
        // Given
        let suit = Suit.hearts
        let ace = try Ace(of: suit)
        let two = try Two(of: suit)
        let cards = [ace, two]
        
        // When/Then
        XCTAssert(cards.contain(only: suit))
    }
    
    /// Tests that a `Collection` of `PlayingCards` with only one `Suit` does not contains a given
    /// `Suit` that does not equal the `PlayingCard`'s only `Suit`.
    func test_containsOnlySuit_withPlayingCardsOfOneSuitAndInequalSuit_false()
        throws {
        
        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let ace = try Ace(of: suit1)
        let two = try Two(of: suit1)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.contain(only: suit2))
    }
    
    // PlayingCards With Various Suits //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` of `PlayingCards` with various `Suit`s does not contain only a
    /// given `Suit`.
    func test_containsOnlySuit_withPlayingCardsOfVariousSuitsAndSuit_false()
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
    
    //                     //
    // Contains Only Suits //
    //                     //
    
    // Empty PlayingCards //
    // ~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` of empty `PlayingCards` does not only contain a given
    /// `Collection` of empty `Suit`s`.
    func test_containsOnlySuits_withEmptyPlayingCardsAndEmptySuits_false()
        throws {
        
        // Given
        let suits: [Suit] = []
        let cards: [PlayingCard] = []
        
        // When/Then
        XCTAssertFalse(cards.contain(only: suits))
    }
    
    /// Tests that a `Collection` of empty `PlayingCards` does not only contain a given
    /// `Collection` of `Suit`s`.
    func test_containsOnlySuits_withEmptyPlayingCardsAndSuits_false()
        throws {
        
        // Given
        let suits = [Suit.hearts, Suit.spades]
        let cards: [PlayingCard] = []
        
        // When/Then
        XCTAssertFalse(cards.contain(only: suits))
    }
    
    /// Tests that a `Collection` of `PlayingCards` does not only contain a given `Collection` of
    /// empty `Suit`s`.
    func test_containsOnlySuits_withPlayingCardsAndEmptySuits_false()
        throws {
        
        // Given
        let suits: [Suit] = []
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.contain(only: suits))
    }
    
    // PlayingCards With One Suit //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` of `PlayingCards` with only one `Suit` contains only a given
    /// `Collection` of `Suit`s where each `Suit` equals the `PlayingCard`'s only `Suit`.
    func test_containsOnlySuits_withPlayingCardsOfOneSuitAndEqualSuits_true()
        throws {
        
        // Given
        let suit = Suit.hearts
        let suits = [suit, suit]
        let ace = try Ace(of: suit)
        let two = try Two(of: suit)
        let cards = [ace, two]
        
        // When/Then
        XCTAssert(cards.contain(only: suits))
    }
    
    /// Tests that a `Collection` of `PlayingCards` with only one `Suit` does not only contain a
    /// given `Collection` of various `Suit`s.
    func test_containsOnlySuits_withPlayingCardsOfOneSuitAndVariousSuits_false()
        throws {
        
        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let ace = try Ace(of: suit1)
        let two = try Two(of: suit1)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.contain(only: suits))
    }
    
    // PlayingCards With Various Suits //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` of `PlayingCards` with various `Suit`s contains only a given
    /// `Collection` of various `Suit`s that equal the `Suit`s in the `PlayingCard`'s `Suit`s.
    func test_containsOnlySuits_withPlayingCardsOVariousAndEqualSuits_true()
        throws {
        
        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suits = [suit1, suit2]
        let ace = try Ace(of: suit1)
        let two = try Two(of: suit2)
        let cards = [ace, two]
        
        // When/Then
        XCTAssert(cards.contain(only: suits))
    }
    
    /// Tests that a `Collection` of `PlayingCards` with various `Suit`s does not only contain a
    /// given `Collection` of various `Suit`s that do not all equal the `Suit`s in the
    /// `PlayingCard`'s `Suit`s.
    func test_containsOnlySuits_withPlayingCardsOfVariousAndInequalSuits_false()
        throws {
        
        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suits = [suit1, suit2, suit3]
        let ace = try Ace(of: suit1)
        let two = try Two(of: suit2)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.contain(only: suits))
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                getSuits()                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving the `Suit`s in a `Collection` of `PlayingCard`s with duplicate `Suit`s
    /// returns a `Collection` of only the unique `Suit`s in the `PlayingCard`s.
    func test_getSuits_withPlayingCardsOfDuplicateSuits_returnsUniqueSuits()
        throws {
        
        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let ace = try Ace(of: suit1)
        let two = try Two(of: suit2)
        let three = try Three(of: suit1)
        let four = try Four(of: suit2)
        let playingCards = [ace, two, three, four]
        let expected = [suit1, suit2]
        
        // When
        let actual = playingCards.getSuits()
        
        // Then
        XCTAssertEqual(expected, actual)
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
