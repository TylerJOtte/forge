//=============================================================================//
//                                                                             //
//  EightTests.swift                                                             //
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

/// Unit tests for an `Eight PlayingCard`.
class EightTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating an `Eight` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Eight(of: .stars)) { error in
            
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
    
    /// Tests that the title of an `Eight` created with a `clubs Suit` equals "Eight Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let eight = try Eight(of: .clubs)
        let expected = "Eight Of Clubs"
        
        // When
        let actual = eight.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Eight` created with a `diamonds Suit` equals "Eight Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let eight = try Eight(of: .diamonds)
        let expected = "Eight Of Diamonds"
        
        // When
        let actual = eight.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Eight` created with a `hearts Suit` equals "Eight Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let eight = try Eight(of: .hearts)
        let expected = "Eight Of Hearts"
        
        // When
        let actual = eight.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Eight` created with a `spades Suit` equals "Eight Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let eight = try Eight(of: .spades)
        let expected = "Eight Of Spades"
        
        // When
        let actual = eight.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of an `Eight` equals `eight`.
    func test_rank_ofAce_equalsEight() throws {
        
        // Given
        let eight = try Eight()
        let expected = Rank.eight
        
        // When
        let actual = eight.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
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
    
    /// Tests that the points of an `Eight` that is not high equals eight.
    func test_points_ofLowAce_equalsEight() throws {
        
        // Given
        let eight = try Eight()
        let expected = 8
        
        // When
        let actual = eight.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of an `Eight` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let eight = try Eight(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = eight.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Eight` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let eight = try Eight(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = eight.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Eight` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let eight = try Eight(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = eight.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Eight` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let eight = try Eight(of: .spades)
        let expected = Color.black
        
        // When
        let actual = eight.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that an `Eight` is less than a high`Ace`.
    func test_isLessThan_EightAndHighAce_true() throws {

        // Given
        let high = true
        let eight = try Eight()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(eight, ace)
    }
    
    /// Tests that an `Eight` is less than an `Nine PlayingCard`.
    func test_isLessThan_EightAndNine_true() throws {

        // Given
        let eight = try Eight()
        let nine = try Nine()

        // When/Then
        XCTAssertLessThan(eight, nine)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Eight`s with the same `Suit` are equal.
    func test_equals_EightsWithSameSuit_true() throws {
        
        // Given
        let eight1 = try Eight(of: .spades)
        let eight2 = try Eight(of: .spades)
        
        // When/Then
        XCTAssertEqual(eight1, eight2)
    }
    
    /// Tests that `Eight`s with the different `Suit`s are equal.
    func test_equals_EightsWithDifferentSuits_true() throws {
        
        // Given
        let eight1 = try Eight(of: .hearts)
        let eight2 = try Eight(of: .spades)
        
        // When/Then
        XCTAssertEqual(eight1, eight2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that an `Eight` is greater than a `Seven`.
    func test_isGreaterThan_EightAndSeven_true() throws {

        // Given
        let eight = try Eight()
        let seven = try Seven()

        // When/Then
        XCTAssertGreaterThan(eight, seven)
    }
}
