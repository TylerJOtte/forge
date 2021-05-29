//=============================================================================//
//                                                                             //
//  FlushTests.swift                                                           //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/13/21.                                       //
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
import SwiftUI
@testable import Forge

/// Unit tests for a `Flush HandRank`.
class FlushTests: XCTestCase {
   
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Count                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Flush` with less than four`Card`s throws an `invalidCount Error`.
    func test_init_withInsufficientCards_throwsInvalidCountError() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let cards = [ten, jack, queen]
        let expected = ElementsError.invalidCount
        
        // When
        XCTAssertThrowsError(try Flush(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                             Multiple Suits                              //
    //-------------------------------------------------------------------------//

    /// Tests that creating a `Flush` with `Cards`that do not all have the same `Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withMultipleSuits_throwsInvalidSuitError() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .diamonds)
        let cards = [ten, jack, queen, king]
        let expected = DepictionError.invalidSuit
        
        // When
        XCTAssertThrowsError(try Flush(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a`Flush` equals N `Card`s given.
    func test_points_ofFlush_equalsNCards() throws {
        
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let flush = try Flush(of: cards)
        let expected = 4
        
        // When
        let actual = flush.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the min cards  of a `Flush` equals four.
    func test_minCards_ofFlush_equalsFour() throws {
        
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let flush = try Flush(of: cards)
        let expected = 4
        
        // When
        let actual = flush.minCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards  of a `Flush` equals the system max.
    func test_maxCards_ofFlush_equalsSystemMax() throws {
        
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let flush = try Flush(of: cards)
        let expected = Int.max
        
        // When
        let actual = flush.maxCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a `Flush` equals the # of `PlayingCards` given.
    func test_count_ofFlush_equalsNCardsGiven() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let flush = try Flush(of: cards)
        let expected = 4
        
        // When
        let actual = flush.count
        
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Capacity                                  //
    //-------------------------------------------------------------------------//

    /// Tests that the capacity of  a`Flush` with the min # of `Card`s equals the expected value.
    func test_capacity_ofFlushWithMinCards_equalsExpected() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let flush = try Flush(of: cards)
        let expected = 9223372036854775803

        // When
        let actual = flush.capacity

        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Flush` equals "Flush".
    func test_title_ofFlush_equalsFlush() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ten, jack, queen, king]
        let flush = try Flush(of: cards)
        let expected = "Flush"

        // When
        let actual = flush.title

        // Then
        XCTAssertEqual(expected, actual)
    }
}
