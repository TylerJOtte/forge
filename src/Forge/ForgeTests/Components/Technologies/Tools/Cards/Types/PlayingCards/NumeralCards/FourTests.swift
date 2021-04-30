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
import SwiftUI
@testable import Forge

/// Unit tests for a `Four PlayingCard`.
class FourTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating an `Four` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Four(of: .stars)) { error in
            
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
    
    /// Tests that the title of an `Four` created with a `clubs Suit` equals "Four Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let four = try Four(of: .clubs)
        let expected = "Four Of Clubs"
        
        // When
        let actual = four.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Four` created with a `diamonds Suit` equals "Four Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let four = try Four(of: .diamonds)
        let expected = "Four Of Diamonds"
        
        // When
        let actual = four.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Four` created with a `hearts Suit` equals "Four Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let four = try Four(of: .hearts)
        let expected = "Four Of Hearts"
        
        // When
        let actual = four.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Four` created with a `spades Suit` equals "Four Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let four = try Four(of: .spades)
        let expected = "Four Of Spades"
        
        // When
        let actual = four.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of an `Four` equals `four`.
    func test_rank_ofAce_equalsFour() throws {
        
        // Given
        let four = try Four()
        let expected = Rank.four
        
        // When
        let actual = four.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of an `Four` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let four = try Four(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = four.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Four` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let four = try Four(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = four.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Four` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let four = try Four(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = four.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Four` created with a `spades Suit` equals `spades`.
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
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of an `Four` that is not high equals four.
    func test_points_ofLowAce_equalsFour() throws {
        
        // Given
        let four = try Four()
        let expected = 4
        
        // When
        let actual = four.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of an `Four` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let four = try Four(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = four.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Four` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let four = try Four(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = four.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Four` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let four = try Four(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = four.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Four` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let four = try Four(of: .spades)
        let expected = Color.black
        
        // When
        let actual = four.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Four` is less than a high`Ace`.
    func test_isLessThan_FourAndHighAce_true() throws {

        // Given
        let high = true
        let four = try Four()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(four, ace)
    }
    
    /// Tests that a`Four` is less than a `Five PlayingCard`.
    func test_isLessThan_FourAndFive_true() throws {

        // Given
        let four = try Four()
        let five = try Five()

        // When/Then
        XCTAssertLessThan(four, five)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Four`s with the same `Suit` are equal.
    func test_equals_FoursWithSameSuit_true() throws {
        
        // Given
        let four1 = try Four(of: .spades)
        let four2 = try Four(of: .spades)
        
        // When/Then
        XCTAssertEqual(four1, four2)
    }
    
    /// Tests that `Four`s with the different `Suit`s are equal.
    func test_equals_FoursWithDifferentSuits_true() throws {
        
        // Given
        let four1 = try Four(of: .hearts)
        let four2 = try Four(of: .spades)
        
        // When/Then
        XCTAssertEqual(four1, four2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Four` is greater than a `Three`.
    func test_isGreaterThan_FourAndThree_true() throws {

        // Given
        let four = try Four()
        let three = try Three()

        // When/Then
        XCTAssertGreaterThan(four, three)
    }
}
