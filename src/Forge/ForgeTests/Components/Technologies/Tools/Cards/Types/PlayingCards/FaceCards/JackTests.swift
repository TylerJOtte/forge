//=============================================================================//
//                                                                             //
//  JackTests.swift                                                            //
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

/// Unit tests for a `Jack PlayingCard`.
class JackTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a`Jack` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Jack(of: .stars)) { error in

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

    /// Tests that a `Jack`'s `Rank` equals `jack`.
    func test_rank_ofJack_equalsJack() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let expected = Rank.jack

        // When
        let actual = jack.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of a `Jack` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = jack.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Jack` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let jack = try Jack(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = jack.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Jack` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let jack = try Jack(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = jack.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Jack` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let jack = try Jack(of: .spades)
        let expected = Suit.spades

        // When
        let actual = jack.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Jack`'s points equals 10.
    func test_points_ofJack_equals10() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let expected = 10

        // When
        let actual = jack.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Jack`'s position equals 11.
    func test_position_ofJack_equals11() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let expected = 11

        // When
        let actual = jack.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Jack` created with a `hearts Suit` equals "Jack Of Hearts".
    func test_title_withHearts_equalsJackOfHearts() throws {

        // Given
        let jack = try Jack(of: .hearts)
        let expected = "Jack Of Hearts"

        // When
        let actual = jack.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Jack` created with a `diamonds Suit` equals "Jack Of Diamonds".
    func test_title_withDiamonds_equalsJackOfDiamonds() throws {

        // Given
        let jack = try Jack(of: .diamonds)
        let expected = "Jack Of Diamonds"

        // When
        let actual = jack.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Jack` created with a `clubs Suit` equals "Jack Of Club".
    func test_title_withClubs_equalsJackOfClubs() throws {

        // Given
        let jack = try Jack(of: .clubs)
        let expected = "Jack Of Clubs"

        // When
        let actual = jack.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Jack` created with a `spades Suit` equals "Jack Of Spades".
    func test_title_withSpades_equalsJackOfSpades() throws {

        // Given
        let jack = try Jack(of: .spades)
        let expected = "Jack Of Spades"

        // When
        let actual = jack.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Jack` is less than a `Queen`.
    func test_jack_isLessThanQueen_true() throws {
     
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        
        // When/Then
        XCTAssert(jack.isLessThan(queen))
    }
    
    /// Tests that a `Jack` is less than a `Queen`, using the less than operator.
    func test_jack_isLessThanQueenWithOperator_true() throws {
     
        // Given
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(jack, queen       )
    }
    
    /// Tests that a `Jack` is less than a high `Ace`.
    func test_jack_isLessThanHighAce_true() throws {
     
        // Given
        let isHigh = true
        let jack = try Jack(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssert(jack.isLessThan(highAce))
    }
    
    /// Tests that a `Jack` is less than a high `Ace`, using the less than operator.
    func test_jack_isLessThanHighAceWithOperator_true() throws {
     
        // Given
        let isHigh = true
        let jack = try Jack(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertLessThan(jack, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Jack` equals another `Jack` with the same `Suit`.
    func test_jack_equalsJackWithSameSuit_true() throws {
     
        // Given
        let card1 = try Jack(of: .hearts)
        let card2 = try Jack(of: .hearts)
        
        // When/Then
        XCTAssert(card1.equals(card2))
    }
    
    /// Tests that a `Jack` equals another `Jack` with the same `Suit`, using the equality operator.
    func test_jack_equalsJackWithSameSuitUsingOperator_true() throws {
     
        // Given
        let card1 = try Jack(of: .hearts)
        let card2 = try Jack(of: .hearts)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a `Jack` does not equal another `Jack` with a different `Suit`.
    func test_jack_equalsJackWithDifferentSuit_false() throws {
     
        // Given
        let card1 = try Jack(of: .hearts)
        let card2 = try Jack(of: .spades)
        
        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }
    
    /// Tests that a `Jack` does not equal another `Jack` with a different `Suit`, using the equality
    /// operator.
    func test_jack_equalsJackWithDifferentSuitUsingOperator_false() throws {
     
        // Given
        let card1 = try Jack(of: .hearts)
        let card2 = try Jack(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  >                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Jack` is greater than a low `Ace`, using the greater than operator.
    func test_jack_isGreaterThanLowAceWithOperator_true() throws {
     
        // Given
        let jack = try Jack(of: .hearts)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(jack, ace)
    }
    
    /// Tests that a `Jack` is greater than a `Ten`, using the greater than operator.
    func test_jack_isGreaterThanEightWithOperator_true() throws {
     
        // Given
        let jack = try Jack(of: .hearts)
        let ten = try Ten(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(jack, ten)
    }
}
