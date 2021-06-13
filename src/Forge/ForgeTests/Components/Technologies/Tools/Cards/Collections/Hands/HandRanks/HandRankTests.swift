//=============================================================================//
//                                                                             //
//  HandRankTests.swift                                                        //
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

/// Unit tests for the `HandRank` class.
class HandRankTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Min                                //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `HandRank` with a min less than zero throws an `invalidMin Error`.
    func test_init_withMinLessThanZero_throwsInvalidMinError() throws {

        // Given
        let min = -1
        let max = Int.max
        let card = RankedCard()
        let cards = [card]
        let points = 1
        let expected = RangeError.invalidMin

        // When
        XCTAssertThrowsError(try HandRank(of: min, to: max, cards,
                                          worth: points)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
}
