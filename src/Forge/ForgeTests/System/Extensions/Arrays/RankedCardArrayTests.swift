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
    //                            areEquallyRanked()                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that `RankedCards` with the same `Rank` are equally  `Rank`ed.
    func test_areEquallySuited_CardsWithSameRank_true() throws {
        
        // Given
        let card1 = RankedCard(with: .ace)
        let card2 = RankedCard(with: .ace)
        let cards = [card1, card2]
        
        // When/Then
        XCTAssert(cards.areEquallyRanked())
    }
    
    /// Tests that `RankedCards` with different `Rank`s are not equally `Rank`ed.
    func test_areEquallySuited_CardsWithDifferentRanks_false() throws {
        
        // Given
        let card1 = RankedCard(with: .ace)
        let card2 = RankedCard(with: .two)
        let cards = [card1, card2]
        
        // When/Then
        XCTAssertFalse(cards.areEquallyRanked())
    }
    
    //-------------------------------------------------------------------------//
    //                              areSequential()                            //
    //-------------------------------------------------------------------------//
    
    /// Tests that `RankedCards` with sequential positions are sequential.
    func test_areSequential_CardsWithSequentialPositions_true() throws {
        
        // Given
        let card1 = RankedCard(with: .ace, at: 1)
        let card2 = RankedCard(with: .two, at: 2)
        let cards = [card1, card2]
        
        // When/Then
        XCTAssert(cards.areSequential())
    }
    
    /// Tests that `RankedCards` with non-sequential positions are not sequential.
    func test_areSequential_CardsWithNonSequentialPositions_false() throws {
        
        // Given
        let card1 = RankedCard(with: .ace, at: 1)
        let card2 = RankedCard(with: .six, at: 6)
        let cards = [card1, card2]
        
        // When/Then
        XCTAssertFalse(cards.areSequential())
    }
}
