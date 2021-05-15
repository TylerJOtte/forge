//=============================================================================//
//                                                                             //
//  SixTests.swift                                                             //
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

/// Unit tests for a `Six PlayingCard`.
class SixTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Six` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Six(of: .stars)) { error in

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

    /// Tests that a `Six`'s `Rank` equals `six`.
    func test_rank_ofSix_equalsSix() throws {

        // Given
        let six = try Six(of: .hearts)
        let expected = Rank.six

        // When
        let actual = six.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of a `Six` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let six = try Six(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = six.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Six` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let six = try Six(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = six.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Six` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let six = try Six(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = six.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Six` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let six = try Six(of: .spades)
        let expected = Suit.spades

        // When
        let actual = six.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Six`'s points equals 6.
    func test_points_ofSix_equals6() throws {

        // Given
        let six = try Six(of: .hearts)
        let expected = 6

        // When
        let actual = six.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Six`'s position equals 6.
    func test_position_ofSix_equals6() throws {

        // Given
        let six = try Six(of: .hearts)
        let expected = 6

        // When
        let actual = six.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Six` created with a `hearts Suit` equals "Six Of Hearts".
    func test_title_withHearts_equalsSixOfHearts() throws {

        // Given
        let six = try Six(of: .hearts)
        let expected = "Six Of Hearts"

        // When
        let actual = six.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Six` created with a `diamonds Suit` equals "Six Of Diamonds".
    func test_title_withDiamonds_equalsSixOfDiamonds() throws {

        // Given
        let six = try Six(of: .diamonds)
        let expected = "Six Of Diamonds"

        // When
        let actual = six.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Six` created with a `clubs Suit` equals "Six Of Club".
    func test_title_withClubs_equalsSixOfClubs() throws {

        // Given
        let six = try Six(of: .clubs)
        let expected = "Six Of Clubs"

        // When
        let actual = six.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Six` created with a `spades Suit` equals "Six Of Spades".
    func test_title_withSpades_equalsSixOfSpades() throws {

        // Given
        let six = try Six(of: .spades)
        let expected = "Six Of Spades"

        // When
        let actual = six.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Six` is less than a `Seven`.
    func test_six_isLessThanSeven_true() throws {
     
        // Given
        let six = try Six(of: .hearts)
        let seven = try Seven(of: .hearts)
        
        // When/Then
        XCTAssert(six.isLessThan(seven))
    }
    
    /// Tests that a `Six` is less than a `Seven`, using the less than operator.
    func test_six_isLessThanSevenWithOperator_true() throws {
     
        // Given
        let six = try Six(of: .hearts)
        let seven = try Seven(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(six, seven       )
    }
    
    /// Tests that a `Six` is less than a high `Ace`.
    func test_six_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let six = try Six(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(six.isLessThan(highAce))
    }
    
    /// Tests that a `Six` is less than a high `Ace`, using the less than operator.
    func test_six_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let six = try Six(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(six, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Six` equals another `Six` with the same `Suit`.
    func test_six_equalsSixWithSameSuit_true() throws {
     
        // Given
        let card1 = try Six(of: .hearts)
        let card2 = try Six(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Six` equals another `Six` with the same `Suit`, using the equality operator.
    func test_six_equalsSixWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Six(of: .hearts)
        let card2 = try Six(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Six` does not equal another `Six` with a different `Suit`.
    func test_six_equalsSixWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Six(of: .hearts)
        let card2 = try Six(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Six` does not equal another `Six` with a different `Suit`, using the equality
    /// operator.
    func test_six_equalsSixWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Six(of: .hearts)
        let card2 = try Six(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Six` is greater than a low `Ace`, using the greater than operator.
    func test_six_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let six = try Six(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(six, ace)
    }
    
    /// Tests that a `Six` is greater than a `Five`, using the greater than operator.
    func test_six_isGreaterThanFiveWithOperator_true() throws {
     
        // Given
        let six = try Six(of: .hearts)
        let five = try Five(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(six, five)
    }
}
