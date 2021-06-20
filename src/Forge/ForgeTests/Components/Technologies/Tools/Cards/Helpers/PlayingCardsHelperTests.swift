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
    
    /// Tests that retrieving all`NumeralCard`s with a `Suit` returns ten `NumeralCard`s.
    func test_getNumeralCards_withSuit_throwsInvalidSuitError() throws {

        // Given
        let suit = Suit.hearts
        let expected = 10
        
        // When
        let numeralCards = try PlayingCards.getNumeralCards(with: suit)
        let actual = numeralCards.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving all`NumeralCard`s with `Suit`s that contain an invalid `Suit` throws an
    /// `invalidSuit Error`.
    func test_getNumeralCards_withInvalidSuits_throwsInvalidSuitError() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.stars
        let suits = [suit1, suit2]
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getNumeralCards(with: suits)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              getFaceCards()                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving all`FaceCard`s with an invalid `Suit` throws an `invalidSuit Error`.
    func test_getFaceCards_withInvalidSuit_throwsInvalidSuitError() throws {

        // Given
        let suit = Suit.stars
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getFaceCards(with: suit)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that retrieving all`FaceCard`s with `Suit`s that contain an invalid `Suit` throws an
    /// `invalidSuit Error`.
    func test_getFaceCards_withInvalidSuits_throwsInvalidSuitError() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.stars
        let suits = [suit1, suit2]
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getFaceCards(with: suits)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                           getStandardCards()                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving all standard `PlayingCard`s with an invalid `Suit` throws an
    /// `invalidSuit Error`.
    func test_getStandardCards_withInvalidSuit_throwsInvalidSuitError() throws {

        // Given
        let suit = Suit.stars
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getStandardCards(with: suit)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    /// Tests that retrieving all standard`PlayingCard`s with `Suit`s that contain an invalid `Suit`
    /// throws an `invalidSuit Error`.
    func test_getStandardCards_withInvalidSuits_throwsInvalidSuitError() throws {

        // Given
        let suit1 = Suit.hearts
        let suit2 = Suit.stars
        let suits = [suit1, suit2]
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getStandardCards(with: suits)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              getAllCards()                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that retrieving all`PlayingCard`s, `Joker`s included, with an invalid `Suit` throws an
    /// `invalidSuit Error`.
    func test_getAllCards_withInvalidSuit_throwsInvalidSuitError() throws {

        // Given
        let suit = Suit.stars
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try PlayingCards.getAllCards(with: suit)) {
            error in

            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
}
