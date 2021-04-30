//=============================================================================//
//                                                                             //
//  JackTests.swift                                                            //
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

/// Unit tests for a `Jack PlayingCard`.
class JackTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Jack` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Jack(of: .stars)) { error in
            
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
    
    /// Tests that the title of a `Jack` created with a `clubs Suit` equals "Jack Of Clubs".
    func test_title_withClubs_equalsJackOfClubs() throws {
        
        // Given
        let jack = try Jack(of: .clubs)
        let expected = "Jack Of Clubs"
        
        // When
        let actual = jack.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Jack` created with a `diamonds Suit` equals "Jack Of Diamonds".
    func test_title_withDiamonds_equalsJackOfDiamonds() throws {
        
        // Given
        let jack = try Jack(of: .diamonds)
        let expected = "Jack Of Diamonds"
        
        // When
        let actual = jack.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Jack` created with a `hearts Suit` equals "Jack Of Hearts".
    func test_title_withHearts_equalsJackOfHearts() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let expected = "Jack Of Hearts"
        
        // When
        let actual = jack.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Jack` created with a `spades Suit` equals "Jack Of Spades".
    func test_title_withSpades_equalsJackOfSpades() throws {
        
        // Given
        let jack = try Jack(of: .spades)
        let expected = "Jack Of Spades"
        
        // When
        let actual = jack.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of a `Jack` equals `jack`.
    func test_rank_ofJack_equalsJack() throws {
        
        // Given
        let jack = try Jack()
        let expected = Rank.jack
        
        // When
        let actual = jack.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of a `Jack` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let jack = try Jack(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = jack.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Jack` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let jack = try Jack(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = jack.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Jack` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = jack.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Jack` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {
        
        // Given
        let jack = try Jack(of: .spades)
        let expected = Suit.spades
        
        // When
        let actual = jack.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a `Jack` equals 10.
    func test_points_ofJack_equals10() throws {
        
        // Given
        let jack = try Jack()
        let expected = 10
        
        // When
        let actual = jack.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of a `Jack` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let jack = try Jack(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = jack.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Jack` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let jack = try Jack(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = jack.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Jack` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = jack.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Jack` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let jack = try Jack(of: .spades)
        let expected = Color.black
        
        // When
        let actual = jack.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Jack` is less than a `Queen PlayingCard`.
    func test_isLessThan_TenAndJack_true() throws {

        // Given
        let jack = try Jack()
        let queen = try Queen()

        // When/Then
        XCTAssertLessThan(jack, queen)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Jack`s with the same `Suit` are equal.
    func test_equals_JacksWithSameSuit_true() throws {
        
        // Given
        let jack1 = try Jack(of: .spades)
        let jack2 = try Jack(of: .spades)
        
        // When/Then
        XCTAssertEqual(jack1, jack2)
    }
    
    /// Tests that `Jack`s with the different `Suit`s are equal.
    func test_equals_JacksWithDifferentSuits_true() throws {
        
        // Given
        let jack1 = try Jack(of: .hearts)
        let jack2 = try Jack(of: .spades)
        
        // When/Then
        XCTAssertEqual(jack1, jack2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Jack` is greater than a `Ten`.
    func test_isGreaterThan_TenAndNine_true() throws {

        // Given
        let jack = try Jack()
        let ten = try Ten()

        // When/Then
        XCTAssertGreaterThan(jack, ten)
    }
}
