//=============================================================================//
//                                                                             //
//  PlayingCardsHelperTests.swift                                              //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/20/21.                                       //
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

/// Unit tests for a `PlayingCards` helper.
class PlayingCardsHelperTests: XCTestCase {
    
    //=========================================================================//
    //                                  GETTERS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                             getNumeralCards()                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving all`NumeralCard`s with an invalid `Suit` throws an `invalidSuit`
    /// `Error`.
    func test_getNumeralCards_withInvalidSuit_throwsInvalidSuitError() throws {

        // Given
        let suit = Suit.stars
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getNumeralCards(with: suit)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
}
