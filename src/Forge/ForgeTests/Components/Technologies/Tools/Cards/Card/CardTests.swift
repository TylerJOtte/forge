//=============================================================================//
//                                                                             //
//  CardTests.swift                                                            //
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
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Tests that two `Card`s with the same titles are equal.
    func test_areEqual_sameTitles_true() {
        
        // Given
        let title = "Card"
        let card1 = Card(title)
        let card2 = Card(title)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that two `Card`s with different titlte are not equal.
    func test_areNotEqual_differentTitles_true() {
        
        // Given
        let title1 = "Card 1"
        let title2 = "Card 2"
        let card1 = Card(title1)
        let card2 = Card(title2)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
}
