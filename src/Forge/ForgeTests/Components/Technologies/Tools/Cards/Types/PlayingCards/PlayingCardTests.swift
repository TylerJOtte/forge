//=============================================================================//
//                                                                             //
//  PlayingCardTests.swift                                                     //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/15/21.                                       //
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

/// Unit tests for a `PlayingCard`.
class PlayingCardTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `PlayingCard` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.stars
        let points = 1
        let position = 11
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //                        //
    // Joker & non-null Suits //
    //                        //
    
    /// Tests that creating a `PlayingCard` with a `hearts PlayingCard Suit` and a `joker`
    /// `PlayingCard Rank` throws an `invalidSuit Error`.
    func test_init_withHeartsAndJoker_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.joker
        let suit = Suit.hearts
        let points = 0
        let position = 0
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a `PlayingCard` with a `diamonds PlayingCard Suit` and a `joker`
    /// `PlayingCard Rank` throws an `invalidSuit Error`.
    func test_init_withDiamondsAndJoker_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.joker
        let suit = Suit.diamonds
        let points = 0
        let position = 0
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a `PlayingCard` with a `clubs PlayingCard Suit` and a `joker`
    /// `PlayingCard Rank` throws an `invalidSuit Error`.
    func test_init_withClubsAndJoker_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.joker
        let suit = Suit.clubs
        let points = 0
        let position = 0
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a `PlayingCard` with a `spades PlayingCard Suit` and a `joker`
    /// `PlayingCard Rank` throws an `invalidSuit Error`.
    func test_init_withSpadesAndJoker_throwsInvalidSuit() throws {

        // Given
        let rank = Rank.joker
        let suit = Suit.spades
        let points = 0
        let position = 0
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              Invalid Ranks                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `PlayingCard` with a non-standard`PlayingCard Rank` throws an
    /// `invalidRank Error`.
    func test_init_withNonStandardPlayingCardRank_throwsInvalidRank() throws {

        // Given
        let rank = Rank.one
        let suit = Suit.hearts
        let points = 1
        let position = 1
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                            Invalid Positions                            //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `PlayingCard` with a position less than zero throws an
    /// `invalidPosition Error`.
    func test_init_withPositionLessThanZero_throwsInvalidPositionError() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = -1
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    /// Tests that creating a `FaceCard` with a position greater than 14 throws an `invalidPosition`
    /// `Error`.
    func test_init_withPositionGreaterThan14_throwsInvalidPosition() throws {

        // Given
        let rank = Rank.ace
        let suit = Suit.hearts
        let points = 1
        let position = 15
        let expected = RangeError.invalidPosition

        // When
        XCTAssertThrowsError(try PlayingCard(rank, of: suit, worth: points,
                                             at: position)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //=========================================================================//
    //                               TESTERS                                   //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `PlayingCard` with a lesser position  is less than another `PlayingCard` with a
    /// greater position.
    func test_isLessThan_PlayingCardWithLesserPosition_true() throws {
     
        // Given
        let lowAce = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let highAce = try PlayingCard(.ace, of: .hearts, worth: 1, at: 13)
        
        // When/Then
        XCTAssert(lowAce.isLessThan(highAce))
    }
    
    /// Tests that a `RankedCard` with a lesser position  is less than another `RakedCard` with a greater
    /// position, using the less than operator.
    func test_isLessThan_RankedCardWithLesserPositionUsingOperator_true()
        throws {
     
        // Given
        let lowAce = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let highAce = try PlayingCard(.ace, of: .hearts, worth: 1, at: 13)
        
        // When/Then
        XCTAssertLessThan(lowAce, highAce)
    }
    
    //-------------------------------------------------------------------------//
    //                                  ==                                     //
    //-------------------------------------------------------------------------//

    /// Tests that two `PlayingCard`s with the same `Rank` and `Suit` are equal.
    func test_equals_PlayingCardWithSameRankAndSuit_true() throws {
     
        // Given
        let ace1 = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let ace2 = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        
        // When/Then
        XCTAssert(ace1.equals(ace2))
    }
    
    /// Tests that two `PlayingCard`s with the same `Rank` and `Suit` are equal, using the equality
    /// operator.
    func test_equals_PlayingCardWithSameRankAndSuitUsingOperator_true()
        throws {
     
        // Given
        let ace1 = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let ace2 = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        
        // When/Then
        XCTAssertEqual(ace1, ace2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  !=                                     //
    //-------------------------------------------------------------------------//

    /// Tests that two `PlayingCard`s with the same `Rank` and different `Suit`s are not equal.
    func test_equals_PlayingCardWithSameRankAndDifferentSuit_false() throws {
     
        // Given
        let aceOfHearts = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let aceOfSpades = try PlayingCard(.ace, of: .spades, worth: 1, at: 1)
        
        // When/Then
        XCTAssertFalse(aceOfHearts.equals(aceOfSpades))
    }
    
    /// Tests that two `PlayingCard`s with the same `Rank` and different `Suit`s are not equal,
    /// using the equality operator.
    func test_equals_PlayingCardWithSameRankAndDifferentSuitUsingOperator_true()
        throws {
     
        // Given
        let aceOfHearts = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let aceOfSpades = try PlayingCard(.ace, of: .spades, worth: 1, at: 1)
        
        // When/Then
        XCTAssertNotEqual(aceOfHearts, aceOfSpades)
    }
    
    /// Tests that two `PlayingCard`s with different `Rank`s and the same `Suit` are not equal.
    func test_equals_PlayingCardWithDifferentRankAndSameSuit_false() throws {
     
        // Given
        let aceOfHearts = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let aceOfSpades = try PlayingCard(.ace, of: .spades, worth: 1, at: 1)
        
        // When/Then
        XCTAssertFalse(aceOfHearts.equals(aceOfSpades))
    }
    
    /// Tests that two `PlayingCard`s with different `Rank`s and the same `Suit` are not equal,
    /// using the equality operator.
    func test_equals_PlayingCardWithDifferentRankAndSameSuitUsingOperator_true()
        throws {
     
        // Given
        let aceOfHearts = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let aceOfSpades = try PlayingCard(.two, of: .hearts, worth: 1, at: 1)
        
        // When/Then
        XCTAssertNotEqual(aceOfHearts, aceOfSpades)
    }
    
    //-------------------------------------------------------------------------//
    //                               ranks()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `PlayingCard` `Rank`s another `PlayingCard` with the same `Rank` and
    /// position.
    func test_ranks_PlayingCardWithSameRankAndPosition_true() throws {
     
        // Given
        let ace1 = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let ace2 = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        
        // When/Then
        XCTAssert(ace1.ranks(ace2))
    }
    
    /// Tests that a `PlayingCard` does not `Rank`s another `PlayingCard` with the same `Rank`
    /// and different position.
    func test_ranks_PlayingCardWithSameRankAndDifferentPosition_false() throws {
     
        // Given
        let lowAce = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let highAce = try PlayingCard(.ace, of: .hearts, worth: 1, at: 3)
        
        // When/Then
        XCTAssertFalse(lowAce.ranks(highAce))
    }
    
    /// Tests that a `PlayingCard` does not `Rank`s another `PlayingCard` with a different `Rank`
    /// and same position.
    func test_ranks_RankedCardWithDifferentRankAndSamePosition_false() throws {
     
        // Given
        let king = try PlayingCard(.king, of: .hearts, worth: 1, at: 13)
        let highAce = try PlayingCard(.ace, of: .hearts, worth: 1, at: 13)
        
        // When/Then
        XCTAssertFalse(king.ranks(highAce))
    }
    
    //-------------------------------------------------------------------------//
    //                              follow()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `PlayingCard` with a lesser position than another `PlayingCard` does not follow it.
    func test_follows_PlayingCardWithLesserPosition_false() throws {
     
        // Given
        let lowAce = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let king = try PlayingCard(.king, of: .hearts, worth: 1, at: 13)
        
        // When/Then
        XCTAssertFalse(lowAce.follows(king))
    }
    
    /// Tests that a `PlayingCard` with the same position as another `PlayingCard` does not follow it.
    func test_follows_PlayingCardWithSamePosition_false() throws {
     
        // Given
        let ace1 = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let ace2 = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        
        // When/Then
        XCTAssertFalse(ace1.follows(ace2))
    }
    
    /// Tests that a `PlayingCard` with a position two or more greater than another `PlayingCard`
    /// does not follow  it.
    func test_follows_PlayingCardWithPositionTwoPlusGreater_false() throws {
     
        // Given
        let ace = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let three = try PlayingCard(.three, of: .hearts, worth: 3, at: 3)
        
        // When/Then
        XCTAssertFalse(three.follows(ace))
    }
    
    /// Tests that a `PlayingCard` with a position one greater than another `PlayingCard` follows it.
    func test_follows_PlayingCardWithPositionOneGreater_false() throws {
     
        // Given
        let ace = try PlayingCard(.ace, of: .hearts, worth: 1, at: 1)
        let two = try PlayingCard(.two, of: .hearts, worth: 2, at: 2)
        
        // When/Then
        XCTAssert(two.follows(ace))
    }
}
