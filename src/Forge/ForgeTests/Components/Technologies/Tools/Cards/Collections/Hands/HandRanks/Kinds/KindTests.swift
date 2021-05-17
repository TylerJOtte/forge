//=============================================================================//
//                                                                             //
//  KindTests.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/16/21.                                       //
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

/// Unit tests for a `Kind HandRank`.
class KindTests: XCTestCase {

    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Min                                //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Kind` with a min less than than 2 throws an `invalidMin Error`
    func test_init_withInvalidMin_throwsInvalidMinError() throws {

        // Given
        let min = 1
        let max = 2
        let card1 = try Ace(of: .hearts)
        let card2 = try Ace(of: .spades)
        let cards = [card1, card2]
        let expected = RangeError.invalidMin

        // When
        XCTAssertThrowsError(try Kind(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              Invalid Max                                //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Kind` with a max less than than the min throws an `invalidMax Error`
    func test_init_withInvalidMax_throwsInvalidMaxError() throws {

        // Given
        let min = 2
        let max = 1
        let card = try Ace(of: .hearts)
        let cards = [card]
        let expected = RangeError.invalidMax

        // When
        XCTAssertThrowsError(try Kind(of: min, to: max, cards)) { error in

            // Then
            XCTAssertEqual(expected, error as? RangeError)
        }
    }
}
