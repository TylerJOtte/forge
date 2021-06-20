//=============================================================================//
//                                                                             //
//  CollectionDictionaryExtensionTests.swift                                   //
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

/// Unit tests for a `Collection Dictionary extension`.
class CollectionDictionaryExtensionTests: XCTestCase {
 
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Properties                                 //
    //-------------------------------------------------------------------------//
    
    //            //
    // totalCount //
    //            //
    
    /// Tests that the total count of an empty `Dictionary` equals zero.
    func test_totalCount_withEmptyDictionary_equalsZero() throws {
        
        // Given
        let expected = 0
        
        // When
        let dictionary: [Rank: [RankedCard]] = [:]
        let actual = dictionary.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the total count of a `Dictionary` with all entries containing empty `Collection`s
    /// equals zero.
    func test_totalCount_withEmptyCollections_equalsZero() throws {
        
        // Given
        let key1 = Rank.ace
        let key2 = Rank.two
        let value1: [RankedCard] = []
        let value2: [RankedCard] = []
        let expected = 0

        // When
        let dictionary = [key1: value1, key2: value2]
        let actual = dictionary.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the total count of a `Dictionary` with entries containing empty and filled
    /// `Collection`s equals the sum of all the `Collection`s' counts.
    func test_totalCount_withEmptyAndFilledCollections_equalsCollectionCountsSum()
        throws {
        
        // Given
        let key1 = Rank.ace
        let key2 = Rank.two
        let key3 = Rank.three
        let value1 = [RankedCard()]
        let value2: [RankedCard] = []
        let value3 = [RankedCard(), RankedCard(), RankedCard()]
        let expected = 4
        
        // When
        let dictionary = [key1: value1, key2: value2, key3: value3]
        let actual = dictionary.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
