//=============================================================================//
//                                                                             //
//  IntArrayTests.swift                                                        //
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

/// Unit tests for an `Int Array`.
class IntArrayTests: XCTestCase {
 
    //=========================================================================//
    //                               CALCULATORS                               //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               sumPoints()                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that summing all the numbers an `Int Array` with zero elements equals zero.
    func test_sumPoints_ofEmptyArray_equalsZero() throws {
        
        // Given
        let numbers: [Int] = []
        let expected = 0
        
        // When
        let actual = numbers.sum()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing all the numbers in an `Int Array` equals an expected value.
    func test_sumPoints_ofNumbers_equalsExpected() throws {
        
        // Given
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let expected = 55
        
        // When
        let actual = numbers.sum()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
