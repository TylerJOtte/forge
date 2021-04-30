//=============================================================================//
//                                                                             //
//  QueenTests.swift                                                           //
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

/// Unit tests for a `Queen PlayingCard`.
class QueenTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Queen` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Queen(of: .stars)) { error in
            
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
    
    /// Tests that the title of a `Queen` created with a `clubs Suit` equals "Queen Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let queen = try Queen(of: .clubs)
        let expected = "Queen Of Clubs"
        
        // When
        let actual = queen.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Queen` created with a `diamonds Suit` equals "Queen Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let queen = try Queen(of: .diamonds)
        let expected = "Queen Of Diamonds"
        
        // When
        let actual = queen.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Queen` created with a `hearts Suit` equals "Queen Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let queen = try Queen(of: .hearts)
        let expected = "Queen Of Hearts"
        
        // When
        let actual = queen.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Queen` created with a `spades Suit` equals "Queen Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let queen = try Queen(of: .spades)
        let expected = "Queen Of Spades"
        
        // When
        let actual = queen.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of a `Queen` equals `queen`.
    func test_rank_ofAce_equalsTen() throws {
        
        // Given
        let queen = try Queen()
        let expected = Rank.queen
        
        // When
        let actual = queen.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of a `Queen` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let queen = try Queen(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = queen.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Queen` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let queen = try Queen(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = queen.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Queen` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let queen = try Queen(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = queen.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Queen` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {
        
        // Given
        let queen = try Queen(of: .spades)
        let expected = Suit.spades
        
        // When
        let actual = queen.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a `Queen` that is not high equals queen.
    func test_points_ofLowAce_equalsTen() throws {
        
        // Given
        let queen = try Queen()
        let expected = 10
        
        // When
        let actual = queen.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of a `Queen` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let queen = try Queen(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = queen.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Queen` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let queen = try Queen(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = queen.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Queen` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let queen = try Queen(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = queen.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Queen` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let queen = try Queen(of: .spades)
        let expected = Color.black
        
        // When
        let actual = queen.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Queen` is less than a high`Ace`.
    func test_isLessThan_TenAndHighAce_true() throws {

        // Given
        let high = true
        let queen = try Queen()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(queen, ace)
    }
    
    /// Tests that a `Queen` is less than a `King PlayingCard`.
    func test_isLessThan_TenAndJack_true() throws {

        // Given
        let queen = try Queen()
        let king = try King()

        // When/Then
        XCTAssertLessThan(queen, king)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Queen`s with the same `Suit` are equal.
    func test_equals_TensWithSameSuit_true() throws {
        
        // Given
        let ten1 = try Queen(of: .spades)
        let ten2 = try Queen(of: .spades)
        
        // When/Then
        XCTAssertEqual(ten1, ten2)
    }
    
    /// Tests that `Queen`s with the different `Suit`s are equal.
    func test_equals_TensWithDifferentSuits_true() throws {
        
        // Given
        let ten1 = try Queen(of: .hearts)
        let ten2 = try Queen(of: .spades)
        
        // When/Then
        XCTAssertEqual(ten1, ten2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Queen` is greater than a `Jack`.
    func test_isGreaterThan_TenAndNine_true() throws {

        // Given
        let queen = try Queen()
        let jack = try Jack()

        // When/Then
        XCTAssertGreaterThan(queen, jack)
    }
}
