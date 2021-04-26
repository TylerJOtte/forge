//=============================================================================//
//                                                                             //
//  SevenTests.swift                                                             //
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

/// Unit tests for a `Seven PlayingCard`.
class SevenTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating an `Seven` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Seven(of: .stars)) { error in
            
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
    
    /// Tests that the title of an `Seven` created with a `clubs Suit` equals "Seven Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let seven = try Seven(of: .clubs)
        let expected = "Seven Of Clubs"
        
        // When
        let actual = seven.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Seven` created with a `diamonds Suit` equals "Seven Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let seven = try Seven(of: .diamonds)
        let expected = "Seven Of Diamonds"
        
        // When
        let actual = seven.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Seven` created with a `hearts Suit` equals "Seven Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let seven = try Seven(of: .hearts)
        let expected = "Seven Of Hearts"
        
        // When
        let actual = seven.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Seven` created with a `spades Suit` equals "Seven Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let seven = try Seven(of: .spades)
        let expected = "Seven Of Spades"
        
        // When
        let actual = seven.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of an `Seven` equals `seven`.
    func test_rank_ofAce_equalsSeven() throws {
        
        // Given
        let seven = try Seven()
        let expected = Rank.seven
        
        // When
        let actual = seven.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of an `Seven` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let seven = try Seven(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = seven.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Seven` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let seven = try Seven(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = seven.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Seven` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let seven = try Seven(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = seven.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Seven` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {
        
        // Given
        let seven = try Seven(of: .spades)
        let expected = Suit.spades
        
        // When
        let actual = seven.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of an `Seven` that is not high equals seven.
    func test_points_ofLowAce_equalsSeven() throws {
        
        // Given
        let seven = try Seven()
        let expected = 7
        
        // When
        let actual = seven.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of an `Seven` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let seven = try Seven(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = seven.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Seven` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let seven = try Seven(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = seven.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Seven` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let seven = try Seven(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = seven.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Seven` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let seven = try Seven(of: .spades)
        let expected = Color.black
        
        // When
        let actual = seven.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Seven` is less than a high`Ace`.
    func test_isLessThan_SevenAndHighAce_true() throws {

        // Given
        let high = true
        let seven = try Seven()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(seven, ace)
    }
    
    /// Tests that a`Seven` is less than an `Eight PlayingCard`.
    func test_isLessThan_SevenAndEight_true() throws {

        // Given
        let seven = try Seven()
        let eight = try Eight()

        // When/Then
        XCTAssertLessThan(seven, eight)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Seven`s with the same `Suit` are equal.
    func test_equals_SevensWithSameSuit_true() throws {
        
        // Given
        let seven1 = try Seven(of: .spades)
        let seven2 = try Seven(of: .spades)
        
        // When/Then
        XCTAssertEqual(seven1, seven2)
    }
    
    /// Tests that `Seven`s with the different `Suit`s are equal.
    func test_equals_SevensWithDifferentSuits_true() throws {
        
        // Given
        let seven1 = try Seven(of: .hearts)
        let seven2 = try Seven(of: .spades)
        
        // When/Then
        XCTAssertEqual(seven1, seven2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Seven` is greater than a `Six`.
    func test_isGreaterThan_SevenAndSix_true() throws {

        // Given
        let seven = try Seven()
        let six = try Six()

        // When/Then
        XCTAssertGreaterThan(seven, six)
    }
}
