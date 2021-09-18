//=============================================================================//
//                                                                             //
//  RankTests.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/19/21.                                       //
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

/// Unit tests for a `Rank`.
class RankTests: XCTestCase {
 
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                 Title                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a new `Rank` equals its capitalized name.
    func test_title_ofNewRank_equalsCapitalizedName() {
        
        // Given
        let rank = Rank.ace
        let expected = "Ace"
        
        // When
        let actual = rank.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                                TESTERS                                  //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                             hasRawValue()                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that a below range `Rank` does not have a raw value within a range.
    func test_hasRawValue_withBelowRangeRank_false() {
        
        // Given
        let rank = Rank.ace
        let min = 2
        let max = 10
        
        // When/Then
        XCTAssertFalse(rank.hasRawValue(from: min, to: max))
    }
    
    /// Tests that a min range `Rank` has a raw value within a range.
    func test_hasRawValue_minRangeRank_true() {
        
        // Given
        let rank = Rank.two
        let min = 2
        let max = 10
        
        // When/Then
        XCTAssert(rank.hasRawValue(from: min, to: max))
    }
    
    /// Tests that a max range `Rank` has a raw value within a range.
    func test_hasRawValue_maxRangeRank_true() {
        
        // Given
        let rank = Rank.ten
        let min = 2
        let max = 10
        
        // When/Then
        XCTAssert(rank.hasRawValue(from: min, to: max))
    }
    
    /// Tests that an above range `Rank` does not have a raw value within a range.
    func test_hasRawValue_withAboveRangeRankfalse() {
        
        // Given
        let rank = Rank.jack
        let min = 2
        let max = 10
        
        // When/Then
        XCTAssertFalse(rank.hasRawValue(from: min, to: max))
    }
}
    
