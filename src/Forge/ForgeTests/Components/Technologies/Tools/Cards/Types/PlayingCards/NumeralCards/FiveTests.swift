//=============================================================================//
//                                                                             //
//  FiveTests.swift                                                            //
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

/// Unit tests for a `Five PlayingCard`.
class FiveTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Five` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Five(of: .null)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a`Five` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Five(of: .stars)) { error in

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

    /// Tests that a `Five`'s `Rank` equals `five`.
    func test_rank_ofFive_equalsFive() throws {

        // Given
        let five = try Five(of: .hearts)
        let expected = Rank.five

        // When
        let actual = five.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of a `Five` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let five = try Five(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = five.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Five` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let five = try Five(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = five.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Five` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let five = try Five(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = five.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Five` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let five = try Five(of: .spades)
        let expected = Suit.spades

        // When
        let actual = five.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Five`'s points equals 5.
    func test_points_ofFive_equals5() throws {

        // Given
        let five = try Five(of: .hearts)
        let expected = 5

        // When
        let actual = five.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Five`'s position equals 5.
    func test_position_ofFive_equals5() throws {

        // Given
        let five = try Five(of: .hearts)
        let expected = 5

        // When
        let actual = five.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Five` created with a `hearts Suit` equals "Five Of Hearts".
    func test_title_withHearts_equalsFiveOfHearts() throws {

        // Given
        let five = try Five(of: .hearts)
        let expected = "Five Of Hearts"

        // When
        let actual = five.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Five` created with a `diamonds Suit` equals "Five Of Diamonds".
    func test_title_withDiamonds_equalsFiveOfDiamonds() throws {

        // Given
        let five = try Five(of: .diamonds)
        let expected = "Five Of Diamonds"

        // When
        let actual = five.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Five` created with a `clubs Suit` equals "Five Of Club".
    func test_title_withClubs_equalsFiveOfClubs() throws {

        // Given
        let five = try Five(of: .clubs)
        let expected = "Five Of Clubs"

        // When
        let actual = five.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Five` created with a `spades Suit` equals "Five Of Spades".
    func test_title_withSpades_equalsFiveOfSpades() throws {

        // Given
        let five = try Five(of: .spades)
        let expected = "Five Of Spades"

        // When
        let actual = five.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Five` is less than a `Six`.
    func test_five_isLessThanSix_true() throws {
     
        // Given
        let five = try Five(of: .hearts)
        let six = try Six(of: .hearts)
        
        // When/Then
        XCTAssert(five.isLessThan(six))
    }
    
    /// Tests that a `Five` is less than a `Six`, using the less than operator.
    func test_five_isLessThanSixWithOperator_true() throws {
     
        // Given
        let five = try Five(of: .hearts)
        let six = try Six(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(five, six)
    }
    
    /// Tests that a `Five` is less than a high `Ace`.
    func test_five_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let five = try Five(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(five.isLessThan(highAce))
    }
    
    /// Tests that a `Five` is less than a high `Ace`, using the less than operator.
    func test_five_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let five = try Five(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(five, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Five` equals another `Five` with the same `Suit`.
    func test_five_equalsFiveWithSameSuit_true() throws {
     
        // Given
        let card1 = try Five(of: .hearts)
        let card2 = try Five(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Five` equals another `Five` with the same `Suit`, using the equality operator.
    func test_five_equalsFiveWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Five(of: .hearts)
        let card2 = try Five(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Five` does not equal another `Five` with a different `Suit`.
    func test_five_equalsFiveWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Five(of: .hearts)
        let card2 = try Five(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Five` does not equal another `Five` with a different `Suit`, using the equality
    /// operator.
    func test_five_equalsFiveWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Five(of: .hearts)
        let card2 = try Five(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Five` is greater than a low `Ace`, using the greater than operator.
    func test_five_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let five = try Five(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(five, ace)
    }
    
    /// Tests that a `Five` is greater than a `Four`, using the greater than operator.
    func test_five_isGreaterThanFourWithOperator_true() throws {
     
        // Given
        let five = try Five(of: .hearts)
        let four = try Four(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(five, four)
    }
}
