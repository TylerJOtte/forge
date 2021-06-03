//=============================================================================//
//                                                                             //
//  RankedCardArrayTests.swift                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/02/21.                                       //
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

/// Unit tests for a `RankedCard Array`.
class RankedCardArrayTests: XCTestCase {
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                            areEquallySuited()                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that `PlayingCards` with the same `Rank` are equally  `Rank`ed.
    func test_areEquallySuited_PlayingCardsWithSameRank_true() throws {
        
        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .hearts)
        let cards = [ace1, ace2]
        
        // When/Then
        XCTAssert(cards.areEquallyRanked())
    }
    
    /// Tests that `PlayingCards` with different `Rank`s are not equally `Rank`ed.
    func test_areEquallySuited_PlayingCardsWithDifferentRanks_false() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let cards = [ace, two]
        
        // When/Then
        XCTAssertFalse(cards.areEquallyRanked())
    }
}
