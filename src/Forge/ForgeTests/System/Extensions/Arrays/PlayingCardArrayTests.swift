//=============================================================================//
//                                                                             //
//  PlayingCardArrayTests.swift                                                //
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

/// Unit tests for a `PlayingCard Array`.
class PlayingCardArrayTests: XCTestCase {
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              splitBySuit()                              //
    //-------------------------------------------------------------------------//
    
    //              //
    // NumeralCards //
    //              //
    
    /// Tests that splitting all`NumeralCard`s with one `Suit` by `Suit` has a count of one.
    func test_splitBySuit_NumeralCardsWithOneSuit_hasCountOfOne() throws {
        
        // Given
        let cards = try PlayingCards.getNumeralCards(with: .hearts)
        let expected = 1
        
        // When
        let cardsBySuit = cards.splitBySuit()
        let actual = cardsBySuit.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
