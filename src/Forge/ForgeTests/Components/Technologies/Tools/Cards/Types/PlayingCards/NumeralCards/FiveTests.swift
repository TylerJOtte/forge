//=============================================================================//
//                                                                             //
//  FiveTests.swift                                                            //
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

/// Unit tests for a `Five PlayingCard`.
class FiveTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating an `Five` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Five(of: .stars)) { error in
            
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
    
    /// Tests that the title of an `Five` created with a `clubs Suit` equals "Five Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let five = try Five(of: .clubs)
        let expected = "Five Of Clubs"
        
        // When
        let actual = five.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Five` created with a `diamonds Suit` equals "Five Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let five = try Five(of: .diamonds)
        let expected = "Five Of Diamonds"
        
        // When
        let actual = five.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Five` created with a `hearts Suit` equals "Five Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let five = try Five(of: .hearts)
        let expected = "Five Of Hearts"
        
        // When
        let actual = five.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Five` created with a `spades Suit` equals "Five Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let five = try Five(of: .spades)
        let expected = "Five Of Spades"
        
        // When
        let actual = five.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of an `Five` equals `five`.
    func test_rank_ofAce_equalsFive() throws {
        
        // Given
        let five = try Five()
        let expected = Rank.five
        
        // When
        let actual = five.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of an `Five` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let five = try Five(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = five.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Five` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let five = try Five(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = five.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Five` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let five = try Five(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = five.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Five` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {
        
        // Given
        let five = try Five(of: .spades)
        let expected = Suit.spades
        
        // When
        let actual = five.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of an `Five` that is not high equals five.
    func test_points_ofLowAce_equalsFive() throws {
        
        // Given
        let five = try Five()
        let expected = 5
        
        // When
        let actual = five.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of an `Five` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let five = try Five(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = five.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Five` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let five = try Five(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = five.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Five` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let five = try Five(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = five.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Five` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let five = try Five(of: .spades)
        let expected = Color.black
        
        // When
        let actual = five.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Five` is less than a high`Ace`.
    func test_isLessThan_FiveAndHighAce_true() throws {

        // Given
        let high = true
        let five = try Five()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(five, ace)
    }
    
    /// Tests that a`Five` is less than a `Six PlayingCard`.
    func test_isLessThan_FiveAndSix_true() throws {

        // Given
        let five = try Five()
        let six = try Six()

        // When/Then
        XCTAssertLessThan(five, six)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Five`s with the same `Suit` are equal.
    func test_equals_FivesWithSameSuit_true() throws {
        
        // Given
        let five1 = try Five(of: .spades)
        let five2 = try Five(of: .spades)
        
        // When/Then
        XCTAssertEqual(five1, five2)
    }
    
    /// Tests that `Five`s with the different `Suit`s are equal.
    func test_equals_FivesWithDifferentSuits_true() throws {
        
        // Given
        let five1 = try Five(of: .hearts)
        let five2 = try Five(of: .spades)
        
        // When/Then
        XCTAssertEqual(five1, five2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Five` is greater than a `Four`.
    func test_isGreaterThan_FiveAndFour_true() throws {

        // Given
        let five = try Five()
        let four = try Four()

        // When/Then
        XCTAssertGreaterThan(five, four)
    }
}
