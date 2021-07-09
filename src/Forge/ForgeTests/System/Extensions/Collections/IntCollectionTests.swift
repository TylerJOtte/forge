//=============================================================================//
//                                                                             //
//  IntCollectionTests.swift                                                   //
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

/// Unit tests for an `Int Collection`.
class IntCollectionTests: XCTestCase {
 
    //=========================================================================//
    //                               CALCULATORS                               //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               sumPoints()                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the sum of a `Collection` without any numbers equals zero.
    func test_sum_withoutNumbers_equalsZero() throws {
        
        // Given
        let numbers: [Int] = []
        let expected = 0
        
        // When
        let actual = numbers.sum
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the sum of a `Collection`with numbers equals an expected value.
    func test_sum_withNumbers_equalsExpected() throws {
        
        // Given
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let expected = 55
        
        // When
        let actual = numbers.sum
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
