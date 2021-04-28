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
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a`Card` that has a title starting with a letter earlier in the alphabet than another `Card`'s
    /// title is less than the latter.
    func test_isLessThan_earlierTitleAlphaStart_true() {
        
        // Given
        let title1 = "A Card"
        let title2 = "B Card"
        let card1 = Card(title1)
        let card2 = Card(title2)
        
        // When/Then
        XCTAssertLessThan(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
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
    
    //-------------------------------------------------------------------------//
    //                              Greater Than                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that a`Card` that has a title starting with a letter later in the alphabet than another `Card`'s
    /// title is greater than the latter.
    func test_isGreaterThan_laterTitleAlphaStart_true() {
        
        // Given
        let title1 = "Z Card"
        let title2 = "A Card"
        let card1 = Card(title1)
        let card2 = Card(title2)
        
        // When/Then
        XCTAssertGreaterThan(card1, card2)
    }
}
