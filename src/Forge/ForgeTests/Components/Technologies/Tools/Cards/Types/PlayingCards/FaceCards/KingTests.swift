//=============================================================================//
//                                                                             //
//  KingTests.swift                                                            //
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

/// Unit tests for a `King PlayingCard`.
class KingTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`King` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try King(of: .null)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a`King` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try King(of: .stars)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }

    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of a `King` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let king = try King(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = king.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `King` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let king = try King(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = king.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `King` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let king = try King(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = king.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `King` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let king = try King(of: .spades)
        let expected = Suit.spades

        // When
        let actual = king.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a `King`'s `Rank` equals `king`.
    func test_rank_ofKing_equalsKing() throws {

        // Given
        let king = try King(of: .hearts)
        let expected = Rank.king

        // When
        let actual = king.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `King`'s position equals 13.
    func test_position_ofKing_equals13() throws {

        // Given
        let king = try King(of: .hearts)
        let expected = 13

        // When
        let actual = king.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `King`'s points equals 10.
    func test_points_ofKing_equals10() throws {

        // Given
        let king = try King(of: .hearts)
        let expected = 10

        // When
        let actual = king.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `King` created with a `hearts Suit` equals "King Of Hearts".
    func test_title_withHearts_equalsKingOfHearts() throws {

        // Given
        let king = try King(of: .hearts)
        let expected = "King Of Hearts"

        // When
        let actual = king.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `King` created with a `diamonds Suit` equals "King Of Diamonds".
    func test_title_withDiamonds_equalsKingOfDiamonds() throws {

        // Given
        let king = try King(of: .diamonds)
        let expected = "King Of Diamonds"

        // When
        let actual = king.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `King` created with a `clubs Suit` equals "King Of Club".
    func test_title_withClubs_equalsKingOfClubs() throws {

        // Given
        let king = try King(of: .clubs)
        let expected = "King Of Clubs"

        // When
        let actual = king.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `King` created with a `spades Suit` equals "King Of Spades".
    func test_title_withSpades_equalsKingOfSpades() throws {

        // Given
        let king = try King(of: .spades)
        let expected = "King Of Spades"

        // When
        let actual = king.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `King` is less than a high `Ace`.
    func test_king_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let king = try King(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(king.isLessThan(highAce))
    }
    
    /// Tests that a `King` is less than a high `Ace`, using the less than operator.
    func test_king_isLessThanHighAceOperator_true() throws {
     
        // Given
        let isHigh = true
        let king = try King(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(king, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `King` equals another `King` with the same `Suit`.
    func test_king_equalsKingWithSameSuit_true() throws {
     
        // Given
        let card1 = try King(of: .hearts)
        let card2 = try King(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `King` equals another `King` with the same `Suit`, using the equality operator.
    func test_king_equalsKingWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try King(of: .hearts)
        let card2 = try King(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `King` does not equal another `King` with a different `Suit`.
    func test_king_equalsKingWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try King(of: .hearts)
        let card2 = try King(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `King` does not equal another `King` with a different `Suit`, using the equality
    /// operator.
    func test_king_equalsKingWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try King(of: .hearts)
        let card2 = try King(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `King` is greater than a low `Ace`, using the greater than operator.
    func test_king_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let king = try King(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(king, ace)
    }
    
    /// Tests that a `King` is greater than a `Queen`, using the greater than operator.
    func test_king_isGreaterThanQueenWithOperator_true() throws {
     
        // Given
        let king = try King(of: .hearts)
        let queen = try Queen(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(king, queen)
    }
    
    //-------------------------------------------------------------------------//
    //                               ranks()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `King` `Rank`s another `King`.
    func test_king_ranksKing_true() throws {
     
        // Given
        let kingOfHearts = try King(of: .hearts)
        let kingOfSpades = try King(of: .spades)
        
        // When/Then
        XCTAssert(kingOfHearts.ranks(kingOfSpades))
    }
    
    /// Tests that a `King` does not `Rank` a high `Ace`.
    func test_king_ranksHighAce_false() throws {
     
        // Given
        let king = try King(of: .hearts)
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertFalse(king.ranks(highAce))
    }
    
    //-------------------------------------------------------------------------//
    //                             follows()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `King` follows a `Queen`.
    func test_king_followsAQueen_true() throws {
     
        // Given
        let king = try King(of: .hearts)
        let queen = try Queen(of: .hearts)
        
        // When/Then
        XCTAssert(king.follows(queen))
    }
}
