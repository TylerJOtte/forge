//=============================================================================//
//                                                                             //
//  AceTests.swift                                                             //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/21/21.                                       //
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

/// Unit tests for an `Ace PlayingCard`.
class AceTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating an `Ace` with a non-`PlayingCard Suit` throws a
    /// `FeatureError.invalidSuit Error`.
    func test_init_withNonPlayingCardSuit_throws() throws {
        
        // Given
        let expected = FeatureError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Ace(of: .stars)) { error in
            
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
    
    /// Tests that the title of an `Ace` created with a `clubs Suit` equals "Ace Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let ace = try Ace(of: .clubs)
        let expected = "Ace Of Clubs"
        
        // When
        let actual = ace.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Ace` created with a `diamonds Suit` equals "Ace Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let ace = try Ace(of: .diamonds)
        let expected = "Ace Of Diamonds"
        
        // When
        let actual = ace.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Ace` created with a `hearts Suit` equals "Ace Of Hearts".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let expected = "Ace Of Hearts"
        
        // When
        let actual = ace.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Ace` created with a `spades Suit` equals "Ace Of Spades".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let ace = try Ace(of: .spades)
        let expected = "Ace Of Spades"
        
        // When
        let actual = ace.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of an `Ace` equals `ace`.
    func test_rank_ofAce_equalsAce() throws {
        
        // Given
        let ace = try Ace()
        let expected = Rank.ace
        
        // When
        let actual = ace.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Suit                                     //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Suit` of an `Ace` created with a `clubs Suit` equals `clubs`.
    func test_suit_withClubs_equalsClubs() throws {
        
        // Given
        let ace = try Ace(of: .clubs)
        let expected = Suit.clubs
        
        // When
        let actual = ace.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Ace` created with a `diamonds Suit` equals `diamonds`.
    func test_suit_withDiamonds_equalsDiamonds() throws {
        
        // Given
        let ace = try Ace(of: .diamonds)
        let expected = Suit.diamonds
        
        // When
        let actual = ace.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Ace` created with a `hearts Suit` equals `hearts`.
    func test_suit_withHearts_equalsHearts() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let expected = Suit.hearts
        
        // When
        let actual = ace.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of an `Ace` created with a `spades Suit` equals `spades`.
    func test_suit_withSpades_equalsSpades() throws {
        
        // Given
        let ace = try Ace(of: .spades)
        let expected = Suit.spades
        
        // When
        let actual = ace.suit
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of an `Ace` that is not high equals one.
    func test_points_ofLowAce_equalsOne() throws {
        
        // Given
        let ace = try Ace()
        let expected = 1
        
        // When
        let actual = ace.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the points of an `Ace` that is high equals one.
    func test_points_ofHighAce_equalsOne() throws {
        
        // Given
        let high = true
        let ace = try Ace(of: .hearts, is: high)
        let expected = 1
        
        // When
        let actual = ace.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of an `Ace` created with a `clubs Suit` equals `black`.
    func test_color_withClubs_equalsBlack() throws {
        
        // Given
        let ace = try Ace(of: .clubs)
        let expected = Color.black
        
        // When
        let actual = ace.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Ace` created with a `diamonds Suit` equals `red`.
    func test_color_withDiamonds_equalsRed() throws {
        
        // Given
        let ace = try Ace(of: .diamonds)
        let expected = Color.red
        
        // When
        let actual = ace.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Ace` created with a `hearts Suit` equals `red`.
    func test_color_withHearts_equalsRed() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let expected = Color.red
        
        // When
        let actual = ace.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of an `Ace` created with a `spades Suit` equals `black`
    func test_color_withSpades_equalsBlack() throws {
        
        // Given
        let ace = try Ace(of: .spades)
        let expected = Color.black
        
        // When
        let actual = ace.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Is High                                   //
    //-------------------------------------------------------------------------//

    /// Tests that `isHigh` of a default `Ace` equals false.
    func test_isHigh_ofDefaultAce_equalsFalse() throws {
        
        // Given
        let ace = try Ace()
        
        // When/Then
        XCTAssertFalse(ace.isHigh)
    }
    
    /// Tests that `isHigh` of a high `Ace` equals true.
    func test_isHigh_ofHighAce_equalsTrue() throws {
        
        // Given
        let high = true
        let ace = try Ace(of: .hearts, is: high)
        
        // When/Then
        XCTAssert(ace.isHigh)
    }
}
