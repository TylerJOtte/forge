//=============================================================================//
//                                                                             //
//  TwoTests.swift                                                             //
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

/// Unit tests for a `Two PlayingCard`.
class TwoTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating an `Two` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Two(of: .stars)) { error in
            
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
    
    /// Tests that the title of an `Two` created with a `clubs Suit` equals "Two Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let two = try Two(of: .clubs)
        let expected = "Two Of Clubs"
        
        // When
        let actual = two.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Two` created with a `diamonds Suit` equals "Two Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let two = try Two(of: .diamonds)
        let expected = "Two Of Diamonds"
        
        // When
        let actual = two.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Two` created with a `hearts Suit` equals "Two Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let two = try Two(of: .hearts)
        let expected = "Two Of Hearts"
        
        // When
        let actual = two.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Two` created with a `spades Suit` equals "Two Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let two = try Two(of: .spades)
        let expected = "Two Of Spades"
        
        // When
        let actual = two.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of an `Two` equals `two`.
    func test_rank_ofAce_equalsTwo() throws {
        
        // Given
        let two = try Two()
        let expected = Rank.two
        
        // When
        let actual = two.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of an `Two` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let two = try Two(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = two.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Two` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let two = try Two(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = two.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Two` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let two = try Two(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = two.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Two` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {
        
        // Given
        let two = try Two(of: .spades)
        let expected = Suit.spades
        
        // When
        let actual = two.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of an `Two` that is not high equals two.
    func test_points_ofLowAce_equalsTwo() throws {
        
        // Given
        let two = try Two()
        let expected = 2
        
        // When
        let actual = two.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of an `Two` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let two = try Two(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = two.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Two` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let two = try Two(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = two.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Two` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let two = try Two(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = two.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Two` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let two = try Two(of: .spades)
        let expected = Color.black
        
        // When
        let actual = two.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Two` is less than a high`Ace`.
    func test_isLessThan_TwoAndHighAce_true() throws {

        // Given
        let high = true
        let two = try Two()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(two, ace)
    }
    
    /// Tests that a`Two` is less than a `Three PlayingCard`.
    func test_isLessThan_TwoAndThree_true() throws {

        // Given
        let two = try Two()
        let three = try Three()

        // When/Then
        XCTAssertLessThan(two, three)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Two`s with the same `Suit` are equal.
    func test_equals_TwosWithSameSuit_true() throws {
        
        // Given
        let two1 = try Two(of: .spades)
        let two2 = try Two(of: .spades)
        
        // When/Then
        XCTAssertEqual(two1, two2)
    }
    
    /// Tests that `Two`s with the different `Suit`s are equal.
    func test_equals_TwosWithDifferentSuits_true() throws {
        
        // Given
        let two1 = try Two(of: .hearts)
        let two2 = try Two(of: .spades)
        
        // When/Then
        XCTAssertEqual(two1, two2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Two` is greater than a low `Ace`.
    func test_isGreaterThan_TwoAndLowAce_true() throws {

        // Given
        let two = try Two()
        let ace = try Ace()

        // When/Then
        XCTAssertGreaterThan(two, ace)
    }
}
