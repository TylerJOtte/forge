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
    
    /// Tests that the title of an `Ace` created with a `clubs Suit` is "Ace Of Clubs".
    func test_title_withClubs_equalsAceOfClubs() throws {
        
        // Given
        let ace = try Ace(of: .clubs)
        let expected = "Ace Of Clubs"
        
        // When
        let actual = ace.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Ace` created with a `diamonds Suit` is "Ace Of Diamonds".
    func test_title_withDiamonds_equalsAceOfDiamonds() throws {
        
        // Given
        let ace = try Ace(of: .diamonds)
        let expected = "Ace Of Diamonds"
        
        // When
        let actual = ace.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Ace` created with a `hearts Suit` is "Ace Of Clubs".
    func test_title_withHearts_equalsAceOfHearts() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let expected = "Ace Of Hearts"
        
        // When
        let actual = ace.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of an `Ace` created with a `spades Suit` is "Ace Of Clubs".
    func test_title_withSpades_equalsAceOfSpades() throws {
        
        // Given
        let ace = try Ace(of: .spades)
        let expected = "Ace Of Spades"
        
        // When
        let actual = ace.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
