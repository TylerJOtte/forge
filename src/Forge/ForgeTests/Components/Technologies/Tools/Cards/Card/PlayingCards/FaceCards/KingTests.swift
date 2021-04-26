//=============================================================================//
//                                                                             //
//  KingTests.swift                                                            //
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

/// Unit tests for a `King PlayingCard`.
class KingTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `King` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try King(of: .stars)) { error in
            
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
    
    /// Tests that the title of a `King` created with a `clubs Suit` equals "King Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let king = try King(of: .clubs)
        let expected = "King Of Clubs"
        
        // When
        let actual = king.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `King` created with a `diamonds Suit` equals "King Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let king = try King(of: .diamonds)
        let expected = "King Of Diamonds"
        
        // When
        let actual = king.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `King` created with a `hearts Suit` equals "King Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let king = try King(of: .hearts)
        let expected = "King Of Hearts"
        
        // When
        let actual = king.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `King` created with a `spades Suit` equals "King Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let king = try King(of: .spades)
        let expected = "King Of Spades"
        
        // When
        let actual = king.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of a `King` equals `king`.
    func test_rank_ofAce_equalsTen() throws {
        
        // Given
        let king = try King()
        let expected = Rank.king
        
        // When
        let actual = king.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of a `King` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let king = try King(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = king.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `King` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let king = try King(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = king.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `King` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let king = try King(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = king.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `King` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {
        
        // Given
        let king = try King(of: .spades)
        let expected = Suit.spades
        
        // When
        let actual = king.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a `King` that is not high equals king.
    func test_points_ofLowAce_equalsTen() throws {
        
        // Given
        let king = try King()
        let expected = 10
        
        // When
        let actual = king.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of a `King` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let king = try King(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = king.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `King` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let king = try King(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = king.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `King` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let king = try King(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = king.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `King` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let king = try King(of: .spades)
        let expected = Color.black
        
        // When
        let actual = king.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `King` is less than a high`Ace`.
    func test_isLessThan_TenAndHighAce_true() throws {

        // Given
        let high = true
        let king = try King()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(king, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `King`s with the same `Suit` are equal.
    func test_equals_TensWithSameSuit_true() throws {
        
        // Given
        let ten1 = try King(of: .spades)
        let ten2 = try King(of: .spades)
        
        // When/Then
        XCTAssertEqual(ten1, ten2)
    }
    
    /// Tests that `King`s with the different `Suit`s are equal.
    func test_equals_TensWithDifferentSuits_true() throws {
        
        // Given
        let ten1 = try King(of: .hearts)
        let ten2 = try King(of: .spades)
        
        // When/Then
        XCTAssertEqual(ten1, ten2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `King` is greater than a `Queen`.
    func test_isGreaterThan_TenAndNine_true() throws {

        // Given
        let king = try King()
        let queen = try Queen()

        // When/Then
        XCTAssertGreaterThan(king, queen)
    }
}
