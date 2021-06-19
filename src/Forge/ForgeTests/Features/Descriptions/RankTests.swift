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
}
    
