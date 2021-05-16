//=============================================================================//
//                                                                             //
//  TenTests.swift                                                             //
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

/// Unit tests for a `Ten PlayingCard`.
class TenTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Ten` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Ten(of: .null)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a`Ten` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Ten(of: .stars)) { error in

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

    /// Tests that a `Ten`'s `Rank` equals `ten`.
    func test_rank_ofTen_equalsTen() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let expected = Rank.ten

        // When
        let actual = ten.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of a `Ten` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = ten.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Ten` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let ten = try Ten(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = ten.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Ten` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let ten = try Ten(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = ten.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Ten` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let ten = try Ten(of: .spades)
        let expected = Suit.spades

        // When
        let actual = ten.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Ten`'s points equals 10.
    func test_points_ofTen_equals10() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let expected = 10

        // When
        let actual = ten.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Ten`'s position equals 10.
    func test_position_ofTen_equals10() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let expected = 10

        // When
        let actual = ten.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Ten` created with a `hearts Suit` equals "Ten Of Hearts".
    func test_title_withHearts_equalsTenOfHearts() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let expected = "Ten Of Hearts"

        // When
        let actual = ten.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Ten` created with a `diamonds Suit` equals "Ten Of Diamonds".
    func test_title_withDiamonds_equalsTenOfDiamonds() throws {

        // Given
        let ten = try Ten(of: .diamonds)
        let expected = "Ten Of Diamonds"

        // When
        let actual = ten.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Ten` created with a `clubs Suit` equals "Ten Of Club".
    func test_title_withClubs_equalsTenOfClubs() throws {

        // Given
        let ten = try Ten(of: .clubs)
        let expected = "Ten Of Clubs"

        // When
        let actual = ten.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Ten` created with a `spades Suit` equals "Ten Of Spades".
    func test_title_withSpades_equalsTenOfSpades() throws {

        // Given
        let ten = try Ten(of: .spades)
        let expected = "Ten Of Spades"

        // When
        let actual = ten.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Ten` is less than a `Jack`.
    func test_ten_isLessThanJack_true() throws {
     
        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        
        // When/Then
        XCTAssert(ten.isLessThan(jack))
    }
    
    /// Tests that a `Ten` is less than a `Jack`, using the less than operator.
    func test_ten_isLessThanJackWithOperator_true() throws {
     
        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(ten, jack       )
    }
    
    /// Tests that a `Ten` is less than a high `Ace`.
    func test_ten_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let ten = try Ten(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(ten.isLessThan(highAce))
    }
    
    /// Tests that a `Ten` is less than a high `Ace`, using the less than operator.
    func test_ten_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let ten = try Ten(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(ten, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Ten` equals another `Ten` with the same `Suit`.
    func test_ten_equalsTenWithSameSuit_true() throws {
     
        // Given
        let card1 = try Ten(of: .hearts)
        let card2 = try Ten(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Ten` equals another `Ten` with the same `Suit`, using the equality operator.
    func test_ten_equalsTenWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Ten(of: .hearts)
        let card2 = try Ten(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Ten` does not equal another `Ten` with a different `Suit`.
    func test_ten_equalsTenWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Ten(of: .hearts)
        let card2 = try Ten(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Ten` does not equal another `Ten` with a different `Suit`, using the equality
    /// operator.
    func test_ten_equalsTenWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Ten(of: .hearts)
        let card2 = try Ten(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Ten` is greater than a low `Ace`, using the greater than operator.
    func test_ten_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let ten = try Ten(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(ten, ace)
    }
    
    /// Tests that a `Ten` is greater than a `Nine`, using the greater than operator.
    func test_ten_isGreaterThanEightWithOperator_true() throws {
     
        // Given
        let ten = try Ten(of: .hearts)
        let nine = try Nine(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(ten, nine)
    }
}
