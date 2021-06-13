//=============================================================================//
//                                                                             //
//  MultiRunTests.swift                                                        //
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

/// Unit tests for the `MultiRun` class.
class MultiRunTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                              Invalid Min                                //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `MultiRun` with a min less than four throws an `invalidMin Error`.
    func test_init_withMinLessThanFour_throwsInvalidMinError() throws {

        // Given
        let min = 3
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king1 = try King(of: .hearts)
        let king2 = try King(of: .spades)
        let cards = [jack, queen, king1, king2]
        let count = 2
        let expected = RangeError.invalidMin

        // When
        XCTAssertThrowsError(try MultiRun(of: min, cards, with: count)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
}
