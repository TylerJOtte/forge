//=============================================================================//
//                                                                             //
//  JokerTests.swift                                                           //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/16/21.                                       //
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
    //                                Color                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a `Joker`'s `Color` equals a given`Color`.
    func test_color_ofJoker_equalsGivenColor() throws {

        // Given
        let color = Color.red
        let joker = try Joker(color: color)
        let expected = color

        // When
        let actual = joker.color

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Suit                                    //
    //-------------------------------------------------------------------------//

    /// Tests that the `Suit` of a `Joker` created with a `red Color` equals `null`.
    func test_suit_withRedColor_equalsNull() throws {

        // Given
        let joker = try Joker(color: .red)
        let expected = Suit.null

        // When
        let actual = joker.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Suit` of a `Joker` created with a `black Color` equals `null`.
    func test_suit_withBlackColor_equalsNull() throws {

        // Given
        let joker = try Joker(color: .black)
        let expected = Suit.null

        // When
        let actual = joker.suit

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Rank                                    //
    //-------------------------------------------------------------------------//

    /// Tests that a `Joker`'s `Rank` equals `joker`.
    func test_rank_ofJoker_equalsJoker() throws {

        // Given
        let joker = try Joker(color: .red)
        let expected = Rank.joker

        // When
        let actual = joker.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//

    /// Tests that a `Joker`'s position equals 0.
    func test_position_ofJoker_equals0() throws {

        // Given
        let joker = try Joker(color: .red)
        let expected = 0

        // When
        let actual = joker.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//

    /// Tests that a `Joker`'s points equals 0.
    func test_points_ofJoker_equals0() throws {

        // Given
        let joker = try Joker(color: .red)
        let expected = 0

        // When
        let actual = joker.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
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

    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//

    /// Tests that a `Joker` is less than a low `Ace`.
    func test_joker_isLessThanLowAce_true() throws {

        // Given
        let joker = try Joker(color: .red)
        let lowAce = try Ace(of: .hearts)

        // When/Then
        XCTAssert(joker.isLessThan(lowAce))
    }

    /// Tests that a `Joker` is less than a low `Ace`, using the less than operator.
    func test_joker_isLessThanKingWithOperator_true() throws {

        // Given
        let joker = try Joker(color: .red)
        let lowAce = try Ace(of: .hearts)

        // When/Then
        XCTAssertLessThan(joker, lowAce)
    }

    /// Tests that a `Joker` is less than a high `Ace`.
    func test_joker_isLessThanHighAce_true() throws {

        // Given
        let isHigh = true
        let joker = try Joker(color: .red)
        let highAce = try Ace(of: .hearts, and: isHigh)

        // When/Then
        XCTAssert(joker.isLessThan(highAce))
    }

    /// Tests that a `Joker` is less than a high `Ace`, using the less than operator.
    func test_joker_isLessThanHighAceWithOperator_true() throws {

        // Given
        let isHigh = true
        let joker = try Joker(color: .red)
        let ace = try Ace(of: .hearts, and: isHigh)

        // When/Then
        XCTAssertLessThan(joker, ace)
    }

    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//

    /// Tests that a `Joker` equals another `Joker` with the same `Color`.
    func test_joker_equalsJokerWithSameColor_true() throws {

        // Given
        let card1 = try Joker(color: .red)
        let card2 = try Joker(color: .red)

        // When/Then
        XCTAssert(card1.equals(card2))
    }

    /// Tests that a `Joker` equals another `Joker` with the same `Color`, using the equality operator.
    func test_joker_equalsJokerWithSameColorUsingOperator_true() throws {

        // Given
        let card1 = try Joker(color: .red)
        let card2 = try Joker(color: .red)

        // When/Then
        XCTAssertEqual(card1, card2)
    }

    /// Tests that a `Joker` does not equal another `Joker` with a different `Color`.
    func test_joker_equalsJokerWithDifferentColor_false() throws {

        // Given
        let card1 = try Joker(color: .red)
        let card2 = try Joker(color: .black)

        // When/Then
        XCTAssertFalse(card1.equals(card2))
    }

    /// Tests that a `Joker` does not equal another `Joker` with a different `Color`, using the equality
    /// operator.
    func test_joker_equalsJokerWithDifferentColorUsingOperator_false() throws {

        // Given
        let card1 = try Joker(color: .red)
        let card2 = try Joker(color: .black)

        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                               ranks()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Joker` `Rank`s another `Joker`.
    func test_joker_ranksJoker_true() throws {
     
        // Given
        let redJoker = try Joker(color: .red)
        let blackJoker = try Joker(color: .black)
        
        // When/Then
        XCTAssert(redJoker.ranks(blackJoker))
    }
    
    /// Tests that a `Joker` does not `Rank` a low `Ace`.
    func test_joker_ranksLowhAce_false() throws {
     
        // Given
        let joker = try Joker(color: .red)
        let lowAce = try Ace(of: .hearts)
        
        // When/Then
        XCTAssertFalse(joker.ranks(lowAce))
    }
}
