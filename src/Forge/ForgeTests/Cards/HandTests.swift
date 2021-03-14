//=============================================================================//
//                                                                             //
//  HandTests.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 3/14/21.                                       //
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

/// Unit tests for the `Hand` class.
class HandTests: XCTestCase {
    
    // TODO: Add is not empty test
    // TODO: Add non-empty hand count > 0 test
    
    /// Tests that a`Hand` is empty.
    func testIsEmpty() {
        
        // Given
        let hand: Hand = Hand()
        
        // When/Then
        XCTAssert(hand.isEmpty())
    }
    
    /// Tests that an empty `Hand`'s count is zero.
    func testEmptyHandCountIsZero() {
        
        // Given
        let hand: Hand = Hand()
        let expected = 0
        
        // When
        let isEmpty = hand.isEmpty()
        let actual = hand.count
        
        // Then
        XCTAssertTrue(isEmpty && expected == actual)
    }
}
