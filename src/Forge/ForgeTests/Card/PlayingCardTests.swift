//=============================================================================//
//                                                                             //
//  PlayingCardTests.swift                                                     //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/03/21.                                       //
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

/// Unit tests for the `PlayingCard` class.
class PlayingCardTests: XCTestCase {
    
    /// Tests that two standard`PlayingCard`s with the same `Rank` & `Suit` are equal.
    func test_areEqual_sameRankAndSuit_true() {
        
        // Given
        let rank = Rank.ace
        let symbol = Symbol.clover
        let color = Color.black
        let suit = Suit(color, symbol)
        let card1 = PlayingCard(rank, of: suit)
        let card2 = PlayingCard(rank, of: suit)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
}
