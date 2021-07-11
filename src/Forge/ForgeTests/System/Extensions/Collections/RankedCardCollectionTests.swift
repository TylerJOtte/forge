//=============================================================================//
//                                                                             //
//  RankedCardCollectionTests.swift                                            //
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

/// Unit tests for a `RankedCard Collection`.
class RankedCardCollectionTests: XCTestCase {
    
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
    //                                 GETTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               getPairs()                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving the`Pair`s in a `RankedCard Array` that cotains unique `Rank`s returns
    /// an empty `Array`.
    func test_getPairs_withUniqueRanks_returnsEmpty() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCard4 = RankedCard(with: .four)
        let rankedCard5 = RankedCard(with: .five)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
            rankedCard5]
        
        // When
        let pairs = rankedCards.getPairs()
        
        XCTAssert(pairs.isEmpty)
    }
    
    /// Tests that retrieving the the `Pair`s in a `RankedCard Array` that contains only two equally
    /// `RankedCard`s returns a `Pair Array` with a count of one.
    func test_getPairs_withTwoEquallyRankedCards_returnsOne() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCards = [rankedCard1, rankedCard2]
        let expected = 1
        
        // When
        let pairs = rankedCards.getPairs()
        let actual = pairs.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `Pair`s in a `RankedCard Array` that contains multiple `Rank`s and
    /// only one duplicate `Rank` returns a `Pair Array` with a count of one.
    func test_getPairs_withMultipleRanksAndOneDuplicate_returnsOne() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        let expected = 1
        
        // When
        let pairs = rankedCards.getPairs()
        let actual = pairs.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `Pair`s in a `RankedCard Array` that contains only four
    /// `RankedCard`s with two `Rank`s of the same count  returns a `Pair Array` with a count of
    /// two.
    func test_getPairs_withFourRankedCardsAndTwoRanks_returnsTwo() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        let expected = 2
        
        // When
        let pairs = rankedCards.getPairs()
        let actual = pairs.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `Pair`s in a `RankedCard Array` that contains multiple `Rank`s and
    /// two different sets of duplicate `Rank`s with a count of two each returns a `Pair Array` with a
    /// count of two.
    func test_getPairs_withMultipleRanksAndDiffferentDuplicates_returnsTwo() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .three)
        let rankedCard5 = RankedCard(with: .four)
        let rankedCard6 = RankedCard(with: .four)
        let rankedCard7 = RankedCard(with: .five)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
            rankedCard5, rankedCard6, rankedCard7]
        let expected = 2
        
        // When
        let pairs = rankedCards.getPairs()
        let actual = pairs.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `Pair`s in a `RankedCard Array` that contains only three
    /// `RankedCard`s of all the same `Rank` returns a `Pair Array` with a count of three.
    func test_getPairs_withThreeEquallyRankedCards_returnsThree() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .ace)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let expected = 3
        
        // When
        let pairs = rankedCards.getPairs()
        let actual = pairs.count
        
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                            getThreeOfAKinds()                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving the`ThreeOfAKind`s in a `RankedCard Array` that cotains unique
    /// `Rank`s returns an empty `Array`.
    func test_getThreeOfAKinds_withUniqueRanks_returnsEmpty() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        
        // When
        let threeOfAKinds = rankedCards.getThreeOfAKinds()
        
        // Then
        XCTAssert(threeOfAKinds.isEmpty)
    }
    
    /// Tests that retrieving the `ThreeOfAKind`s in a `RankedCard Array` that contains only three
    /// equally `RankedCard`s returns a `ThreeOfAKind Array` with a count of one.
    func test_getThreeOfAKinds_withThreeEquallyRankedCards_returnsOne() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .ace)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let expected = 1
        
        // When
        let threeOfAKinds = rankedCards.getThreeOfAKinds()
        let actual = threeOfAKinds.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `ThreeOfAKind`s in a `RankedCard Array` that contains multiple
    /// `Rank`s and only two duplicate `Rank`s returns a `ThreeOfAKind Array` with a count of one.
    func test_getThreeOfAKinds_withMultipleRanksAndTwoDuplicates_returnsOne() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .two)
        let rankedCard5 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
                           rankedCard5]
        let expected = 1
        
        // When
        let threeOfAKinds = rankedCards.getThreeOfAKinds()
        let actual = threeOfAKinds.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `ThreeOfAKinds`s in a `RankedCard Array` that contains only six
    /// `RankedCard`s with two `Rank`s of the same count  returns a `ThreeOfKind Array` with a
    ///  count of two.
    func test_getThreeOfAKinds_withSixRankedCardsOfTwoRanksWithSameCount_returnsTwo() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .ace)
        let rankedCard4 = RankedCard(with: .two)
        let rankedCard5 = RankedCard(with: .two)
        let rankedCard6 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
                           rankedCard5, rankedCard6]
        let expected = 2
        
        // When
        let threeOfAKinds = rankedCards.getThreeOfAKinds()
        let actual = threeOfAKinds.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `ThreeOfAKind`s in a `RankedCard Array` that contains multiple
    /// `Rank`s and two different sets of duplicate `Rank`s with a count of three each returns a
    /// `ThreeOfAKind Array` with a count of two.
    func test_getThreeOfAKind_withMultipleRanksAndDifferentDuplicates_returnsTwo() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .two)
        let rankedCard5 = RankedCard(with: .three)
        let rankedCard6 = RankedCard(with: .four)
        let rankedCard7 = RankedCard(with: .four)
        let rankedCard8 = RankedCard(with: .four)
        let rankedCard9 = RankedCard(with: .five)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
                           rankedCard5, rankedCard6, rankedCard7, rankedCard8,
                           rankedCard9]
        let expected = 2
        
        // When
        let threeOfKinds = rankedCards.getThreeOfAKinds()
        let actual = threeOfKinds.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `ThreeOfAKind`s in a `RankedCard Array` that contains only four
    /// `RankedCard`s of all the same `Rank` returns a ` ThreeOfAKind Array` with a count of
    /// three.
    func test_getThreeOfAKinds_withFourEquallyRankedCards_returnsThree() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .ace)
        let rankedCard4 = RankedCard(with: .ace)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        let expected = 3
        
        // When
        let threeOfAKinds = rankedCards.getThreeOfAKinds()
        let actual = threeOfAKinds.count
        
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                             getFourOfAKinds()                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving the`FourOfAKind`s in a `RankedCard Array` that cotains unique
    /// `Rank`s returns an empty `Array`.
    func test_getFourOfAKinds_withUniqueRanks_returnsEmpty() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCard4 = RankedCard(with: .four)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        
        // When
        let fourOfAKinds = rankedCards.getFourOfAKinds()
        
        // Then
        XCTAssert(fourOfAKinds.isEmpty)
    }
    
    /// Tests that retrieving the `FourOfAKind`s in a `RankedCard Array` that contains only four
    /// equally `RankedCard`s returns a `FourOfAKind Array` with a count of one.
    func test_getFourOfAKinds_withFourEquallyRankedCards_returnsOne() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .ace)
        let rankedCard4 = RankedCard(with: .ace)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        let expected = 1
        
        // When
        let fourOfAKinds = rankedCards.getFourOfAKinds()
        let actual = fourOfAKinds.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `FourOfAKind`s in a `RankedCard Array` that contains multiple
    /// `Rank`s and only three duplicate `Rank`s returns a `FourOfAKind Array` with a count of one.
    func test_getFourOfAKinds_withMultipleRanksAndThreeDuplicates_returnsOne() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .two)
        let rankedCard5 = RankedCard(with: .two)
        let rankedCard6 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
                           rankedCard5, rankedCard6]
        let expected = 1
        
        // When
        let fourOfAKinds = rankedCards.getFourOfAKinds()
        let actual = fourOfAKinds.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `FourOfAKinds`s in a `RankedCard Array` that contains only eight
    /// `RankedCard`s with two `Rank`s of the same count  returns a `FourOfKind Array` with a
    ///  count of two.
    func test_getFourOfAKinds_withEightRankedCardsOfTwoRanksWithSameCount_returnsTwo() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .ace)
        let rankedCard4 = RankedCard(with: .ace)
        let rankedCard5 = RankedCard(with: .two)
        let rankedCard6 = RankedCard(with: .two)
        let rankedCard7 = RankedCard(with: .two)
        let rankedCard8 = RankedCard(with: .two)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
                           rankedCard5, rankedCard6, rankedCard7, rankedCard8]
        let expected = 2
        
        // When
        let fourOfAKinds = rankedCards.getFourOfAKinds()
        let actual = fourOfAKinds.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `FourOfAKind`s in a `RankedCard Array` that contains multiple
    /// `Rank`s and two different sets of duplicate `Rank`s with a count of four each returns a
    /// `FourOfAKind Array` with a count of two.
    func test_getFourOfAKinds_withMultipleRanksAndDifferentDuplicates_returnsTwo() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .two)
        let rankedCard5 = RankedCard(with: .two)
        let rankedCard6 = RankedCard(with: .three)
        let rankedCard7 = RankedCard(with: .four)
        let rankedCard8 = RankedCard(with: .four)
        let rankedCard9 = RankedCard(with: .four)
        let rankedCard10 = RankedCard(with: .four)
        let rankedCard11 = RankedCard(with: .five)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
                           rankedCard5, rankedCard6, rankedCard7, rankedCard8,
                           rankedCard9, rankedCard10, rankedCard11]
        let expected = 2
        
        // When
        let fourOfKinds = rankedCards.getFourOfAKinds()
        let actual = fourOfKinds.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the `FourOfAKind`s in a `RankedCard Array` that contains only five
    /// `RankedCard`s of all the same `Rank` returns a ` FourOfAKind Array` with a count of
    /// three.
    func test_getFourOfAKinds_withFiveEquallyRankedCards_returnsThree() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .ace)
        let rankedCard3 = RankedCard(with: .ace)
        let rankedCard4 = RankedCard(with: .ace)
        let rankedCard5 = RankedCard(with: .ace)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
                           rankedCard5]
        let expected = 3
        
        // When
        let fourOfAKinds = rankedCards.getFourOfAKinds()
        let actual = fourOfAKinds.count
        
        XCTAssertEqual(expected, actual)
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
    func test_splitByRank_withDuplicateRanksWhereEqualCount_hasExpectedKeyCount()
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
    func test_splitByRank_withDuplicateRanksWhereEqualCount_hasExpectedTotalCount()
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
    func test_splitByRank_withUniqueRanksWhereCountOverZero_keyCountEqualsArrayCount()
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
    func test_splitByRank_withUniqueRanksWhereCountOverZero_hasZeroKeys()
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
    func test_splitByRank_withUniqueRanksWhereCountOverOne_totalCountEqualsArrayCount()
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
    func test_splitByRank_withUniqueRanksWhereCountOverOne_totalCountEqualsZero()
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
    
    // Duplicate Ranks //
    
    /// Tests that splitting a `RankedCard Array`with duplicate `Rank`s  by `Rank`where the count for
    /// a `Rank` is greater than a given count returns a `Dictionary` with an expected key count.
    func test_splitByRank_withDuplicateRanksWhereOverCount_hasExpectedKeyCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .three)
        let rankedCard5 = RankedCard(with: .three)
        let rankedCard6 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4, rankedCard5, rankedCard6]
        let count = 2
        let expected = 1
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(over: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Array`with duplicate `Rank`s  by `Rank`where the count for
    /// a `Rank` is greater than a given count returns a `Dictionary` with an expected total count.
    func test_splitByRank_withDuplicateRanksWhereOverCount_hasExpectedTotalCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .two)
        let rankedCard4 = RankedCard(with: .three)
        let rankedCard5 = RankedCard(with: .three)
        let rankedCard6 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4, rankedCard5, rankedCard6]
        let count = 2
        let expected = 3
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(over: count)
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
}
