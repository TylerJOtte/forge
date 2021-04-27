//=============================================================================//
//                                                                             //
//  JokerTests.swift                                                           //
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

/// Unit tests for a `Joker PlayingCard`.
class JokerTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Joker` created with a `red Color` equals "Red Joker".
    func test_title_withRedColor_equalsRedJoker() throws {
        
        // Given
        let joker = try Joker(color: .red)
        let expected = "Red Joker"
        
        // When
        let actual = joker.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a `Joker` created with a `black Color` equals "Black Joker".
    func test_title_withBlackColor_equalsBlackJoker() throws {
        
        // Given
        let joker = try Joker(color: .black)
        let expected = "Black Joker"
        
        // When
        let actual = joker.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of a `Joker` equals `joker`.
    func test_rank_ofJoker_equalsJoker() throws {
        
        // Given
        let joker = try Joker()
        let expected = Rank.joker
        
        // When
        let actual = joker.rank
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a `Joker` equals zero.
    func test_points_ofJoker_equalsZero() throws {
        
        // Given
        let joker = try Joker()
        let expected = 0
        
        // When
        let actual = joker.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Color` of a `Joker` created with a `red Color` equals `red`.
    func test_color_withRedColor_equalsRed() throws {
        
        // Given
        let joker = try Joker(color: .red)
        let expected = Color.red
        
        // When
        let actual = joker.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Color` of a `Joker` created with a `black Color` equals `black`.
    func test_color_withBlackColor_equalsBlack() throws {
        
        // Given
        let joker = try Joker(color: .black)
        let expected = Color.black
        
        // When
        let actual = joker.color
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//

    /// Tests that a `Joker` is less than a low`Ace`.
    func test_isLessThan_JokerAndLowAce_true() throws {

        // Given
        let joker = try Joker()
        let ace = try Ace()

        // When/Then
        XCTAssertLessThan(joker, ace)
    }
    
    /// Tests that a `Joker` is less than a high`Ace`.
    func test_isLessThan_JokerAndHighAce_true() throws {

        // Given
        let high = true
        let joker = try Joker()
        let ace = try Ace(of: .hearts, is: high)

        // When/Then
        XCTAssertLessThan(joker, ace)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that `Joker`s with the same `Color` are equal.
    func test_equals_JokersWithSameColor_true() throws {
        
        // Given
        let joker1 = try Joker(color: .red)
        let joker2 = try Joker(color: .red)
        
        // When/Then
        XCTAssertEqual(joker1, joker2)
    }
    
    /// Tests that `Joker`s with different `Color`s are equal.
    func test_equals_JokersWithDifferentColors_true() throws {
        
        // Given
        let joker1 = try Joker(color: .red)
        let joker2 = try Joker(color: .black)
        
        // When/Then
        XCTAssertEqual(joker1, joker2)
    }
}
