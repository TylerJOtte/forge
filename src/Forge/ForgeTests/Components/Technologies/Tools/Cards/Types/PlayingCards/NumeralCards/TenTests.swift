//=============================================================================//
//                                                                             //
//  TenTests.swift                                                             //
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

/// Unit tests for a `Ten PlayingCard`.
class TenTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Ten` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Ten(of: .stars)) { error in
            
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
    
    /// Tests that the title of a `Ten` created with a `clubs Suit` equals "Ten Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let ten = try Ten(of: .clubs)
        let expected = "Ten Of Clubs"
        
        // When
        let actual = ten.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Ten` created with a `diamonds Suit` equals "Ten Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let ten = try Ten(of: .diamonds)
        let expected = "Ten Of Diamonds"
        
        // When
        let actual = ten.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Ten` created with a `hearts Suit` equals "Ten Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let expected = "Ten Of Hearts"
        
        // When
        let actual = ten.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Ten` created with a `spades Suit` equals "Ten Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let ten = try Ten(of: .spades)
        let expected = "Ten Of Spades"
        
        // When
        let actual = ten.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of a `Ten` equals `ten`.
    func test_rank_ofAce_equalsTen() throws {
        
        // Given
        let ten = try Ten()
        let expected = Rank.ten
        
        // When
        let actual = ten.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of a `Ten` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let ten = try Ten(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = ten.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Ten` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let ten = try Ten(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = ten.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Ten` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = ten.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Ten` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {
        
        // Given
        let ten = try Ten(of: .spades)
        let expected = Suit.spades
        
        // When
        let actual = ten.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a `Ten` that is not high equals ten.
    func test_points_ofLowAce_equalsTen() throws {
        
        // Given
        let ten = try Ten()
        let expected = 10
        
        // When
        let actual = ten.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of a `Ten` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let ten = try Ten(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = ten.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Ten` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let ten = try Ten(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = ten.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Ten` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = ten.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Ten` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let ten = try Ten(of: .spades)
        let expected = Color.black
        
        // When
        let actual = ten.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Ten` is less than a high`Ace`.
    func test_isLessThan_TenAndHighAce_true() throws {

        // Given
        let high = true
        let ten = try Ten()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(ten, ace)
    }
    
    /// Tests that a `Ten` is less than a `Jack PlayingCard`.
    func test_isLessThan_TenAndJack_true() throws {

        // Given
        let ten = try Ten()
        let jack = try Jack()

        // When/Then
        XCTAssertLessThan(ten, jack)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Ten`s with the same `Suit` are equal.
    func test_equals_TensWithSameSuit_true() throws {
        
        // Given
        let ten1 = try Ten(of: .spades)
        let ten2 = try Ten(of: .spades)
        
        // When/Then
        XCTAssertEqual(ten1, ten2)
    }
    
    /// Tests that `Ten`s with the different `Suit`s are equal.
    func test_equals_TensWithDifferentSuits_true() throws {
        
        // Given
        let ten1 = try Ten(of: .hearts)
        let ten2 = try Ten(of: .spades)
        
        // When/Then
        XCTAssertEqual(ten1, ten2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Ten` is greater than a `Nine`.
    func test_isGreaterThan_TenAndNine_true() throws {

        // Given
        let ten = try Ten()
        let nine = try Nine()

        // When/Then
        XCTAssertGreaterThan(ten, nine)
    }
}
