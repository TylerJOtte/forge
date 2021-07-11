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
    
    /// Tests that a `RankedCard Collection` containing only one `Rank` is equally `Rank`ed.
    func test_areEquallyRanked_withOneRank_true() throws {
        
        // Given
        let rank = Rank.ace
        let rankedCard1 = RankedCard(with: rank)
        let rankedCard2 = RankedCard(with: rank)
        let rankedCard3 = RankedCard(with: rank)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        
        // When/Then
        XCTAssert(rankedCards.areEquallyRanked())
    }
    
    /// Tests that a `RankedCard Collection` containing various `Rank`s is not equally `Rank`ed.
    func test_areEquallyRanked_withVariousRanks_false() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        
        // When/Then
        XCTAssertFalse(rankedCards.areEquallyRanked())
    }
    
    //-------------------------------------------------------------------------//
    //                              areSequential()                            //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `RankedCard Collection` in which each `RankedCard` has a position that
    /// immediately follows the position of the previous  `RankedCard` is  sequential.
    func test_areSequential_withSequentialPositions_true() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .two, at: 2)
        let rankedCard3 = RankedCard(with: .three, at: 3)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        
        // When/Then
        XCTAssert(rankedCards.areSequential())
    }
    
    /// Tests that a `RankedCard Collection` which contains a`RankedCard` with a position that
    /// does not immediately follow the position of the previous  `RankedCard` is not sequential.
    func test_areSequential_withNonSequentialPositions_false() throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .two, at: 2)
        let rankedCard3 = RankedCard(with: .four, at: 4)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        
        // When/Then
        XCTAssertFalse(rankedCards.areSequential())
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                getCount()                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving the total # of a`Rank` in a `RankedCard Collection` that does not
    /// contain the given `Rank` equals zero.
    func test_getCount_withExcludedRank_equalsOne() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rank4 = Rank.four
        let rankedCard1 = RankedCard(with: rank1)
        let rankedCard2 = RankedCard(with: rank2)
        let rankedCard3 = RankedCard(with: rank3)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let expected = 0
        
        // When
        let actual = rankedCards.getCount(of: rank4)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the total # of a`Rank` in a `RankedCard Collection` that contains only
    /// unique `Rank`s equals one.
    func test_getCount_withUniqueRank_equalsOne() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rankedCard1 = RankedCard(with: rank1)
        let rankedCard2 = RankedCard(with: rank2)
        let rankedCard3 = RankedCard(with: rank3)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let expected = 1
        
        // When
        let actual = rankedCards.getCount(of: rank2)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the total # of a duplicate `Rank` in a `RankedCard Collection` equals the
    /// expected value.
    func test_getCount_withDuplicateRank_equalsExpected() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.two
        let rank3 = Rank.three
        let rankedCard1 = RankedCard(with: rank1)
        let rankedCard2 = RankedCard(with: rank2)
        let rankedCard3 = RankedCard(with: rank2)
        let rankedCard4 = RankedCard(with: rank3)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        let expected = 2
        
        // When
        let actual = rankedCards.getCount(of: rank2)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               getPairs()                                //
    //-------------------------------------------------------------------------//
    
    //                   //
    // With Unique Ranks //
    //                   //
    
    /// Tests that retrieving the`Pair`s in a `RankedCard Collection` that contains unique `Rank`s
    /// returns an empty `Collection`.
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
    
    //                               //
    // With One Rank & One Duplicate //
    //                               //
    
    /// Tests that retrieving the the `Pair`s in a `RankedCard Collection` that contains only two
    /// equally `RankedCard`s returns a `Pair Collection` with a count of one.
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
    
    //                                     //
    // With One Rank & Multiple Duplicates //
    //                                     //
    
    /// Tests that retrieving the `Pair`s in a `RankedCard Collection` that contains only three
    /// `RankedCard`s of all the same `Rank` returns a `Pair Collection` with a count of three.
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
    
    //                                          //
    // With Multiple Ranks & Only One Duplicate //
    //                                          //
    
    /// Tests that retrieving the `Pair`s in a `RankedCard Collection` that contains multiple
    /// `Rank`s and only one duplicate `Rank` returns a `Pair Collection` with a count of one.
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
    
    //                                                //
    // With Multiple Ranks & Multiple/Only Duplicates //
    //                                                //
    
    /// Tests that retrieving the `Pair`s in a `RankedCard Collection` that contains only four
    /// `RankedCard`s with two `Rank`s of the same count  returns a `Pair Collection` with a
    /// count of two.
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
    
    //                                           //
    // With Multiple Ranks & Multiple Duplicates //
    //                                           //
    
    /// Tests that retrieving the `Pair`s in a `RankedCard Collection` that contains multiple
    /// `Rank`s and two different sets of duplicate `Rank`s with a count of two each returns a `Pair`
    /// `Collection` with a count of two.
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
    
    //-------------------------------------------------------------------------//
    //                            getThreeOfAKinds()                           //
    //-------------------------------------------------------------------------//
    
    //                   //
    // With Unique Ranks //
    //                   //
    
    /// Tests that retrieving the`ThreeOfAKind`s in a `RankedCard Collection` that contains
    /// unique `Rank`s returns an empty `Collection`.
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
    
    //                               //
    // With One Rank & One Duplicate //
    //                               //
    
    /// Tests that retrieving the `ThreeOfAKind`s in a `RankedCard Collection` that contains only
    /// three equally `RankedCard`s returns a `ThreeOfAKind Collection` with a count of one.
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
    
    //                                     //
    // With One Rank & Multiple Duplicates //
    //                                     //
    
    /// Tests that retrieving the `ThreeOfAKind`s in a `RankedCard Collection` that contains only
    /// four `RankedCard`s of all the same `Rank` returns a ` ThreeOfAKind Collection` with a
    /// count of three.
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
    
    //                                          //
    // With Multiple Ranks & Only One Duplicate //
    //                                          //
    
    /// Tests that retrieving the `ThreeOfAKind`s in a `RankedCard Collection` that contains
    /// multiple `Rank`s and only two duplicate `Rank`s returns a `ThreeOfAKind Collection` with
    /// a count of one.
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
    
    //                                                //
    // With Multiple Ranks & Multiple/Only Duplicates //
    //                                                //
    
    /// Tests that retrieving the `ThreeOfAKinds`s in a `RankedCard Collection` that contains only
    /// six `RankedCard`s with two `Rank`s of the same count  returns a `ThreeOfKind`
    /// Collection` with a count of two.
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
    
    //                                           //
    // With Multiple Ranks & Multiple Duplicates //
    //                                           //
    
    /// Tests that retrieving the `ThreeOfAKind`s in a `RankedCard Collection` that contains
    /// multiple `Rank`s and two different sets of duplicate `Rank`s with a count of three each returns a
    /// `ThreeOfAKind Collection` with a count of two.
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
    
    //-------------------------------------------------------------------------//
    //                             getFourOfAKinds()                           //
    //-------------------------------------------------------------------------//
    
    //                   //
    // With Unique Ranks //
    //                   //
    
    /// Tests that retrieving the`FourOfAKind`s in a `RankedCard Collection` that contains unique
    /// `Rank`s returns an empty `Collection`.
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
    
    //                               //
    // With One Rank & One Duplicate //
    //                               //
    
    /// Tests that retrieving the `FourOfAKind`s in a `RankedCard Collection` that contains only
    /// four equally `RankedCard`s returns a `FourOfAKind Collection` with a count of one.
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
    
    //                                     //
    // With One Rank & Multiple Duplicates //
    //                                     //
    
    /// Tests that retrieving the `FourOfAKind`s in a `RankedCard Collection` that contains only
    /// five `RankedCard`s of all the same `Rank` returns a ` FourOfAKind Collection` with a
    /// count of three.
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
    
    //                                          //
    // With Multiple Ranks & Only One Duplicate //
    //                                          //
    
    /// Tests that retrieving the `FourOfAKind`s in a `RankedCard Collection` that contains multiple
    /// `Rank`s and only three duplicate `Rank`s returns a `FourOfAKind Collection` with a count
    /// of one.
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
    
    //                                                //
    // With Multiple Ranks & Multiple/Only Duplicates //
    //                                                //
    
    /// Tests that retrieving the `FourOfAKinds`s in a `RankedCard Collection` that contains only
    /// eight `RankedCard`s with two `Rank`s of the same count  returns a `FourOfKind`
    /// `Collection` with a count of two.
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
    
    //                                           //
    // With Multiple Ranks & Multiple Duplicates //
    //                                           //
    
    /// Tests that retrieving the `FourOfAKind`s in a `RankedCard Collection` that contains multiple
    /// `Rank`s and two different sets of duplicate `Rank`s with a count of four each returns a
    /// `FourOfAKind Collection` with a count of two.
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
    
    //-------------------------------------------------------------------------//
    //                            getSequences()                                //
    //-------------------------------------------------------------------------//
    
    //                       //
    // With Empty Collection //
    //                       //
    
    /// Tests that rerieving the # of sequences in an empty `RankedCard Collection` returns an empty
    /// `Collection`.
    func test_getSequences_withEmptyCollection_returnsEmpty() {
        
        // Given
        let rankedCards: [RankedCard] = []
        
        // When
        let sequences = rankedCards.getSequences()
        
        // Then
        XCTAssert(sequences.isEmpty)
    }
    
    //                                     //
    // With All Non-Sequential RankedCards //
    //                                     //
    
    /// Tests that rerieving the # of sequences in a `RankedCard Collection` that contains all
    /// non-sequential `RankedCard`s returns an empty `Collection`.
    func test_getSequences_withAllNonSequentialRankedCards_returnsEmpty() {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .three, at: 3)
        let rankedCard3 = RankedCard(with: .five, at: 5)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        
        // When
        let sequences = rankedCards.getSequences()
        
        // Then
        XCTAssert(sequences.isEmpty)
    }
    
    //                                                             //
    // With Non-Sequential RankedCards & One Sequential RankedCard //
    //                                                             //
    
    // Count //
    // ~~~~~ //
    
    // Two Sequential RankedCards //
    
    /// Tests that rerieving the # of sequences in a `RankedCard Collection` that contains
    /// non-sequential `RankedCard`s and one sequential `RankedCard` returns a `Collection`
    /// with one sequence.
    func test_getSequences_withNonSequentialAndSequentialRankedCard_returnsOne()
        {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .three, at: 3)
        let rankedCard3 = RankedCard(with: .four, at: 4)
        let rankedCard4 = RankedCard(with: .six, at: 6)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        let expected = 1
        
        // When
        let sequences = rankedCards.getSequences()
        let actual = sequences.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Three Sequential RankedCards //
    
    /// Tests that rerieving the # of sequences in a `RankedCard Collection` that contains
    /// non-sequential `RankedCard`s and sequential `RankedCard`s returns a `Collection`
    /// with one sequence.
    func test_getSequences_withNonSequentialAndSequentialRankedCards_returnsOne()
        {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .three, at: 3)
        let rankedCard3 = RankedCard(with: .four, at: 4)
        let rankedCard4 = RankedCard(with: .five, at: 5)
        let rankedCard5 = RankedCard(with: .seven, at: 7)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
                           rankedCard5]
        let expected = 1
        
        // When
        let sequences = rankedCards.getSequences()
        let actual = sequences.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //        //
    // Values //
    // ~~~~~~ //
    
    // Two Sequential RankedCards //
    
    /// Tests that rerieving the sequences in a `RankedCard Collection` that contains non-sequential
    /// `RankedCard`s and one sequential `RankedCard` returns a `Collection` with the
    /// expeccted sequence.
    func test_getSequences_withNonSequentialAndSequentialCard_returnsExpected()
        {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .three, at: 3)
        let rankedCard3 = RankedCard(with: .four, at: 4)
        let rankedCard4 = RankedCard(with: .six, at: 6)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4]
        let expected = [[rankedCard2, rankedCard3]]
        
        // When
        let actual = rankedCards.getSequences()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Three Sequential RankedCards //
    
    /// Tests that rerieving thesequences in a `RankedCard Collection` that contains non-sequential
    /// `RankedCard`s and sequential `RankedCard`s returns a `Collection` with one sequence.
    func test_getSequences_withNonSequentialAndSequentialCards_returnsExpected()
        {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .three, at: 3)
        let rankedCard3 = RankedCard(with: .four, at: 4)
        let rankedCard4 = RankedCard(with: .five, at: 5)
        let rankedCard5 = RankedCard(with: .seven, at: 7)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3, rankedCard4,
                           rankedCard5]
        let expected = [[rankedCard2, rankedCard3, rankedCard4]]
        
        // When
        let actual = rankedCards.getSequences()
        
        // Then
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
    // ~~~~~~~~~~~~ //
    
    // Count //
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank` returns a
    /// `Dictionary` with a key count equal to the `Collection` count.
    func test_splitByRank_withUniqueRanks_keyCountEqualsCollectionCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank()
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    // Total Count //
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank` returns a
    /// `Dictionary` with total count equal to the `Collection` count.
    func test_splitByRank_withUniqueRanks_totalCountEqualsCollectionCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank()
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
    
    // Duplicate Ranks //
    // ~~~~~~~~~~~~~~~ //
    
    // Count //
    
    /// Tests that splitting a `RankedCard Collection`with duplicate `Rank`s  by `Rank` returns a
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
    
    // Total Count //
    
    /// Tests that splitting a `RankedCard Collection`with duplicate `Rank`s  by `Rank` returns a
    /// `Dictionary` with a total count equal to the `Collection` count.
    func test_splitByRank_withDuplicateRanks_totalCountEqualsCollectionCount()
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
    // ~~~~~~~~~~~~ //
    
    // Count //
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank`where the
    /// given count for a `Rank` equals one returns a `Dictionary` with a key count equal to the
    /// `Collection` count.
    func test_splitByRank_withUniqueRanksWhereCountIsOne_KeyCountEqualsCollectionCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let count = 1
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank`where the
    /// given count for a `Rank` is greater than one  returns a `Dictionary` with zero keys.
    func test_splitByRank_withUniqueRanksWhereCountEqualsTwo_hasZeroKeys()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let count = 2
        let expected = 0
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.count
        
        XCTAssertEqual(expected, actual)
    }
    
    // Total Count //
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank`where the
    /// given count for a `Rank` equals one  returns a `Dictionary` with a total count equal to the
    /// `Collection` count.
    func test_splitByRank_withUniqueRanksWhereCountIsOne_totalCountEqualsCollectionCount()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let count = 1
        let expected = rankedCards.count
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank`where the
    /// given count for a `Rank` is greater than one  returns a `Dictionary` with total count of zero.
    func test_splitByRank_withUniqueRanksWhereCountEqualsTwo_totalCountEqualsZero()
        throws {
        
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        let rankedCard3 = RankedCard(with: .three)
        let rankedCards = [rankedCard1, rankedCard2, rankedCard3]
        let count = 2
        let expected = 0
        
        // When
        let rankedCardsByRank = rankedCards.splitByRank(where: count)
        let actual = rankedCardsByRank.totalCount
        
        XCTAssertEqual(expected, actual)
    }
    
    // Duplicate Ranks //
    // ~~~~~~~~~~~~~~~ //
    
    // Count //
    
    /// Tests that splitting a `RankedCard Collection`with duplicate `Rank`s  by `Rank`where the
    /// count for a `Rank` equals a given count returns a `Dictionary` with an expected key count.
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
    
    // Total Count //
    
    /// Tests that splitting a `RankedCard Collection`with duplicate `Rank`s  by `Rank`where the
    /// count for a `Rank` equals a given count returns a `Dictionary` with an expected total count.
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
    // ~~~~~~~~~~~~~~~~~~~~ //
    
    // Count //
    
    /// Tests that splitting a `RankedCard Collection`with only  duplicate `Rank`s  by `Rank`where
    /// the given count for a `Rank` equals one  returns a `Dictionary` with zero keys.
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
    
    // Total Count //
    
    /// Tests that splitting a `RankedCard Collection`with only duplicate `Rank`s  by `Rank`where
    /// the given count for a `Rank` equals one  returns a `Dictionary` with a total count of zero.
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
    // ~~~~~~~~~~~~ //
    
    // Count //
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank`where the
    /// given count for a `Rank` is greater than zero  returns a `Dictionary` with a key count equal to
    /// the `Collection` count.
    func test_splitByRank_withUniqueRanksWhereCountOverZero_keyCountEqualsCollectionCount()
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
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank`where the
    /// given count for a `Rank` is greater than one  returns a `Dictionary` with zero keys.
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
    
    // Total Count //
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank`where the
    /// given count for a `Rank` is greater than zero  returns a `Dictionary` with a total count equal to
    /// the `Collection` count.
    func test_splitByRank_withUniqueRanksWhereCountOverOne_totalCountEqualsCollectionCount()
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
    
    /// Tests that splitting a `RankedCard Collection`with unique `Rank`s  by `Rank`where the
    /// given count for a `Rank` is greater than one  returns a `Dictionary` with a total count of zero.
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
    // ~~~~~~~~~~~~~~~ //
    
    // Count //
    
    /// Tests that splitting a `RankedCard Collection`with duplicate `Rank`s  by `Rank`where the
    /// count for a `Rank` is greater than a given count returns a `Dictionary` with an expected key
    /// count.
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
    
    // Total Count //
    
    /// Tests that splitting a `RankedCard Collection`with duplicate `Rank`s  by `Rank`where the
    /// count for a `Rank` is greater than a given count returns a `Dictionary` with an expected total
    /// count.
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
