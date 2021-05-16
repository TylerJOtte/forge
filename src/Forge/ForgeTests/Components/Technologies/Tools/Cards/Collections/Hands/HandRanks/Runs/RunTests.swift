//=============================================================================//
//                                                                             //
//  RunTests.swift                                                             //
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

/// Unit tests for a `Run HandRank`.
class RunTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Failure                                   //
    //-------------------------------------------------------------------------//
    
                            //                    //
                            // Insufficient Cards //
                            //                    //
    

    /// Tests that creating a `Run` with less than three `PlayingCards` throws an
    /// `ElementsError.insufficientElements Error`.
    func test_init_withInsufficientCards_throwsError() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let cards = [ace, two]
        let expected = ElementsError.insufficientElements
        
        // When
        XCTAssertThrowsError(try Run(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
                          //                      //
                          // Non-Sequential Cards //
                          //                      //

    /// Tests that creating a `Run` with`PlayingCards`that are not in sequential order throws an
    /// `ElementsError.areNotSequential Error`.
    func test_init_withNontSequentialCards_throwsError() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let cards = [ace, three, two]
        let expected = ElementsError.areNotSequential
        
        // When
        XCTAssertThrowsError(try Run(of: cards)) { error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `Run` equals "Run".
    func test_title_ofRun_equalsRun() throws {

        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let cards = [ace, two, three]
        let run = try Run(of: cards)
        let expected = "Run"

        // When
        let actual = run.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a`Run` equals the # of `Card`s it holds.
    func test_points_ofRun_equalsNCards() throws {
        
        // Given
        let ace = try Ace(of: .hearts)
        let two = try Two(of: .hearts)
        let three = try Three(of: .hearts)
        let cards = [ace, two, three]
        let run = try Run(of: cards)
        let expected = run.count
        
        // When
        let actual = run.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
