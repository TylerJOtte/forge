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
        let cards: [Hand<Card>] = []
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
    func test_sumCounts_ofHandArray_equalsExpected() throws {
        
        // Given
        let card = Card(named: "Card 1")
        let cards = [card]
        let hand1 = try Hand(of: cards)
        let hand2 = try Hand(of: cards)
        let hands = [hand1, hand2]
        let expected = 3
        
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
}
    
