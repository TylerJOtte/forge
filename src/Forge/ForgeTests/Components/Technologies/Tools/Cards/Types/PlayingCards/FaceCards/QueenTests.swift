//=============================================================================//
//                                                                             //
//  QueenTests.swift                                                           //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/26/21.                                       //
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

/// Unit tests for a `Queen PlayingCard`.
class QueenTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Queen` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Queen(of: .null)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a`Queen` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Queen(of: .stars)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }

    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a `Queen`'s `Rank` equals `queen`.
    func test_rank_ofQueen_equalsQueen() throws {

        // Given
        let queen = try Queen(of: .hearts)
        let expected = Rank.queen

        // When
        let actual = queen.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of a `Queen` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let queen = try Queen(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = queen.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Queen` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let queen = try Queen(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = queen.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Queen` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let queen = try Queen(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = queen.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Queen` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let queen = try Queen(of: .spades)
        let expected = Suit.spades

        // When
        let actual = queen.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Queen`'s points equals 10.
    func test_points_ofQueen_equals10() throws {

        // Given
        let queen = try Queen(of: .hearts)
        let expected = 10

        // When
        let actual = queen.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Queen`'s position equals 12.
    func test_position_ofQueen_equals12() throws {

        // Given
        let queen = try Queen(of: .hearts)
        let expected = 12

        // When
        let actual = queen.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Queen` created with a `hearts Suit` equals "Queen Of Hearts".
    func test_title_withHearts_equalsQueenOfHearts() throws {

        // Given
        let queen = try Queen(of: .hearts)
        let expected = "Queen Of Hearts"

        // When
        let actual = queen.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Queen` created with a `diamonds Suit` equals "Queen Of Diamonds".
    func test_title_withDiamonds_equalsQueenOfDiamonds() throws {

        // Given
        let queen = try Queen(of: .diamonds)
        let expected = "Queen Of Diamonds"

        // When
        let actual = queen.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Queen` created with a `clubs Suit` equals "Queen Of Club".
    func test_title_withClubs_equalsQueenOfClubs() throws {

        // Given
        let queen = try Queen(of: .clubs)
        let expected = "Queen Of Clubs"

        // When
        let actual = queen.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Queen` created with a `spades Suit` equals "Queen Of Spades".
    func test_title_withSpades_equalsQueenOfSpades() throws {

        // Given
        let queen = try Queen(of: .spades)
        let expected = "Queen Of Spades"

        // When
        let actual = queen.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Queen` is less than a `King`.
    func test_queen_isLessThanKing_true() throws {
     
        // Given
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        
        // When/Then
        XCTAssert(queen.isLessThan(king))
    }
    
    /// Tests that a `Queen` is less than a `King`, using the less than operator.
    func test_queen_isLessThanKingWithOperator_true() throws {
     
        // Given
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(queen, king       )
    }
    
    /// Tests that a `Queen` is less than a high `Ace`.
    func test_queen_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let queen = try Queen(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(queen.isLessThan(highAce))
    }
    
    /// Tests that a `Queen` is less than a high `Ace`, using the less than operator.
    func test_queen_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let queen = try Queen(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(queen, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Queen` equals another `Queen` with the same `Suit`.
    func test_queen_equalsQueenWithSameSuit_true() throws {
     
        // Given
        let card1 = try Queen(of: .hearts)
        let card2 = try Queen(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Queen` equals another `Queen` with the same `Suit`, using the equality operator.
    func test_queen_equalsQueenWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Queen(of: .hearts)
        let card2 = try Queen(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Queen` does not equal another `Queen` with a different `Suit`.
    func test_queen_equalsQueenWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Queen(of: .hearts)
        let card2 = try Queen(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Queen` does not equal another `Queen` with a different `Suit`, using the equality
    /// operator.
    func test_queen_equalsQueenWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Queen(of: .hearts)
        let card2 = try Queen(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Queen` is greater than a low `Ace`, using the greater than operator.
    func test_queen_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let queen = try Queen(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(queen, ace)
    }
    
    /// Tests that a `Queen` is greater than a `Jack`, using the greater than operator.
    func test_queen_isGreaterThanEightWithOperator_true() throws {
     
        // Given
        let queen = try Queen(of: .hearts)
        let jack = try Jack(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(queen, jack)
    }
}
