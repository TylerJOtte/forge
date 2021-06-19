//=============================================================================//
//                                                                             //
//  PlayingCardHandTests.swift                                                 //
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

/// Unit tests for a `PlayingCardHand`.
class PlayingCardHandTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `PlayingCardHand` equals "Playing Card Hand".
    func test_title_ofDefaultPlayingCardHand_equalsPlayingCardHand() {
        
        // Given
        let playingCardHand = PlayingCardHand()
        let expected = "Playing Card Hand"
        
        // When
        let actual = playingCardHand.title

        // Then
        XCTAssertEqual(expected, actual)
    }
}
