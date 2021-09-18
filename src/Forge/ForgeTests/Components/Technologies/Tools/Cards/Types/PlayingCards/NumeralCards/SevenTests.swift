//=============================================================================//
//                                                                             //
//  SevenTests.swift                                                           //
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

/// Unit tests for a `Seven PlayingCard`.
class SevenTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Seven` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_init_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Seven(of: .null)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a`Seven` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Seven(of: .stars)) { error in

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

    /// Tests that the `Suit` of a `Seven` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let seven = try Seven(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = seven.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Seven` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let seven = try Seven(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = seven.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Seven` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let seven = try Seven(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = seven.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Seven` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let seven = try Seven(of: .spades)
        let expected = Suit.spades

        // When
        let actual = seven.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a `Seven`'s `Rank` equals `seven`.
    func test_rank_ofSeven_equalsSeven() throws {

        // Given
        let seven = try Seven(of: .hearts)
        let expected = Rank.seven

        // When
        let actual = seven.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Seven`'s position equals 7.
    func test_position_ofTwo_equals7() throws {

        // Given
        let seven = try Seven(of: .hearts)
        let expected = 7

        // When
        let actual = seven.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Seven`'s points equals 7.
    func test_points_ofSeven_equals7() throws {

        // Given
        let seven = try Seven(of: .hearts)
        let expected = 7

        // When
        let actual = seven.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Seven` created with a `hearts Suit` equals "Seven Of Hearts".
    func test_title_withHearts_equalsSevenOfHearts() throws {

        // Given
        let seven = try Seven(of: .hearts)
        let expected = "Seven Of Hearts"

        // When
        let actual = seven.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Seven` created with a `diamonds Suit` equals "Seven Of Diamonds".
    func test_title_withDiamonds_equalsSevenOfDiamonds() throws {

        // Given
        let seven = try Seven(of: .diamonds)
        let expected = "Seven Of Diamonds"

        // When
        let actual = seven.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Seven` created with a `clubs Suit` equals "Seven Of Club".
    func test_title_withClubs_equalsSevenOfClubs() throws {

        // Given
        let seven = try Seven(of: .clubs)
        let expected = "Seven Of Clubs"

        // When
        let actual = seven.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Seven` created with a `spades Suit` equals "Seven Of Spades".
    func test_title_withSpades_equalsSevenOfSpades() throws {

        // Given
        let seven = try Seven(of: .spades)
        let expected = "Seven Of Spades"

        // When
        let actual = seven.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Seven` is less than an `Eight`.
    func test_seven_isLessThanEight_true() throws {
     
        // Given
        let seven = try Seven(of: .hearts)
        let eight = try Eight(of: .hearts)
        
        // When/Then
        XCTAssert(seven.isLessThan(eight))
    }
    
    /// Tests that a `Seven` is less than an `Eight`, using the less than operator.
    func test_seven_isLessThanEightWithOperator_true() throws {
     
        // Given
        let seven = try Seven(of: .hearts)
        let eight = try Eight(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(seven, eight       )
    }
    
    /// Tests that a `Seven` is less than a high `Ace`.
    func test_seven_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let seven = try Seven(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(seven.isLessThan(highAce))
    }
    
    /// Tests that a `Seven` is less than a high `Ace`, using the less than operator.
    func test_seven_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let seven = try Seven(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(seven, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Seven` equals another `Seven` with the same `Suit`.
    func test_seven_equalsSevenWithSameSuit_true() throws {
     
        // Given
        let card1 = try Seven(of: .hearts)
        let card2 = try Seven(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Seven` equals another `Seven` with the same `Suit`, using the equality operator.
    func test_seven_equalsSevenWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Seven(of: .hearts)
        let card2 = try Seven(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Seven` does not equal another `Seven` with a different `Suit`.
    func test_seven_equalsSevenWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Seven(of: .hearts)
        let card2 = try Seven(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Seven` does not equal another `Seven` with a different `Suit`, using the equality
    /// operator.
    func test_seven_equalsSevenWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Seven(of: .hearts)
        let card2 = try Seven(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Seven` is greater than a low `Ace`, using the greater than operator.
    func test_seven_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let seven = try Seven(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(seven, ace)
    }
    
    /// Tests that a `Seven` is greater than a `Six`, using the greater than operator.
    func test_seven_isGreaterThanSixWithOperator_true() throws {
     
        // Given
        let seven = try Seven(of: .hearts)
        let six = try Six(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(seven, six)
    }
}
