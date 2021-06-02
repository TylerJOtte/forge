//=============================================================================//
//                                                                             //
//  ScoreableArrayTests.swift                                                  //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/02/21.                                       //
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

/// Unit tests for a `Scoreable Array`.
class ScoreableArrayTests: XCTestCase {
 
    /// Tests that summing the points of all `Numeral PlayingCard`s equals 50.
    func test_sumPoints_ofNumeralCards_equals50() throws {
        
        let cards = try PlayingCards.getNumeralCards(with: .hearts)
        let expected = 55
        
        let actual = cards.sumPoints()
        
        XCTAssertEqual(expected, actual)
    }
}
    
