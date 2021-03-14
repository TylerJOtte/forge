//=============================================================================//
//                                                                             //
//  CardTests.swift                                                                 //
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

/// Unit tests for the `Card` class.
class CardTests: XCTestCase {
    
    /// Tests that two `Card`s with the same titles are equal.
    func testAreEqual_SameTitle_True() {
        
        // Given
        let title = "Card"
        let card1 = Card(title)
        let card2 = Card(title)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
}
