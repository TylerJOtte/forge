//=============================================================================//
//                                                                             //
//  RankExtensionTests.swift                                                   //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/26/21.                                       //
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

/// Unit tests for a `PlayingCard Rank`.
class RankExtensionTests: XCTestCase {
    
    /// Tests that a `jack Rank` is royal.
    func test_jack_isRoyal_true() {
        
        // Given
        let rank = Rank.jack
        
        // When/Then
        XCTAssert(rank.isRoyal())
    }
    
    /// Tests that a `queen Rank` is royal.
    func test_queen_isRoyal_true() {
        
        // Given
        let rank = Rank.queen
        
        // When/Then
        XCTAssert(rank.isRoyal())
    }
    
    /// Tests that a `king Rank` is royal.
    func test_king_isRoyal_true() {
        
        // Given
        let rank = Rank.king
        
        // When/Then
        XCTAssert(rank.isRoyal())
    }
}
