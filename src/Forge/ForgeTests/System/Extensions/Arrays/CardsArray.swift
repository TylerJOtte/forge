//=============================================================================//
//                                                                             //
//  CardsArrayTests.swift                                                      //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/12/21.                                       //
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

/// Unit tests for a `Cards Array`.
class CardsArrayTests: XCTestCase {
 
    //=========================================================================//
    //                               CALCULATORS                               //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               sumCounts()                               //
    //-------------------------------------------------------------------------//
    
    //       //
    // Cards //
    //       //
    
    /// Tests that summing all the counts of a `Cards Array` with zero elements equals zero.
    func test_sumCounts_ofEmptyArray_equalsZero() throws {
        
        // Given
        let cards: [Hand] = []
        let expected = 0
        
        // When
        let actual = cards.sumCounts()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //       //
    // Hands //
    //       //
    
    /// Tests that summing all the counts  in a `Hand Array` equals an expected value.
    func test_sumCounts_ofHandArray_equalsExpected() {
        
        // Given
        let card = Card(named: "Card 1")
        let cards = [card]
        let hand1 = Hand(of: cards)
        let hand2 = Hand(of: cards)
        let hands = [hand1, hand2]
        let expected = 2
        
        // When
        let actual = hands.sumCounts()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //       //
    // Decks //
    //       //
    
    /// Tests that summing the counts of an`Array` that contains two `PlayingCardDeck`s without
    /// `Joker`s equals 104.
    func test_sumCounts_ofTwoPlayingCardDecksWithoutJokers_equals104() throws {
        
        // Given
        let deck1 = try PlayingCardDeck()
        let deck2 = try PlayingCardDeck()
        let decks = [deck1, deck2]
        let expected = 104
        
        // When
        let actual = decks.sumCounts()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the counts of an`Array` that contains two `PlayingCardDeck`s with
    /// `Joker`s equals 108.
    func test_sumCounts_ofTwoPlayingCardDecksWithJokers_equals108() throws {
        
        // Given
        let jokers = true
        let deck1 = try PlayingCardDeck(with: jokers)
        let deck2 = try PlayingCardDeck(with: jokers)
        let decks = [deck1, deck2]
        let expected = 108
        
        // When
        let actual = decks.sumCounts()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the counts of an`Array` that contains a `PlayingCardDeck` with
    /// `Joker`s and another without equals 106.
    func test_sumCounts_ofTwoPlayingCardDecksWithAndWithoutJokers_equals106() throws {
        
        // Given
        let jokers = true
        let deck1 = try PlayingCardDeck()
        let deck2 = try PlayingCardDeck(with: jokers)
        let decks = [deck1, deck2]
        let expected = 106
        
        // When
        let actual = decks.sumCounts()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //           //
    // HandRanks //
    //           //
    
    // Pairs //
    
    /// Tests that summing the counts of an`Array` that contains one `Pair` equals two.
    func test_sumCounts_ofOnePairArray_equalsTwo() throws {
        
        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let cards = [ace1, ace2]
        let pair = try Pair(of: cards)
        let pairs = [pair]
        let expected = 2
        
        // When
        let actual = pairs.sumCounts()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the counts of an`Array` that contains two `Pair`s equals four.
    func test_sumCounts_ofTwoPairArray_equalsFour() throws {
        
        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let ace4 = try Ace(of: .clubs)
        let pairCards1 = [ace1, ace2]
        let pairCards2 = [ace3, ace4]
        let pair1 = try Pair(of: pairCards1)
        let pair2 = try Pair(of: pairCards2)
        let pairs = [pair1, pair2]
        let expected = 4
        
        // When
        let actual = pairs.sumCounts()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // ThreeOfAKinds //
    
    /// Tests that summing the counts of an`Array` that contains one `ThreeOfAKind` equals three.
    func test_sumCounts_ofOneThreeOfAKindArray_equalsThree() throws {
        
        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let cards = [ace1, ace2, ace3]
        let kind = try ThreeOfAKind(of: cards)
        let kinds = [kind]
        let expected = 3
        
        // When
        let actual = kinds.sumCounts()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the counts of an`Array` that contains two `ThreeOfAKind`s equals six.
    func test_sumCounts_ofTwoThreeOfAKindArray_equalsSix() throws {
        
        // Given
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .spades)
        let king3 = try King(of: .diamonds)
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .spades)
        let ace3 = try Ace(of: .diamonds)
        let cards1 = [king1, king2, king3]
        let cards2 = [ace1, ace2, ace3]
        let kind1 = try ThreeOfAKind(of: cards1)
        let kind2 = try ThreeOfAKind(of: cards2)
        let kinds = [kind1, kind2]
        let expected = 6
        
        // When
        let actual = kinds.sumCounts()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
