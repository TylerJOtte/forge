//=============================================================================//
//                                                                             //
//  FifteenTests.swift                                                         //
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

/// Unit tests for the `Fifteen HandRank`.
class FifteenTests: XCTestCase {
   
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                              Invalid Count                              //
    //-------------------------------------------------------------------------//

    // TODO: Currently, no single Card has points that equal 15. The
    //       invalidPoints Error will be caught before an insufficient Card
    //       count will be. When enable creating Cards with custom points in the
    //       future, add a test that ensures an invalidCount Error is thrown when
    //       creating a Fifteen with one Card worth 15 points.
    
    //-------------------------------------------------------------------------//
    //                             Excessive Cards                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Fifteen` with more than five`Cards` throws an `invalidCount`
    /// `Error`.
    func test_init_withExcessiveCards_throwsInvalidCountError() throws {

        // Given
        let ace1 = try Ace(of: .hearts)
        let ace2 = try Ace(of: .diamonds)
        let ace3 = try Ace(of: .spades)
        let ace4 = try Ace(of: .clubs)
        let two = try Two(of: .hearts)
        let nine = try Nine(of: .hearts)
        let cards = [ace1, ace2, ace3, ace4, two, nine]
        let expected = ElementsError.invalidCount
        
        // When
        XCTAssertThrowsError(try Fifteen(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }

    //-------------------------------------------------------------------------//
    //                              Invalid Points                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Fifteen` with`Cards`that have a point sum less than 15 throws an
    /// `invalidPoints Error`.
    func test_init_withLessThan15CardPoints_throwsInvalidPointsError() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let five = try Four(of: .hearts)
        let cards = [ten, five]
        let expected = ScoreError.invalidPoints
        
        // When
        XCTAssertThrowsError(try Fifteen(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ScoreError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                            Excessive Points                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `Fifteen` with`Cards`that have a point sum more than 15 throws an
    /// `invalidPoints Error`.
    func test_init_withMOreThan15CardPoints_throwsInvalidPointsError() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let five = try Six(of: .hearts)
        let cards = [ten, five]
        
        let expected = ScoreError.invalidPoints
        
        // When
        XCTAssertThrowsError(try Fifteen(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ScoreError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a `Fifteen` equals two.
    func test_points_ofFifteen_equalsTwo() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let five = try Five(of: .hearts)
        let cards = [ten, five]
        let fifteen = try Fifteen(of: cards)
        let expected = 2
        
        // When
        let actual = fifteen.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the min cards  of a `Fifteen` equals two.
    func test_minCards_ofFifteen_equalsTwo() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let five = try Five(of: .hearts)
        let cards = [ten, five]
        let fifteen = try Fifteen(of: cards)
        let expected = 2
        
        // When
        let actual = fifteen.minCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max cards  of a `Fifteen` equals five.
    func test_maxCards_ofFifteen_equalsFive() throws {
        
        // Given
        let ten = try Ten(of: .hearts)
        let five = try Five(of: .hearts)
        let cards = [ten, five]
        let fifteen = try Fifteen(of: cards)
        let expected = 5
        
        // When
        let actual = fifteen.maxCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a `Fifteen` equals the # of `PlayingCards` given.
    func test_count_ofFifteen_equalsNCardsGiven() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        let five = try Five(of: .hearts)
        let cards = [ace, two, three, four, five]
        let fifteen = try Fifteen(of: cards)
        let expected = 5
        
        // When
        let actual = fifteen.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Capacity                                   //
    //-------------------------------------------------------------------------//

    /// Tests that the capacity of a `Fifteen` with two `Cards` equals 3.
    func test_capacity_ofFifteenWithTwoCards_equals3() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let five = try Five(of: .hearts)
        let cards = [ten, five]
        let fifteen = try Fifteen(of: cards)
        let expected = 3

        // When
        let actual = fifteen.capacity

        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the capacity of a `Fifteen` with three`Cards` equals 2.
    func test_capacity_ofFifteenWithThreeCards_equals2() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let four = try Four(of: .hearts)
        let ace = try Ace(of: .hearts)
        let cards = [ten, four, ace]
        let fifteen = try Fifteen(of: cards)
        let expected = 2

        // When
        let actual = fifteen.capacity

        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the capacity of a `Fifteen` with four`Cards` equals 1.
    func test_capacity_ofFifteenWithFourCards_equals1() throws {

        // Given
        let nine = try Nine(of: .hearts)
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let cards = [nine, ace, two, three]
        let fifteen = try Fifteen(of: cards)
        let expected = 1

        // When
        let actual = fifteen.capacity

        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the capacity of a `Fifteen` with five`Cards` equals 0.
    func test_capacity_ofFifteenWithFiveCards_equals0() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let four = try Four(of: .hearts)
        let five = try Five(of: .hearts)
        let cards = [ace, two, three, four, five]
        let fifteen = try Fifteen(of: cards)
        let expected = 0

        // When
        let actual = fifteen.capacity

        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a`Fifteen` equals "Fifteen".
    func test_title_ofFifteen_equalsFifteen() throws {

        // Given
        let ten = try Ten(of: .hearts)
        let five = try Five(of: .hearts)
        let cards = [ten, five]
        let fifteen = try Fifteen(of: cards)
        let expected = "Fifteen"

        // When
        let actual = fifteen.title

        // Then
        XCTAssertEqual(expected, actual)
    }
}
