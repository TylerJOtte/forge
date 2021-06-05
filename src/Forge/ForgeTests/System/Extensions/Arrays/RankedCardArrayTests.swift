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
    func test_areEquallySuited_rankedCardsWithSameRank_true() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCards = [rankedCard1, rankedCard2]
        
        // When/Then
        XCTAssert(rankedCards.areEquallyRanked())
    }
    
    /// Tests that `RankedCards` with different `Rank`s are not equally `Rank`ed.
    func test_areEquallySuited_rankedCardsWithDifferentRanks_false() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        
        // When/Then
        XCTAssertFalse(rankedCards.areEquallyRanked())
    }
    
    //-------------------------------------------------------------------------//
    //                              areSequential()                            //
    //-------------------------------------------------------------------------//
    
    /// Tests that `RankedCards` with sequential positions are sequential.
    func test_areSequential_rankedCardsWithSequentialPositions_true() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .two, at: 2)
        let rankedCards = [rankedCard1, rankedCard2]
        
        // When/Then
        XCTAssert(rankedCards.areSequential())
    }
    
    /// Tests that `RankedCards` with non-sequential positions are not sequential.
    func test_areSequential_rankedCardsWithNonSequentialPositions_false() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .six, at: 6)
        let rankedCards = [rankedCard1, rankedCard2]
        
        // When/Then
        XCTAssertFalse(rankedCards.areSequential())
    }
    
    //=========================================================================//
    //                               SPLITTERS                                 //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                             splitByRank()                               //
    //-------------------------------------------------------------------------//
    
    //           //
    // All Ranks //
    //           //
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank` has the expected key
    /// count.
    func test_splitByRank_rankedCardArrayWithUniqueRanks_hasExpectedKeyCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let expected = 2
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank()
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array` with duplicate `Rank`s  by `Rank` has  the expected
    /// key count.
    func test_splitByRank_rankedCardArrayWithDuplicateRanks_hasExpectedKeyCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCards = [rankedCard1, rankedCard2]
        let expected = 1
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank()
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
}
