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
    
    /// Tests that an empty `Dictionary` has a total count of zero.
    func test_totalCount_withEmptyDictionary_equalsZero() throws {
        
        // Given
        let expected = 0
        
        // When
        let dictionary: [Rank:[RankedCard]] = [:]
        let actual = dictionary.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that a `Dictionary` with one `Key` and an empty `Collection`  has a total count of
    /// zero.
    func test_totalCount_withOneKeyAndEmptyCollection_equalsZero() throws {
        
        // Given
        let expected = 0
        
        // When
        let dictionary: [Rank:[RankedCard]] = [.ace:[]]
        let actual = dictionary.totalCount
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
