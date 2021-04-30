//=============================================================================//
//                                                                             //
//  NineTests.swift                                                            //
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

/// Unit tests for a `Nine PlayingCard`.
class NineTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Nine` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Nine(of: .stars)) { error in
            
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
    
    /// Tests that the title of a `Nine` created with a `clubs Suit` equals "Nine Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let nine = try Nine(of: .clubs)
        let expected = "Nine Of Clubs"
        
        // When
        let actual = nine.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Nine` created with a `diamonds Suit` equals "Nine Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let nine = try Nine(of: .diamonds)
        let expected = "Nine Of Diamonds"
        
        // When
        let actual = nine.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Nine` created with a `hearts Suit` equals "Nine Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let nine = try Nine(of: .hearts)
        let expected = "Nine Of Hearts"
        
        // When
        let actual = nine.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Nine` created with a `spades Suit` equals "Nine Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let nine = try Nine(of: .spades)
        let expected = "Nine Of Spades"
        
        // When
        let actual = nine.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of a `Nine` equals `nine`.
    func test_rank_ofAce_equalsNine() throws {
        
        // Given
        let nine = try Nine()
        let expected = Rank.nine
        
        // When
        let actual = nine.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of a `Nine` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let nine = try Nine(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = nine.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Nine` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let nine = try Nine(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = nine.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Nine` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let nine = try Nine(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = nine.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Nine` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {
        
        // Given
        let nine = try Nine(of: .spades)
        let expected = Suit.spades
        
        // When
        let actual = nine.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a `Nine` that is not high equals nine.
    func test_points_ofLowAce_equalsNine() throws {
        
        // Given
        let nine = try Nine()
        let expected = 9
        
        // When
        let actual = nine.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of a `Nine` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let nine = try Nine(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = nine.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Nine` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let nine = try Nine(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = nine.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Nine` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let nine = try Nine(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = nine.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Nine` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let nine = try Nine(of: .spades)
        let expected = Color.black
        
        // When
        let actual = nine.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Nine` is less than a high`Ace`.
    func test_isLessThan_NineAndHighAce_true() throws {

        // Given
        let high = true
        let nine = try Nine()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(nine, ace)
    }
    
    /// Tests that a `Nine` is less than an `Ten PlayingCard`.
    func test_isLessThan_NineAndTen_true() throws {

        // Given
        let nine = try Nine()
        let ten = try Ten()

        // When/Then
        XCTAssertLessThan(nine, ten)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Nine`s with the same `Suit` are equal.
    func test_equals_NinesWithSameSuit_true() throws {
        
        // Given
        let nine1 = try Nine(of: .spades)
        let nine2 = try Nine(of: .spades)
        
        // When/Then
        XCTAssertEqual(nine1, nine2)
    }
    
    /// Tests that `Nine`s with the different `Suit`s are equal.
    func test_equals_NinesWithDifferentSuits_true() throws {
        
        // Given
        let nine1 = try Nine(of: .hearts)
        let nine2 = try Nine(of: .spades)
        
        // When/Then
        XCTAssertEqual(nine1, nine2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Nine` is greater than an `Eight`.
    func test_isGreaterThan_NineAndEight_true() throws {

        // Given
        let nine = try Nine()
        let eight = try Eight()

        // When/Then
        XCTAssertGreaterThan(nine, eight)
    }
}
