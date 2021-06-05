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
    
    /// Tests a `RankedCard Array` that only has one `Rank` is equally `Rank`ed.
    func test_areEquallyRanked_ArrayWithOneRank_true() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCards = [rankedCard1, rankedCard2]
        
        // When/Then
        XCTAssert(rankedCards.areEquallyRanked())
    }
    
    /// Tests a `RankedCard Array` that only has multiple `Rank`s is not equally `Rank`ed.
    func test_areEquallyRanked_ArrayWithMultipleRanks_false() throws {
        
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
    
    /// Tests that a `RankedCard Array` in which each `RankedCard` has a position that immediately
    /// follows the position of the previous  `RankedCard` is  sequential.
    func test_areSequential_ArrayWithSequentialCardPositions_true() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .two, at: 2)
        let rankedCards = [rankedCard1, rankedCard2]
        
        // When/Then
        XCTAssert(rankedCards.areSequential())
    }
    
    /// Tests that a `RankedCard Array` which contains a`RankedCard` with a position that does not
    /// immediately follow the position of the previous  `RankedCard` is not sequential.
    func test_areSequential_ArrayWithNonSequentialCardPositions_false() throws {
        
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
    
    // Unique Ranks //
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank` returns a
    /// `Dictionary` with a key count equal to the `Array` count.
    func test_splitByRank_withUniqueRanks_keyCountEqualsArrayCount() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank()
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank` returns a
    /// `Dictionary` with total count equal to the `Array` count.
    func test_splitByRank_withUniqueRanks_totalCountEqualsArrayCount() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank()
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
    
    // Duplicate Ranks //
    
    /// Tests that splitting a `RankedCard Array`with duplicate `Rank`s  by `Rank` returns a
    /// `Dictionary` with an expected key count.
    func test_splitByRank_withDuplicateRanks_hasExpectedKeyCount() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .three)
        let rankedCard5 = RankedCard(with: .three)
        let rankedCard6 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4, rankedCard5, rankedCard6]
        let expected = 3
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank()
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with duplicate `Rank`s  by `Rank` returns a
    /// `Dictionary` with a total count equal to the `Array` count.
    func test_splitByRank_withDuplicateRanks_totalCountEqualsArrayCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .three)
        let rankedCard5 = RankedCard(with: .three)
        let rankedCard6 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4, rankedCard5, rankedCard6]
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank()
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
    
    //                        //
    // Where Equal Rank Count //
    //                        //
    
    // Unique Ranks //
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank`where the given count
    /// for a `Rank` equals one  returns a `Dictionary` with a key count equal to the `Array` count.
    func test_splitByRank_withUniqueRanksWhereCountIsOne_KeyCountEqualsArrayCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let count = 1
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank`where the given count
    /// for a `Rank` is greater than one  returns a `Dictionary` with zero keys.
    func test_splitByRank_withUniqueRanksWhereCountEqualsTwo_hasZeroKeys()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let count = 2
        let expected = 0
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank`where the given count
    /// for a `Rank` equals one  returns a `Dictionary` with a total count equal to the `Array` count.
    func test_splitByRank_withUniqueRanksWhereCountIsOne_totalCountEqualsArrayCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let count = 1
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank`where the given count
    /// for a `Rank` is greater than one  returns a `Dictionary` with total count of zero.
    func test_splitByRank_withUniqueRanksWhereCountEqualsTwo_totalCountEqualsZero()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let count = 2
        let expected = 0
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
    
    // Duplicate Ranks //
    
    /// Tests that splitting a `RankedCard Array`with duplicate `Rank`s  by `Rank`where the count
    /// for a `Rank` equals a given count returns a `Dictionary` with an expected key count.
    func test_splitByRank_withDuplicateRanksWhereCount_hasExpectedKeyCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .three)
        let rankedCard5 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4, rankedCard5]
        let count = 2
        let expected = 2
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with duplicate `Rank`s  by `Rank`where the count
    /// for a `Rank` equals a given count returns a `Dictionary` with an expected total count.
    func test_splitByRank_withDuplicateRanksWhereCount_hasExpectedTotalCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .three)
        let rankedCard5 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4, rankedCard5]
        let count = 2
        let expected = 4
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
    
    // Only Duplicate Ranks //
    
    /// Tests that splitting a `RankedCard Array`with only  duplicate `Rank`s  by `Rank`where the
    /// given count for a `Rank` equals one  returns a `Dictionary` with zero keys.
    func test_splitByRank_withOnlyDuplicateRanksWhereCountEqualsOne_hasZeroKeys()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        let count = 1
        let expected = 0
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with only duplicate `Rank`s  by `Rank`where the
    /// given count for a `Rank` equals one  returns a `Dictionary` with a total count of zero.
    func test_splitByRank_withOnlyDuplicateRanksWhereCountEqualsOne_totalCountEqualsZero() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        let count = 1
        let expected = 0
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    //                    //
    // Where > Rank Count //
    //                    //
    
    // Unique Ranks //
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank`where the given count
    /// for a `Rank` is greater than zero  returns a `Dictionary` with a key count equal to the `Array`
    /// count.
    func test_splitByRank_withUniqueRanksWhereCountIsGreaterThanOne_keyCountEqualsArrayCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let count = 0
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(over: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank`where the given count
    /// for a `Rank` is greater than one  returns a `Dictionary` with zero keys.
    func test_splitByRank_withUniqueRanksWhereCountIsGreaterThanOne_hasZeroKeys()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let count = 1
        let expected = 0
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(over: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank`where the given count
    /// for a `Rank` is greater than zero  returns a `Dictionary` with a total count equal to the `Array`
    /// count.
    func test_splitByRank_withUniqueRanksWhereCountIsGreaterThanOne_totalCountEqualsArrayCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let count = 0
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(over: count)
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with unique `Rank`s  by `Rank`where the given count
    /// for a `Rank` is greater than one  returns a `Dictionary` with a total count of zero.
    func test_splitByRank_withUniqueRanksWhereCountIsGreaterThanOne_totalCountEqualsZero()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2]
        let count = 1
        let expected = 0
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(over: count)
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
}
