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

    //               //
    // Contains Rank //
    //               //
    
    /// Tests that a `Collection` of `PlayingCards` contains  a given `Rank`.
    func test_contains_rank_true() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let cards = [ace, two, ten]
        
        // When/Then
        XCTAssertTrue(cards.contains(.ten))
    }
    
    /// Tests that a `Collection` of `PlayingCards` does not contain a given `Rank`.
    func test_contains_rank_false() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let cards = [ace, two, ten]
        
        // When/Then
        XCTAssertFalse(cards.contains(.jack))
    }
    
    // Jokers //
    // ~~~~~~ //
    
    /// Tests that a `Collection` of `PlayingCards` with a `Joker` contains `Joker`s.
    func test_containJokers_withHandIncludingJoker_true() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let joker = Joker(color: .red)
        let cards = [ace, two, ten, joker]
        
        // When/Then
        XCTAssertTrue(cards.containJokers())
    }
    
    /// Tests that a `Collection` of `PlayingCards` without `Joker`s does not contain `Joker`s.
    func test_containJokers_withHandNotIncludingJoker_false() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let cards = [ace, two, ten]
        
        // When/Then
        XCTAssertFalse(cards.containJokers())
    }
    
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
    func test_containsOnlySuits_withPlayingCardsOfVariousAndEqualSuits_true()
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
    func test_getSuits_withDuplicateSuits_returnsUniqueSuits() throws {
        
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
        XCTAssert(actual.contains(only: expected))
    }
    
    //-------------------------------------------------------------------------//
    //                                   first()                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving the first `PlayingCard` with a given `Rank` and `Suit`in a collection that
    /// contains it returns the expected `Card`.
    func test_first_rankOfSuit_returnsExpectedCard() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let cards = [ace, two, ten]
        let expected = ten
        
        // When
        let actual = cards.first(.ten, of: .hearts)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the first `PlayingCard` with a given `Rank` and `Suit` in a collection that
    /// does not contain it returns `nil`.
    func test_first_rankOfSuit_returnsNil() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let ten = try Ten(of: .hearts)
        let cards = [ace, two, ten]
        
        // When
        let actual = cards.first(.king, of: .hearts)
        
        // Then
        XCTAssertNil(actual)
    }
    
    /// Tests that retrieving the first `Jack` with a given `Suit` in a collection that contains it returns the
    /// expected `Card`.
    func test_firstJack_ofSuit_returnsExpectedCard() throws {
        
        // Given
        let four = try Four(of: .hearts)
        let five = try Five(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [four, five, jack]
        let expected = jack
        
        // When
        let actual = cards.firstJack(of: .hearts)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the first `Jack` with a given `Suit` in a collection that does not contains it
    /// returns `nil`.
    func test_firstJack_ofSuit_returnsNil() throws {
        
        // Given
        let four = try Four(of: .hearts)
        let five = try Five(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [four, five, jack]
        
        // When
        let actual = cards.firstJack(of: .diamonds)
        
        // Then
        XCTAssertNil(actual)
    }
    
    //=========================================================================//
    //                                SPLITTERS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              splitBySuit()                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that splitting a `Collection` of `PlayingCard`s with duplicate `Suit`s by `Suit`
    /// returns a `Collection` of only the unique `Suit`s in the `PlayingCard`s.
    func test_splitBySuit_withDuplicateSuits_returnsUniqueSuits() throws {
        
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
        let cards = playingCards.splitBySuit()
        let actual = cards.allKeys
        
        // Then
        XCTAssert(actual.contains(only: expected))
    }
    
    /// Tests that splitting a `Collection` of `PlayingCard`s with a duplicate `Suit` by `Suit`
    /// returns a `Collection` with the expected `PlayingCard` for the duplicate `Suit`.
    func test_splitBySuit_withDuplicateSuit_returnsExpectedDuplicateCards()
        throws {
        
        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.spades
        let suit3 = Suit.diamonds
        let suit4 = Suit.clubs
        let ace = try Ace(of: suit1)
        let two = try Two(of: suit2)
        let three = try Three(of: suit3)
        let four = try Four(of: suit3)
        let five = try Five(of: suit4)
        let playingCards = [ace, two, three, four, five]
        let expected = [three, four]
        
        // When
        let cards = playingCards.splitBySuit()
        if let actual = cards[suit3] {
        
            // Then
            XCTAssert(actual.contains(only: expected))
        }
    }
}
