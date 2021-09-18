//=============================================================================//
//                                                                             //
//  TwoTests.swift                                                             //
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

/// Unit tests for a `Two PlayingCard`.
class TwoTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Two` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Two(of: .null)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a`Two` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Two(of: .stars)) { error in

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

    /// Tests that the `Suit` of a `Two` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let two = try Two(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = two.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Two` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let two = try Two(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = two.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Two` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let two = try Two(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = two.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Two` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let two = try Two(of: .spades)
        let expected = Suit.spades

        // When
        let actual = two.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a `Two`'s `Rank` equals `two`.
    func test_rank_ofTwo_equalsTwo() throws {

        // Given
        let two = try Two(of: .hearts)
        let expected = Rank.two

        // When
        let actual = two.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Two`'s position equals 2.
    func test_position_ofTwo_equals2() throws {

        // Given
        let two = try Two(of: .hearts)
        let expected = 2

        // When
        let actual = two.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Two`'s points equals 2.
    func test_points_ofTwo_equals2() throws {

        // Given
        let two = try Two(of: .hearts)
        let expected = 2

        // When
        let actual = two.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Two` created with a `hearts Suit` equals "Two Of Hearts".
    func test_title_withHearts_equalsTwoOfHearts() throws {

        // Given
        let two = try Two(of: .hearts)
        let expected = "Two Of Hearts"

        // When
        let actual = two.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Two` created with a `diamonds Suit` equals "Two Of Diamonds".
    func test_title_withDiamonds_equalsTwoOfDiamonds() throws {

        // Given
        let two = try Two(of: .diamonds)
        let expected = "Two Of Diamonds"

        // When
        let actual = two.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Two` created with a `clubs Suit` equals "Two Of Club".
    func test_title_withClubs_equalsTwoOfClubs() throws {

        // Given
        let two = try Two(of: .clubs)
        let expected = "Two Of Clubs"

        // When
        let actual = two.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Two` created with a `spades Suit` equals "Two Of Spades".
    func test_title_withSpades_equalsTwoOfSpades() throws {

        // Given
        let two = try Two(of: .spades)
        let expected = "Two Of Spades"

        // When
        let actual = two.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Two` is less than a `Three`.
    func test_two_isLessThanThree_true() throws {
     
        // Given
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        
        // When/Then
        XCTAssert(two.isLessThan(three))
    }
    
    /// Tests that a `Two` is less than a `Three`, using the less than operator.
    func test_two_isLessThanThreeWithOperator_true() throws {
     
        // Given
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(two, three)
    }
    
    /// Tests that a `Two` is less than a high `Ace`.
    func test_two_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let two = try Two(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(two.isLessThan(highAce))
    }
    
    /// Tests that a `Two` is less than a high `Ace`, using the less than operator.
    func test_two_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let two = try Two(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(two, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Two` equals another `Two` with the same `Suit`.
    func test_two_equalsTwoWithSameSuit_true() throws {
     
        // Given
        let card1 = try Two(of: .hearts)
        let card2 = try Two(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Two` equals another `Two` with the same `Suit`, using the equality operator.
    func test_two_equalsTwoWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Two(of: .hearts)
        let card2 = try Two(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Two` does not equal another `Two` with a different `Suit`.
    func test_two_equalsTwoWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Two(of: .hearts)
        let card2 = try Two(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Two` does not equal another `Two` with a different `Suit`, using the equality
    /// operator.
    func test_two_equalsTwoWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Two(of: .hearts)
        let card2 = try Two(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Two` is greater than a low `Ace`, using the greater than operator.
    func test_two_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let two = try Two(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(two, ace)
    }
}
