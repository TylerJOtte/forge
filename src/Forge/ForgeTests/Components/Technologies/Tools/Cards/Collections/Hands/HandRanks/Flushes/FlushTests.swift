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
    //                            Insufficient Cards                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Flush` with less than four`PlayingCards` throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withInsufficientCards_throwsError() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let cards = [ten, jack, queen]
        let expected = ElementsError.insufficientElements
        
        // When
        XCTAssertThrowsError(try Flush(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    /// Tests that creating a `Flush` with `PlayingCards`that do not all have the same `Suit` throws
    /// an `ElementsError.insufficientElements Error`.
    func test_init_withMultipleSuits_throwsError() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .diamonds)
        let cards = [ten, jack, queen, king]
        let expected = ElementsError.insufficientElements
        
        // When
        XCTAssertThrowsError(try Flush(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
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
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title with four `Card`s equals "Flush".
    func test_title_withFourCards_equalsFlush() throws {

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

    /// Tests that the title with five`Cards` in sequential order equals "Straight Flush".
    func test_title_withFiveSequentialCards_equalsStraightlush() throws {

        // Given
        let nine = try Nine(of: .hearts)
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [nine, ten, jack, queen, king]
        let flush = try Flush(of: cards)
        let expected = "Straight Flush"

        // When
        let actual = flush.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title with five`Cards` in sequential order from `.ten` to `.ace` equals
    /// "Royal Flush".
    func test_title_withSequentialTenToAceCards_equalsRoyalFlush() throws {

        // Given
        let isHigh = true
        let ten = try Ten(of: .hearts)
        let jack = try Jack(of: .hearts)
        let queen = try Queen(of: .hearts)
        let king = try King(of: .hearts)
        let ace = try Ace(of: .hearts, and: isHigh)
        let cards = [ten, jack, queen, king, ace]
        let flush = try Flush(of: cards)
        let expected = "Royal Flush"

        // When
        let actual = flush.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
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
}
