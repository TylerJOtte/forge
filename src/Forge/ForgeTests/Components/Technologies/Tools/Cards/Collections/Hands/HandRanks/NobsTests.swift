//=============================================================================//
//                                                                             //
//  NobsTests.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/12/21.                                       //
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

/// Unit tests for a `Nobs HandRank`.
class NobsTests: XCTestCase {
   
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                            Insufficient Cards                           //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating `Nobs` with less than two`Cards` throws an `invalidCount Error`.
    func test_init_withInsufficientCards_throwsInvalidCountError() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let cards = [jack]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                             Excessive Cards                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating `Nobs` with more than two`Cards` throws an `invalidCount Error`.
    func test_init_withExcessiveCards_throwsInvalidCountError() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let jack = try Jack(of: .hearts)
        let king = try King(of: .hearts)
        let cards = [ace, jack, king]
        let expected = ElementsError.invalidCount

        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                              Invalid Ranks                              //
    //-------------------------------------------------------------------------//
    

    /// Tests that creating `Nobs` without a `Jack` throws an `invalidRank Error`.
    func test_init_withoutJack_throwsInvalidRankError() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let cards = [ace, two]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    /// Tests that creating `Nobs` without a non-`Jack` throws an `invalidRank Error`.
    func test_init_withoutNonJack_throwsInvalidRankError() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let joker = Joker(color: .red)
        let cards = [jack, joker]
        let expected = DescriptionError.invalidRank

        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                             Multiple Suits                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating `Nobs` with `Cards`that do not all have the same `Suit` throws an
    /// `invalidSuit Error`.
    func test_init_withMultipleSuits_throwsInvalidSuitError() throws {
        
        // Given
        let jack = try Jack(of: .hearts)
        let ace = try Ace(of: .spades)
        let cards = [jack, ace]
        let expected = DepictionError.invalidSuit

        // When
        XCTAssertThrowsError(try Nobs(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? DepictionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a new`Nobs` created with `Card`s equals "Nobs".
    func test_title_ofNewNobsWithCards_equalsNobs() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ace, jack]
        let nobs = try Nobs(of: cards)
        let expected = "Nobs"
        
        // When
        let actual = nobs.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of `Nobs` equals one.
    func test_points_ofNobs_equalsOne() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ace, jack]
        let nobs = try Nobs(of: cards)
        let expected = 1
        
        // When
        let actual = nobs.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the min cards  of `Nobs` equals two.
    func test_minCards_ofNobs_equalsTwo() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ace, jack]
        let nobs = try Nobs(of: cards)
        let expected = 2
        
        // When
        let actual = nobs.minCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards  of `Nobs` equals two.
    func test_maxCards_ofNobs_equalsTwo() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ace, jack]
        let nobs = try Nobs(of: cards)
        let expected = 2
        
        // When
        let actual = nobs.maxCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of `Nobs` equals two.
    func test_count_ofNobs_equalsTwo() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ace, jack]
        let nobs = try Nobs(of: cards)
        let expected = 2
        
        // When
        let actual = nobs.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Capacity                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the capacity of `Nobs` equals 0.
    func test_capacity_ofNobs_equals0() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let jack = try Jack(of: .hearts)
        let cards = [ace, jack]
        let nobs = try Nobs(of: cards)
        let expected = 0

        // When
        let actual = nobs.capacity

        XCTAssertEqual(expected, actual)
    }
}
