//=============================================================================//
//                                                                             //
//  FourTests.swift                                                            //
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

/// Unit tests for a `Four PlayingCard`.
class FourTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Four` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Four(of: .null)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a`Four` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Four(of: .stars)) { error in

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

    /// Tests that the `Suit` of a `Four` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let four = try Four(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = four.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Four` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let four = try Four(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = four.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Four` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let four = try Four(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = four.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Four` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let four = try Four(of: .spades)
        let expected = Suit.spades

        // When
        let actual = four.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a `Four`'s `Rank` equals `four`.
    func test_rank_ofFour_equalsFour() throws {

        // Given
        let four = try Four(of: .hearts)
        let expected = Rank.four

        // When
        let actual = four.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Four`'s position equals 4.
    func test_position_ofFour_equals4() throws {

        // Given
        let four = try Four(of: .hearts)
        let expected = 4

        // When
        let actual = four.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Four`'s points equals 4.
    func test_points_ofFour_equals4() throws {

        // Given
        let four = try Four(of: .hearts)
        let expected = 4

        // When
        let actual = four.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Four` created with a `hearts Suit` equals "Four Of Hearts".
    func test_title_withHearts_equalsFourOfHearts() throws {

        // Given
        let four = try Four(of: .hearts)
        let expected = "Four Of Hearts"

        // When
        let actual = four.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Four` created with a `diamonds Suit` equals "Four Of Diamonds".
    func test_title_withDiamonds_equalsFourOfDiamonds() throws {

        // Given
        let four = try Four(of: .diamonds)
        let expected = "Four Of Diamonds"

        // When
        let actual = four.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Four` created with a `clubs Suit` equals "Four Of Club".
    func test_title_withClubs_equalsFourOfClubs() throws {

        // Given
        let four = try Four(of: .clubs)
        let expected = "Four Of Clubs"

        // When
        let actual = four.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Four` created with a `spades Suit` equals "Four Of Spades".
    func test_title_withSpades_equalsFourOfSpades() throws {

        // Given
        let four = try Four(of: .spades)
        let expected = "Four Of Spades"

        // When
        let actual = four.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Four` is less than a `Five`.
    func test_four_isLessThanFive_true() throws {
     
        // Given
        let four = try Four(of: .hearts)
        let five = try Five(of: .hearts)
        
        // When/Then
        XCTAssert(four.isLessThan(five))
    }
    
    /// Tests that a `Four` is less than a `Five`, using the less than operator.
    func test_four_isLessThanFiveWithOperator_true() throws {
     
        // Given
        let four = try Four(of: .hearts)
        let five = try Five(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(four, five)
    }
    
    /// Tests that a `Four` is less than a high `Ace`.
    func test_four_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let four = try Four(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(four.isLessThan(highAce))
    }
    
    /// Tests that a `Four` is less than a high `Ace`, using the less than operator.
    func test_four_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let four = try Four(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(four, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Four` equals another `Four` with the same `Suit`.
    func test_four_equalsFourWithSameSuit_true() throws {
     
        // Given
        let card1 = try Four(of: .hearts)
        let card2 = try Four(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Four` equals another `Four` with the same `Suit`, using the equality operator.
    func test_four_equalsFourWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Four(of: .hearts)
        let card2 = try Four(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Four` does not equal another `Four` with a different `Suit`.
    func test_four_equalsFourWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Four(of: .hearts)
        let card2 = try Four(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Four` does not equal another `Four` with a different `Suit`, using the equality
    /// operator.
    func test_four_equalsFourWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Four(of: .hearts)
        let card2 = try Four(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Four` is greater than a low `Ace`, using the greater than operator.
    func test_four_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let four = try Four(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(four, ace)
    }
    
    /// Tests that a `Four` is greater than a `Three`, using the greater than operator.
    func test_four_isGreaterThanThreeWithOperator_true() throws {
     
        // Given
        let four = try Four(of: .hearts)
        let three = try Three(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(four, three)
    }
    
    //-------------------------------------------------------------------------//
    //                               ranks()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Four` `Rank`s another `Four`.
    func test_four_ranksFour_true() throws {
     
        // Given
        let fourOfHearts = try Four(of: .hearts)
        let fourOfSpades = try Four(of: .spades)
        
        // When/Then
        XCTAssert(fourOfHearts.ranks(fourOfSpades))
    }
    
    /// Tests that a `Four` does not `Rank` a `Five`.
    func test_four_ranksFive_false() throws {
     
        // Given
        let four = try Four(of: .hearts)
        let five = try Five(of: .hearts)
        
        // When/Then
        XCTAssertFalse(four.ranks(five))
    }
    
    //-------------------------------------------------------------------------//
    //                             follows()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Four` follows a `Three`.
    func test_four_followsAThree_true() throws {
     
        // Given
        let four = try Four(of: .hearts)
        let three = try Three(of: .hearts)
        
        // When/Then
        XCTAssert(four.follows(three))
    }
}
