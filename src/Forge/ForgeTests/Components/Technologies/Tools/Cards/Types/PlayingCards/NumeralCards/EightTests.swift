//=============================================================================//
//                                                                             //
//  EightTests.swift                                                           //
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

/// Unit tests for an `Eight PlayingCard`.
class EightTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Eight` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Eight(of: .stars)) { error in

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

    /// Tests that an `Eight`'s `Rank` equals `eight`.
    func test_rank_ofEight_equalsEight() throws {

        // Given
        let eight = try Eight(of: .hearts)
        let expected = Rank.eight

        // When
        let actual = eight.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of an `Eight` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let eight = try Eight(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = eight.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Eight` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let eight = try Eight(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = eight.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Eight` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let eight = try Eight(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = eight.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Eight` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let eight = try Eight(of: .spades)
        let expected = Suit.spades

        // When
        let actual = eight.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that an `Eight`'s points equals 8.
    func test_points_ofEight_equals8() throws {

        // Given
        let eight = try Eight(of: .hearts)
        let expected = 8

        // When
        let actual = eight.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of an `Eight` created with a `hearts Suit` equals "Eight Of Hearts".
    func test_title_withHearts_equalsEightOfHearts() throws {

        // Given
        let eight = try Eight(of: .hearts)
        let expected = "Eight Of Hearts"

        // When
        let actual = eight.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Eight` created with a `diamonds Suit` equals "Eight Of Diamonds".
    func test_title_withDiamonds_equalsEightOfDiamonds() throws {

        // Given
        let eight = try Eight(of: .diamonds)
        let expected = "Eight Of Diamonds"

        // When
        let actual = eight.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Eight` created with a `clubs Suit` equals "Eight Of Club".
    func test_title_withClubs_equalsEightOfClubs() throws {

        // Given
        let eight = try Eight(of: .clubs)
        let expected = "Eight Of Clubs"

        // When
        let actual = eight.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Eight` created with a `spades Suit` equals "Eight Of Spades".
    func test_title_withSpades_equalsEightOfSpades() throws {

        // Given
        let eight = try Eight(of: .spades)
        let expected = "Eight Of Spades"

        // When
        let actual = eight.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that an `Eight` is less than a `Nine`.
    func test_eight_isLessThanNine_true() throws {
     
        // Given
        let eight = try Eight(of: .hearts)
        let nine = try Nine(of: .hearts)
        
        // When/Then
        XCTAssert(eight.isLessThan(nine))
    }
    
    /// Tests that an `Eight` is less than a `Nine`, using the less than operator.
    func test_eight_isLessThanNineWithOperator_true() throws {
     
        // Given
        let eight = try Eight(of: .hearts)
        let nine = try Nine(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(eight, nine       )
    }
    
    /// Tests that an `Eight` is less than a high `Ace`.
    func test_eight_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let eight = try Eight(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(eight.isLessThan(highAce))
    }
    
    /// Tests that an `Eight` is less than a high `Ace`, using the less than operator.
    func test_eight_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let eight = try Eight(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(eight, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that an `Eight` equals another `Eight` with the same `Suit`.
    func test_eight_equalsEightWithSameSuit_true() throws {
     
        // Given
        let card1 = try Eight(of: .hearts)
        let card2 = try Eight(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that an `Eight` equals another `Eight` with the same `Suit`, using the equality operator.
    func test_eight_equalsEightWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Eight(of: .hearts)
        let card2 = try Eight(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that am `Eight` does not equal another `Eight` with a different `Suit`.
    func test_eight_equalsEightWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Eight(of: .hearts)
        let card2 = try Eight(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that an `Eight` does not equal another `Eight` with a different `Suit`, using the equality
    /// operator.
    func test_eight_equalsEightWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Eight(of: .hearts)
        let card2 = try Eight(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that an `Eight` is greater than a low `Ace`, using the greater than operator.
    func test_eight_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let eight = try Eight(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(eight, ace)
    }
    
    /// Tests that an `Eight` is greater than a `Seven`, using the greater than operator.
    func test_eight_isGreaterThanSevenWithOperator_true() throws {
     
        // Given
        let eight = try Eight(of: .hearts)
        let seven = try Seven(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(eight, seven)
    }
}
