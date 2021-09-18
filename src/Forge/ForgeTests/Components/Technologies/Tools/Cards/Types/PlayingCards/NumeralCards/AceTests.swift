//=============================================================================//
//                                                                             //
//  AceTests.swift                                                             //
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

/// Unit tests for an `Ace PlayingCard`.
class AceTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a low`Ace` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_initLowAce_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Ace(of: .null)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a high`Ace` with a`null PlayingCard Suit` throws an `invalidSuit`
    /// `Error`.
    func test_initHighAce_withNullSuit_throwsInvalidSuit() throws {

        // Given
        let isHigh = true
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Ace(of: .null, and: isHigh)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a low`Ace` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_initLowAce_withNonStandardPlayingCardSuit_throwsInvalidSuit()
        throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Ace(of: .stars)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that creating a high`Ace` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_initHighAce_withNonStandardPlayingCardSuit_throwsInvalidSuit()
        throws {

        // Given
        let isHigh = true
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Ace(of: .stars, and: isHigh)) { error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }

    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                isHigh                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a default `Ace` is low.
    func test_defaultAce_isHigh_false() throws {

        // Given
        let lowAce = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertFalse(lowAce.isHigh)
    }
    
    /// Tests that an`Ace` created with a high status is high.
    func test_Ace_isHigh_true() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(highAce.isHigh)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of a low `Ace` created with a `hearts Suit` equals `hearts`.
    func test_lowAceSuit_withHearts_equalsHearts() throws {

        // Given
        let lowAce = try Ace(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = lowAce.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a high `Ace` created with a `hearts Suit` equals `hearts`.
    func test_highAceSuit_withHearts_equalsHearts() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let expected = Suit.hearts

        // When
        let actual = highAce.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a low `Ace` created with a `diamonds Suit` equals `diamonds`.
    func test_lowAceSuit_withDiamonds_equalsDiamonds() throws {

        // Given
        let lowAce = try Ace(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = lowAce.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a high `Ace` created with a `diamonds Suit` equals `diamonds`.
    func test_highAceSuit_withDiamonds_equalsDiamonds() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .diamonds, and: isHigh)
        let expected = Suit.diamonds

        // When
        let actual = highAce.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a low `Ace` created with a `clubs Suit` equals `clubs`.
    func test_lowAceSuit_withClubs_equalsClubs() throws {

        // Given
        let lowAce = try Ace(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = lowAce.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a high `Ace` created with a `clubs Suit` equals `clubs`.
    func test_highAceSuit_withClubs_equalsClubs() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .clubs, and: isHigh)
        let expected = Suit.clubs

        // When
        let actual = highAce.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a low`Ace` created with a `spades Suit` equals `spades`.
    func test_lowAceSuit_withSpades_equalsSpades() throws {

        // Given
        let lowAce = try Ace(of: .spades)
        let expected = Suit.spades

        // When
        let actual = lowAce.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a high `Ace` created with a `spades Suit` equals `spades`.
    func test_highAceSuit_withSpades_equalsSpades() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .spades, and: isHigh)
        let expected = Suit.spades

        // When
        let actual = highAce.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a low `Ace`'s `Rank` equals `ace`.
    func test_rank_ofLowAce_equalsAce() throws {

        // Given
        let lowAce = try Ace(of: .hearts)
        let expected = Rank.ace

        // When
        let actual = lowAce.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that a high `Ace`'s `Rank` equals `ace`.
    func test_rank_ofHighAce_equalsAce() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let expected = Rank.ace

        // When
        let actual = highAce.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a low `Ace`'s position equals 1.
    func test_position_ofLowAce_equals1() throws {

        // Given
        let lowAce = try Ace(of: .hearts)
        let expected = 1

        // When
        let actual = lowAce.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that a high `Ace`'s position equals 14.
    func test_position_ofHighAce_equals14() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let expected = 14

        // When
        let actual = highAce.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a low `Ace`'s points equals 1.
    func test_points_ofLowAce_equals1() throws {

        // Given
        let lowAce = try Ace(of: .hearts)
        let expected = 1

        // When
        let actual = lowAce.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that a high `Ace`'s points equals 1.
    func test_points_ofHighAce_equals1() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let expected = 1

        // When
        let actual = highAce.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a low `Ace` created with a `hearts Suit` equals "Ace Of Hearts".
    func test_lowAceTitle_withHearts_equalsAceOfHearts() throws {

        // Given
        let lowAce = try Ace(of: .hearts)
        let expected = "Ace Of Hearts"

        // When
        let actual = lowAce.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a high`Ace` created with a `hearts Suit` equals "Ace Of Hearts".
    func test_highAceTitle_withHearts_equalsAceOfHearts() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let expected = "Ace Of Hearts"

        // When
        let actual = highAce.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a low `Ace` created with a `diamonds Suit` equals "Ace Of Diamonds".
    func test_lowAceTitle_withDiamonds_equalsAceOfDiamonds() throws {

        // Given
        let lowAce = try Ace(of: .diamonds)
        let expected = "Ace Of Diamonds"

        // When
        let actual = lowAce.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a high `Ace` created with a `diamonds Suit` equals "Ace Of Diamonds".
    func test_highAceTitle_withDiamonds_equalsAceOfDiamonds() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .diamonds, and: isHigh)
        let expected = "Ace Of Diamonds"

        // When
        let actual = highAce.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a low `Ace` created with a `clubs Suit` equals "Ace Of Club".
    func test_lowAceTitle_withClubs_equalsAceOfClubs() throws {

        // Given
        let lowAce = try Ace(of: .clubs)
        let expected = "Ace Of Clubs"

        // When
        let actual = lowAce.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a high `Ace` created with a `clubs Suit` equals "Ace Of Club".
    func test_highAceTitle_withClubs_equalsAceOfClubs() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .clubs, and: isHigh)
        let expected = "Ace Of Clubs"

        // When
        let actual = highAce.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a low `Ace` created with a `spades Suit` equals "Ace Of Spades".
    func test_lowAceTitle_withSpades_equalsAceOfSpades() throws {

        // Given
        let lowAce = try Ace(of: .spades)
        let expected = "Ace Of Spades"

        // When
        let actual = lowAce.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a high `Ace` created with a `spades Suit` equals "Ace Of Spades".
    func test_highAceTitle_withSpades_equalsAceOfSpades() throws {

        // Given
        let isHigh = true
        let highAce = try Ace(of: .spades, and: isHigh)
        let expected = "Ace Of Spades"

        // When
        let actual = highAce.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a low `Ace` is less than a `Two`.
    func test_lowAce_isLessThanTwo_true() throws {
     
        // Given
        let lowAce = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        
        // When/Then
        XCTAssert(lowAce.isLessThan(two))
    }
    
    /// Tests that a low `Ace` is less than a `Two`, using the less than operator.
    func test_lowAce_isLessThanTwoWithOperator_true() throws {
     
        // Given
        let lowAce = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(lowAce, two)
    }
    
    /// Tests that a low `Ace` is less than a high `Ace`.
    func test_lowAce_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let lowAce = try Ace(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(lowAce.isLessThan(highAce))
    }
    
    /// Tests that a low `Ace` is less than a high `Ace`, using the less than operator.
    func test_lowAce_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let lowAce = try Ace(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(lowAce, highAce)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a low `Ace` equals another low`Ace` with the same `Suit`.
    func test_lowAce_equalsLowAceWithSameSuit_true() throws {
     
        // Given
        let lowAce1 = try Ace(of: .hearts)
        let lowAce2 = try Ace(of: .hearts)
        
        // When/Then
        XCTAssert(lowAce1.equals(lowAce2))
    }
    
    /// Tests that a low `Ace` equals another low `Ace` with the same `Suit`, using the equality
    /// operator.
    func test_lowAce_equalsLowAceWithSameSuitUsingOperator_true() throws {
     
        // Given
        let lowAce1 = try Ace(of: .hearts)
        let lowAce2 = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertEqual(lowAce1, lowAce2)
    }
    
    /// Tests that a high `Ace` equals another high `Ace` with the same `Suit`.
    func test_highAce_equalsHighAceWithSameSuit_true() throws {
     
        // Given
        let isHigh = true
        let highAce1 = try Ace(of: .hearts, and: isHigh)
        let highAce2 = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(highAce1.equals(highAce2))
    }
    
    /// Tests that a high `Ace` equals another high `Ace` with the same `Suit`, using the equality
    /// operator.
    func test_highAce_equalsHighAceWithSameSuitUsingperator_true() throws {
     
        // Given
        let isHigh = true
        let highAce1 = try Ace(of: .hearts, and: isHigh)
        let highAce2 = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertEqual(highAce1, highAce2)
    }
    
    /// Tests that a low `Ace` does not equal a high `Ace` with the same `Suit`.
    func test_lowAce_equalsHighAceWithSameSuit_false() throws {
     
        // Given
        let isHigh = true
        let lowAce = try Ace(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertFalse(lowAce.equals(highAce))
    }
    
    /// Tests that a low `Ace` does not equal a high `Ace` with the same `Suit`, using the equality
    /// operator.
    func test_lowAce_equalsHighAceWithSameSuitUsingOperator_false() throws {
     
        // Given
        let isHigh = true
        let lowAce = try Ace(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertNotEqual(lowAce, highAce)
    }
    
    /// Tests that a low `Ace` does not equal another low `Ace` with a different `Suit`.
    func test_lowAce_equalsLowAceWithDifferentSuit_false() throws {
     
        // Given
        let lowAce1 = try Ace(of: .hearts)
        let lowAce2 = try Ace(of: .spades)
        
        // When/Then
        XCTAssertFalse(lowAce1.equals(lowAce2))
    }
    
    /// Tests that a low `Ace` does not equal another low `Ace` with a different `Suit`, using the equality
    /// operator.
    func test_lowAce_equalsLowAceWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let lowAce1 = try Ace(of: .hearts)
        let lowAce2 = try Ace(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(lowAce1, lowAce2)
    }
    
    /// Tests that a high `Ace` does not equal another  high`Ace` with a different `Suit`.
    func test_highAce_equalsHighAceWithDifferentSuit_false() throws {
     
        // Given
        let isHigh = true
        let highAce1 = try Ace(of: .hearts, and: isHigh)
        let highAce2 = try Ace(of: .spades, and: isHigh)
        
        // When/Then
        XCTAssertFalse(highAce1.equals(highAce2))
    }
    
    /// Tests that a high `Ace` does not equal another high `Ace` with a different `Suit`, using the
    /// equality operator.
    func test_highAce_equalsHighAceWithDifferentSuitUsingOperator_false()
    throws {
     
        // Given
        let isHigh = true
        let highAce1 = try Ace(of: .hearts, and: isHigh)
        let highAce2 = try Ace(of: .spades, and: isHigh)
        
        // When/Then
        XCTAssertNotEqual(highAce1, highAce2)
    }
    
    /// Tests that a low `Ace` does not equal a high `Ace` with a different `Suit`.
    func test_lowAce_equalsHighAceWithDifferentSuit_false() throws {
     
        // Given
        let isHigh = true
        let lowAce = try Ace(of: .hearts)
        let highAce = try Ace(of: .spades, and: isHigh)
        
        // When/Then
        XCTAssertFalse(lowAce.equals(highAce))
    }
    
    /// Tests that a low `Ace` does not equal a high `Ace` with a different `Suit`, using the equality
    /// operator.
    func test_lowAce_equalsHighAceWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let isHigh = true
        let lowAce = try Ace(of: .hearts)
        let highAce = try Ace(of: .spades, and: isHigh)
        
        // When/Then
        XCTAssertNotEqual(lowAce, highAce)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a high `Ace` is greater than a low `Ace`, using the greater than operator.
    func test_highAce_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(highAce, ace)
    }
    
    /// Tests that a high `Ace` is greater than a `King`, using the greater than operator.
    func test_highAce_isGreaterThanKingWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let king = try King(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(highAce, king)
    }
    
    //-------------------------------------------------------------------------//
    //                               ranks()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a low `Ace` `Rank`s another low `Ace`.
    func test_lowAce_ranksLowAce_true() throws {
     
        // Given
        let lowAce1 = try Ace(of: .hearts)
        let lowAce2 = try Ace(of: .hearts)
        
        // When/Then
        XCTAssert(lowAce1.ranks(lowAce2))
    }
    
    /// Tests that a high `Ace` `Rank`s another high `Ace`.
    func test_highAce_ranksHighAce_true() throws {
     
        // Given
        let isHigh = true
        let highAce1 = try Ace(of: .hearts, and: isHigh)
        let highAce2 = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(highAce1.ranks(highAce2))
    }
    
    /// Tests that a low `Ace` does not `Rank` a `Two`.
    func test_lowAce_ranksTwo_false() throws {
     
        // Given
        let lowAce = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        
        // When/Then
        XCTAssertFalse(lowAce.ranks(two))
    }
    
    /// Tests that a low `Ace` does not `Rank` a high `Ace`.
    func test_lowAce_ranksHighAce_false() throws {
     
        // Given
        let isHigh = true
        let lowAce = try Ace(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertFalse(lowAce.ranks(highAce))
    }
    
    //-------------------------------------------------------------------------//
    //                             follows()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a low `Ace` follows a `Joker`.
    func test_lowAce_followsAJoker_true() throws {
     
        // Given
        let lowAce = try Ace(of: .hearts)
        let joker = try Joker(color: .red)
        
        // When/Then
        XCTAssert(lowAce.follows(joker))
    }
    
    /// Tests that a high `Ace` follows a `King`.
    func test_highAce_followsAKing_true() throws {
     
        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let king = try King(of: .hearts)
        
        // When/Then
        XCTAssert(highAce.follows(king))
    }
}
