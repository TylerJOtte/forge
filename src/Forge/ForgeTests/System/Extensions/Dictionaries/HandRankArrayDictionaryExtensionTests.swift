//=============================================================================//
//                                                                             //
//  HandRankArrayDictionaryExtensionTests.swift                                //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/20/21.                                       //
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

/// Unit tests for a `HandRank Array Dictionary extension`.
class HandRankArrayDictionaryExtensionTests: XCTestCase {
 
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               sumPoints()                               //
    //-------------------------------------------------------------------------//

    /// Tests that summing the points of an empty `Dictionary` equals zero.
    func test_sumPoints_withEmptyDictionary_equalsZero() {
        
        // Given
        let dictionary: [Rank: [HandRank]] = [:]
        let expected = 0
        
        // When
        let actual = dictionary.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the points of a `Dictionary` with all entries containing empty `HandRank`
    /// `Array`s equals zero.
    func test_sumPoint_withEmptyHandRankArrays_equalsZero() {
        
        // Given
        let key1 = "Pair"
        let key2 = "Run"
        let value1: [HandRank] = []
        let value2: [HandRank] = []
        let dictionary = [key1: value1, key2: value2]
        let expected = 0

        // When
        let actual = dictionary.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the points of a `Dictionary` with entries containing empty and filled
    /// `HandRank Array`s equals the sum of all the `HandRank Array`s' point sums.
    func test_sumPoints_withEmptyAndFilledArrays_equalsSumOfAllArraySums()
        throws {
        
        // Given
        let key1 = "Pair"
        let key2 = "Flush"
        let key3 = "Run"
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .spades)
        let pairCards = [king1, king2]
        let runCards1 = [jack, queen, king1]
        let runCards2 = [jack, queen, king2]
        let pair = try Pair(of: pairCards)
        let run1 = try Run(of: runCards1)
        let run2 = try Run(of: runCards2)
        let value1 = [pair]
        let value2: [HandRank] = []
        let value3 = [run1, run2]
        let dictionary = [key1: value1, key2: value2, key3: value3]
        let expected = 8
        
        // When
        let actual = dictionary.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
