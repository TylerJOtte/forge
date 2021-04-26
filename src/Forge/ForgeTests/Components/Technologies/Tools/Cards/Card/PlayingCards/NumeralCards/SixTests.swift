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
import SwiftUI
@testable import Forge

/// Unit tests for a `Six PlayingCard`.
class SixTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating an `Six` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Six(of: .stars)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? FeatureError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of an `Six` created with a `clubs Suit` equals "Six Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let six = try Six(of: .clubs)
        let expected = "Six Of Clubs"
        
        // When
        let actual = six.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Six` created with a `diamonds Suit` equals "Six Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let six = try Six(of: .diamonds)
        let expected = "Six Of Diamonds"
        
        // When
        let actual = six.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Six` created with a `hearts Suit` equals "Six Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let six = try Six(of: .hearts)
        let expected = "Six Of Hearts"
        
        // When
        let actual = six.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Six` created with a `spades Suit` equals "Six Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let six = try Six(of: .spades)
        let expected = "Six Of Spades"
        
        // When
        let actual = six.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of an `Six` equals `six`.
    func test_rank_ofAce_equalsSix() throws {
        
        // Given
        let six = try Six()
        let expected = Rank.six
        
        // When
        let actual = six.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of an `Six` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let six = try Six(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = six.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Six` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let six = try Six(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = six.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Six` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let six = try Six(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = six.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Six` created with a `spades Suit` equals `spades`.
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
    
    /// Tests that the points of an `Six` that is not high equals six.
    func test_points_ofLowAce_equalsSix() throws {
        
        // Given
        let six = try Six()
        let expected = 6
        
        // When
        let actual = six.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of an `Six` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let six = try Six(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = six.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Six` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let six = try Six(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = six.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Six` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let six = try Six(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = six.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Six` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let six = try Six(of: .spades)
        let expected = Color.black
        
        // When
        let actual = six.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Six` is less than a high`Ace`.
    func test_isLessThan_SixAndHighAce_true() throws {

        // Given
        let high = true
        let six = try Six()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(six, ace)
    }
    
    /// Tests that a`Six` is less than a `Seven PlayingCard`.
    func test_isLessThan_SixAndSeven_true() throws {

        // Given
        let six = try Six()
        let seven = try Seven()

        // When/Then
        XCTAssertLessThan(six, seven)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Six`s with the same `Suit` are equal.
    func test_equals_SixsWithSameSuit_true() throws {
        
        // Given
        let six1 = try Six(of: .spades)
        let six2 = try Six(of: .spades)
        
        // When/Then
        XCTAssertEqual(six1, six2)
    }
    
    /// Tests that `Six`s with the different `Suit`s are equal.
    func test_equals_SixsWithDifferentSuits_true() throws {
        
        // Given
        let six1 = try Six(of: .hearts)
        let six2 = try Six(of: .spades)
        
        // When/Then
        XCTAssertEqual(six1, six2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Six` is greater than a `Five`.
    func test_isGreaterThan_SixAndFive_true() throws {

        // Given
        let six = try Six()
        let five = try Five()

        // When/Then
        XCTAssertGreaterThan(six, five)
    }
}
