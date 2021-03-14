//=============================================================================//
//                                                                             //
//  DeckTests.swift                                                                 //
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

/// Unit tests for the `Deck` class.
class DeckTests: XCTestCase {
    
    // TODO: Add is not empty test
    // TODO: Add non-empty deck count > 0 test
    
    /// Tests that a`Deck` is empty.
    func testIsEmpty() {
        
        // Given
        let deck: Deck = Deck()
        
        // When/Then
        XCTAssert(deck.isEmpty())
    }
    
    /// Tests that an empty `Deck`'s count is zero.
    func testEmptyDeckCountIsZero() {
        
        // Given
        let deck: Deck = Deck()
        let expected = 0
        
        // When
        let isEmpty = deck.isEmpty()
        let actual = deck.count
        
        // When/Then
        XCTAssertTrue(isEmpty && expected == actual)
    }
}
