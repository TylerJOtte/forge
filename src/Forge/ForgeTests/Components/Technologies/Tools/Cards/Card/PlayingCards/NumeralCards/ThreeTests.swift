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
import SwiftUI
@testable import Forge

/// Unit tests for a `Three PlayingCard`.
class ThreeTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating an `Three` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Three(of: .stars)) { error in
            
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
    
    /// Tests that the title of an `Three` created with a `clubs Suit` equals "Three Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let three = try Three(of: .clubs)
        let expected = "Three Of Clubs"
        
        // When
        let actual = three.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Three` created with a `diamonds Suit` equals "Three Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let three = try Three(of: .diamonds)
        let expected = "Three Of Diamonds"
        
        // When
        let actual = three.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Three` created with a `hearts Suit` equals "Three Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let three = try Three(of: .hearts)
        let expected = "Three Of Hearts"
        
        // When
        let actual = three.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Three` created with a `spades Suit` equals "Three Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let three = try Three(of: .spades)
        let expected = "Three Of Spades"
        
        // When
        let actual = three.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of an `Three` equals `three`.
    func test_rank_ofAce_equalsThree() throws {
        
        // Given
        let three = try Three()
        let expected = Rank.three
        
        // When
        let actual = three.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of an `Three` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let three = try Three(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = three.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Three` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let three = try Three(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = three.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Three` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let three = try Three(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = three.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Three` created with a `spades Suit` equals `spades`.
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
    
    /// Tests that the points of an `Three` that is not high equals three.
    func test_points_ofLowAce_equalsThree() throws {
        
        // Given
        let three = try Three()
        let expected = 3
        
        // When
        let actual = three.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of an `Three` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let three = try Three(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = three.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Three` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let three = try Three(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = three.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Three` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let three = try Three(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = three.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Three` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let three = try Three(of: .spades)
        let expected = Color.black
        
        // When
        let actual = three.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Three` is less than a high`Ace`.
    func test_isLessThan_ThreeAndHighAce_true() throws {

        // Given
        let high = true
        let three = try Three()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(three, ace)
    }
    
    /// Tests that a`Three` is less than a `Four PlayingCard`.
    func test_isLessThan_ThreeAndFour_true() throws {

        // Given
        let three = try Three()
        let four = try Four()

        // When/Then
        XCTAssertLessThan(three, four)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Three`s with the same `Suit` are equal.
    func test_equals_ThreesWithSameSuit_true() throws {
        
        // Given
        let three1 = try Three(of: .spades)
        let three2 = try Three(of: .spades)
        
        // When/Then
        XCTAssertEqual(three1, three2)
    }
    
    /// Tests that `Three`s with the different `Suit`s are equal.
    func test_equals_ThreesWithDifferentSuits_true() throws {
        
        // Given
        let three1 = try Three(of: .hearts)
        let three2 = try Three(of: .spades)
        
        // When/Then
        XCTAssertEqual(three1, three2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Three` is greater than a `Two`.
    func test_isGreaterThan_ThreeAndTwo_true() throws {

        // Given
        let three = try Three()
        let two = try Two()

        // When/Then
        XCTAssertGreaterThan(three, two)
    }
}
