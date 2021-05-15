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

    /// Tests that creating a`Ace` with a non-standard `PlayingCard Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withNonStandardPlayingCardSuit_throwsInvalidSuit() throws {

        // Given
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Ace(of: .stars)) { error in

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

    /// Tests that an `Ace`'s `Rank` equals `ace`.
    func test_rank_ofAce_equalsAce() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let expected = Rank.ace

        // When
        let actual = ace.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of an `Ace` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let expected = Suit.hearts

        // When
        let actual = ace.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Ace` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {

        // Given
        let ace = try Ace(of: .diamonds)
        let expected = Suit.diamonds

        // When
        let actual = ace.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Ace` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {

        // Given
        let ace = try Ace(of: .clubs)
        let expected = Suit.clubs

        // When
        let actual = ace.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Ace` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {

        // Given
        let ace = try Ace(of: .spades)
        let expected = Suit.spades

        // When
        let actual = ace.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that an `Ace`'s points equals 1.
    func test_points_ofAce_equals1() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let expected = 1

        // When
        let actual = ace.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of an `Ace` created with a `hearts Suit` equals "Ace Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let expected = "Ace Of Hearts"

        // When
        let actual = ace.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Ace` created with a `diamonds Suit` equals "Ace Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {

        // Given
        let ace = try Ace(of: .diamonds)
        let expected = "Ace Of Diamonds"

        // When
        let actual = ace.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Ace` created with a `clubs Suit` equals "Ace Of Club".
    func test_title_withClubs_equalsAceOfClubs() throws {

        // Given
        let ace = try Ace(of: .clubs)
        let expected = "Ace Of Clubs"

        // When
        let actual = ace.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Ace` created with a `spades Suit` equals "Ace Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {

        // Given
        let ace = try Ace(of: .spades)
        let expected = "Ace Of Spades"

        // When
        let actual = ace.title

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
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        
        // When/Then
        XCTAssertLessThan(ace, two)
    }
    
    /// Tests that a low `Ace` is less than a high `Ace`.
    func test_lowAce_isLessThanHighAce_true() throws {
     
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
    
    /// Tests that a low `Ace` equals another low `Ace` with the same `Suit`.
    func test_lowAce_equalsLowAceWithSameSuit_true() throws {
     
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
        XCTAssertEqual(highAce1, highAce2)
    }
    
    /// Tests that a low `Ace` equals another high `Ace` with the same `Suit`.
    func test_lowAce_equalsHighAceWithSameSuit_true() throws {
     
        // Given
        let isHigh = true
        let lowAce = try Ace(of: .hearts)
        let highAce = try Ace(of: .hearts, and: isHigh)
        
        // When/Then
        XCTAssertEqual(lowAce, highAce)
    }
    
    /// Tests that a low `Ace` does not equal another low `Ace` with a different `Suit`.
    func test_lowAce_equalsLowAceWithDifferentSuit_false() throws {
     
        // Given
        let lowAce1 = try Ace(of: .hearts)
        let lowAce2 = try Ace(of: .spades)
        
        // When/Then
        XCTAssertNotEqual(lowAce1, lowAce2)
    }
    
    /// Tests that a high `Ace` does not equal another high `Ace` with a different `Suit`.
    func test_highAce_equalsHighAceWithDifferentSuit_false() throws {
     
        // Given
        let isHigh = true
        let highAce1 = try Ace(of: .hearts, and: isHigh)
        let highAce2 = try Ace(of: .spades, and: isHigh)
        
        // When/Then
        XCTAssertNotEqual(highAce1, highAce2)
    }
    
    /// Tests that a low `Ace` does not equal another high `Ace` with a different `Suit`.
    func test_lowAce_equalsHighAceWithDifferentSuit_false() throws {
     
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
    
    /// Tests that a high `Ace` is greater than a low `Ace`.
    func test_highAce_isGreaterThanLowAce_true() throws {
     
        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let ace = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(highAce, ace)
    }
    
    /// Tests that a high `Ace` is greater than a `King`.
    func test_highAce_isGreaterThanKing_true() throws {
     
        // Given
        let isHigh = true
        let highAce = try Ace(of: .hearts, and: isHigh)
        let king = try King(of: .hearts)
        
        // When/Then
        XCTAssertGreaterThan(highAce, king)
    }
}
