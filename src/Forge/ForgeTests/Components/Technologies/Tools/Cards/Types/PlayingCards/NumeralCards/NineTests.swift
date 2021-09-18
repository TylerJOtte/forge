//=============================================================================//
//                                                                             //
//  NineTests.swift                                                            //
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

/// Unit tests for a `Nine PlayingCard`.
class NineTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Nine` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Nine(of: .null)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a`Nine` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Nine(of: .stars)) { error in

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

    /// Tests that the `Suit` of a `Nine` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let nine = try Nine(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = nine.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Nine` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let nine = try Nine(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = nine.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Nine` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let nine = try Nine(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = nine.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Nine` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let nine = try Nine(of: .spades)
        let expected = Suit.spades

        // When
        let actual = nine.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a `Nine`'s `Rank` equals `nine`.
    func test_rank_ofNine_equalsNine() throws {

        // Given
        let nine = try Nine(of: .hearts)
        let expected = Rank.nine

        // When
        let actual = nine.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Nine`'s position equals 9.
    func test_position_ofNine_equals9() throws {

        // Given
        let nine = try Nine(of: .hearts)
        let expected = 9

        // When
        let actual = nine.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Nine`'s points equals 9.
    func test_points_ofNine_equals9() throws {

        // Given
        let nine = try Nine(of: .hearts)
        let expected = 9

        // When
        let actual = nine.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Nine` created with a `hearts Suit` equals "Nine Of Hearts".
    func test_title_withHearts_equalsNineOfHearts() throws {

        // Given
        let nine = try Nine(of: .hearts)
        let expected = "Nine Of Hearts"

        // When
        let actual = nine.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Nine` created with a `diamonds Suit` equals "Nine Of Diamonds".
    func test_title_withDiamonds_equalsNineOfDiamonds() throws {

        // Given
        let nine = try Nine(of: .diamonds)
        let expected = "Nine Of Diamonds"

        // When
        let actual = nine.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Nine` created with a `clubs Suit` equals "Nine Of Club".
    func test_title_withClubs_equalsNineOfClubs() throws {

        // Given
        let nine = try Nine(of: .clubs)
        let expected = "Nine Of Clubs"

        // When
        let actual = nine.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Nine` created with a `spades Suit` equals "Nine Of Spades".
    func test_title_withSpades_equalsNineOfSpades() throws {

        // Given
        let nine = try Nine(of: .spades)
        let expected = "Nine Of Spades"

        // When
        let actual = nine.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Nine` is less than a `Ten`.
    func test_nine_isLessThanTen_true() throws {
     
        // Given
        let nine = try Nine(of: .hearts)
        let ten = try Ten(of: .hearts)
        
        // When/Then
        XCTAssert(nine.isLessThan(ten))
    }
    
    /// Tests that a `Nine` is less than a `Ten`, using the less than operator.
    func test_nine_isLessThanTenWithOperator_true() throws {
     
        // Given
        let nine = try Nine(of: .hearts)
        let ten = try Ten(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(nine, ten       )
    }
    
    /// Tests that a `Nine` is less than a high `Ace`.
    func test_nine_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let nine = try Nine(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(nine.isLessThan(highAce))
    }
    
    /// Tests that a `Nine` is less than a high `Ace`, using the less than operator.
    func test_nine_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let nine = try Nine(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(nine, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Nine` equals another `Nine` with the same `Suit`.
    func test_nine_equalsNineWithSameSuit_true() throws {
     
        // Given
        let card1 = try Nine(of: .hearts)
        let card2 = try Nine(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Nine` equals another `Nine` with the same `Suit`, using the equality operator.
    func test_nine_equalsNineWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Nine(of: .hearts)
        let card2 = try Nine(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Nine` does not equal another `Nine` with a different `Suit`.
    func test_nine_equalsNineWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Nine(of: .hearts)
        let card2 = try Nine(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Nine` does not equal another `Nine` with a different `Suit`, using the equality
    /// operator.
    func test_nine_equalsNineWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Nine(of: .hearts)
        let card2 = try Nine(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Nine` is greater than a low `Ace`, using the greater than operator.
    func test_nine_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let nine = try Nine(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(nine, ace)
    }
    
    /// Tests that a `Nine` is greater than an `Eight`, using the greater than operator.
    func test_nine_isGreaterThanEightWithOperator_true() throws {
     
        // Given
        let nine = try Nine(of: .hearts)
        let eight = try Eight(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(nine, eight)
    }
    
    //-------------------------------------------------------------------------//
    //                             follows()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Nine` follows an `Eight`.
    func test_nine_followsAnEight_true() throws {
     
        // Given
        let nine = try Nine(of: .hearts)
        let eight = try Eight(of: .hearts)
        
        // When/Then
        XCTAssert(nine.follows(eight))
    }
}
