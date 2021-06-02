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
 
    /// Tests that summing the points of all `NumeralCard`s equals 55.
    func test_sumPoints_ofNumeralCards_equals50() throws {
        
        let cards = try PlayingCards.getNumeralCards(with: .hearts)
        let expected = 55
        
        let actual = cards.sumPoints()
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the points of all `FaceCard`s equals 30.
    func test_sumPoints_ofFaceCards_equals30() throws {
        
        let cards = try PlayingCards.getFaceCards(with: .hearts)
        let expected = 30
        
        let actual = cards.sumPoints()
        
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that summing the points of all standard `PlayingCard`s equals 85.
    func test_sumPoints_ofStandardPlayingCards_equals85() throws {
        
        let cards = try PlayingCards.getStandardCards(with: .hearts)
        let expected = 85
        
        let actual = cards.sumPoints()
        
        XCTAssertEqual(expected, actual)
    }
}
    
