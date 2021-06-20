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
    func test_sumPoints_withEmptyDictionary_equalsZero() throws {
        
        // Given
        let dictionary: [Rank: [HandRank]] = [:]
        let expected = 0
        
        // When
        let actual = dictionary.sumPoints()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
