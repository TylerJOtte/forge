//=============================================================================//
//                                                                             //
//  ThreeTests.swift                                                           //
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

/// Unit tests for a `Three PlayingCard`.
class ThreeTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Three` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Three(of: .stars)) { error in

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

    /// Tests that a `Three`'s `Rank` equals `three`.
    func test_rank_ofThree_equalsThree() throws {

        // Given
        let three = try Three(of: .hearts)
        let expected = Rank.three

        // When
        let actual = three.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of a `Three` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let three = try Three(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = three.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Three` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let three = try Three(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = three.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Three` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let three = try Three(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = three.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Three` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let three = try Three(of: .spades)
        let expected = Suit.spades

        // When
        let actual = three.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Three`'s points equals 3.
    func test_points_ofThree_equals3() throws {

        // Given
        let three = try Three(of: .hearts)
        let expected = 3

        // When
        let actual = three.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Three`'s position equals 3.
    func test_position_ofThree_equals3() throws {

        // Given
        let three = try Three(of: .hearts)
        let expected = 3

        // When
        let actual = three.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Three` created with a `hearts Suit` equals "Three Of Hearts".
    func test_title_withHearts_equalsThreeOfHearts() throws {

        // Given
        let three = try Three(of: .hearts)
        let expected = "Three Of Hearts"

        // When
        let actual = three.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Three` created with a `diamonds Suit` equals "Three Of Diamonds".
    func test_title_withDiamonds_equalsThreeOfDiamonds() throws {

        // Given
        let three = try Three(of: .diamonds)
        let expected = "Three Of Diamonds"

        // When
        let actual = three.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Three` created with a `clubs Suit` equals "Three Of Club".
    func test_title_withClubs_equalsThreeOfClubs() throws {

        // Given
        let three = try Three(of: .clubs)
        let expected = "Three Of Clubs"

        // When
        let actual = three.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Three` created with a `spades Suit` equals "Three Of Spades".
    func test_title_withSpades_equalsThreeOfSpades() throws {

        // Given
        let three = try Three(of: .spades)
        let expected = "Three Of Spades"

        // When
        let actual = three.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Three` is less than a `Four`.
    func test_three_isLessThanFour_true() throws {
     
        // Given
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        
        // When/Then
        XCTAssert(three.isLessThan(four))
    }
    
    /// Tests that a `Three` is less than a `Four`, using the less than operator.
    func test_three_isLessThanFourWithOperator_true() throws {
     
        // Given
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(three, four)
    }
    
    /// Tests that a `Three` is less than a high `Ace`.
    func test_three_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let three = try Three(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(three.isLessThan(highAce))
    }
    
    /// Tests that a `Three` is less than a high `Ace`, using the less than operator.
    func test_three_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let three = try Three(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(three, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Three` equals another `Three` with the same `Suit`.
    func test_three_equalsThreeWithSameSuit_true() throws {
     
        // Given
        let card1 = try Three(of: .hearts)
        let card2 = try Three(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Three` equals another `Three` with the same `Suit`, using the equality operator.
    func test_three_equalsThreeWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Three(of: .hearts)
        let card2 = try Three(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Three` does not equal another `Three` with a different `Suit`.
    func test_three_equalsThreeWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Three(of: .hearts)
        let card2 = try Three(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Three` does not equal another `Three` with a different `Suit`, using the equality
    /// operator.
    func test_three_equalsThreeWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Three(of: .hearts)
        let card2 = try Three(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Three` is greater than a low `Ace`, using the greater than operator.
    func test_three_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let three = try Three(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(three, ace)
    }
    
    /// Tests that a `Three` is greater than a `Two`, using the greater than operator.
    func test_three_isGreaterThanTwoWithOperator_true() throws {
     
        // Given
        let three = try Three(of: .hearts)
        let two = try Two(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(three, two)
    }
}
