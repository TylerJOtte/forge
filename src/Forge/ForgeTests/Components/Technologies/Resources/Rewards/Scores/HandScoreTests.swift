//=============================================================================//
//                                                                             //
//  HandScoreTests.swift                                                       //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/14/21.                                       //
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

/// Unit tests for a `HandScore`.
class HandScoreTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `HandScore` with an empty `HandRank` results in points equal to zero.
    func test_intit_withEmptyHandRanks_pointsEqualZero() {
        
        // Given
        let handRanks: [String:[HandRank]] = [:]
        let expected = 0
        
        // When
        let handScore = HandScore(with: handRanks)
        let actual = handScore.points

        // Then
        XCTAssertEqual(expected, actual)
    }
}
