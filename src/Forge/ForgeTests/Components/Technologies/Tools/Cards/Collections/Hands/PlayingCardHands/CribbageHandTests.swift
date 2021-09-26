//=============================================================================//
//                                                                             //
//  CribbageHandTests.swift                                                    //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/29/21.                                       //
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

/// Unit tests for a`CribbageHand`.
class CribbageHandTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                             Excessive Cards                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `CribbageHand` with more than four `Card`s throws an
    /// `ElementsError.excessiveElements Error`.
    func test_init_withExcessiveCards_throwsError() throws {

        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let aceOfHearts = try Ace(of: .hearts)
        let cutCard = try Five(of: .hearts)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades,
                     aceOfHearts]
        let expected = ElementsError.invalidCount
        
        // When
        XCTAssertThrowsError(try CribbageHand(with: cards, and: cutCard)) {
            error in
            
            // Then
            XCTAssertEqual(expected, error as? ElementsError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                                  Jokers                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a `CribbageHand` with a `Joker` throws a
    /// `FeatureError.jokersNotAllowed Error`.
    func test_init_withJoker_throwsError() throws {

        // Given
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let joker = Joker(color: .red)
        let cutCard = try Five(of: .hearts)
        let cards = [fiveOfDiamonds, fiveOfClubs, fiveOfSpades, joker]
        let expected = DescriptionError.invalidRank
        
        // When
        XCTAssertThrowsError(try CribbageHand(with: cards, and: cutCard)) {
            error in
            
            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    /// Tests that creating a `CribbageHand` with a `Joker`as the cut `Card` throws a
    /// `FeatureError.jokersNotAllowed Error`.
    func test_init_withJokerCutCard_throwsError() throws {

        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let cutCard = Joker(color: .red)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades]
        let expected = DescriptionError.invalidRank
        
        // When
        XCTAssertThrowsError(try CribbageHand(with: cards, and: cutCard)) {
            error in
            
            // Then
            XCTAssertEqual(expected, error as? DescriptionError)
        }
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a `CribbageHand` equals "Cribbage Hand".
    func test_title_ofCribbageHand_equalsCribbageHand() throws {
        
        // Given
        let fiveOfHearts = try Five(of: .hearts)
        let fiveOfSpades = try Five(of: .spades)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let jackOfClubs = try Jack(of: .clubs)
        let cards = [fiveOfHearts, fiveOfSpades, fiveOfDiamonds, jackOfClubs]
        let cutCard = try Five(of: .clubs)
        let cribbageHand = try CribbageHand(with: cards, and: cutCard)
        let expected = "Cribbage Hand"
        
        // When
        let actual = cribbageHand.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                             Min/Max Cards                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that the min `Card`s  of a`CribbageHand` equals zero.
    func test_minCards_ofCribbageHand_equalsZero() throws {
        
        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let cutCard = try Five(of: .hearts)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades]
        let expected = 0
        let cribbageHand = try CribbageHand(with: cards, and: cutCard)
        
        // When
        let actual = cribbageHand.minCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the max `Card`s  of a`CribbageHand` equals four.
    func test_maxCards_ofCribbageHand_equalsFour() throws {
        
        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let cutCard = try Five(of: .hearts)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades]
        let expected = 4
        let cribbageHand = try CribbageHand(with: cards, and: cutCard)
        
        // When
        let actual = cribbageHand.maxCards
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                 Count                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the count of a`CribbageHand` equals the # of `Card`s given.
    func test_count_ofCribbageHand_equalsNCards() throws {
        
        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let cutCard = try Five(of: .hearts)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades]
        let expected = 4
        let cribbageHand = try CribbageHand(with: cards, and: cutCard)
        
        // When
        let actual = cribbageHand.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                               Cut Card                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that the cut `Card` of a`CribbageHand` equals the given cut `Card`.
    func test_cutCard_ofCribbageHand_equalsGivenCutCard() throws {
        
        // Given
        let jackOfHearts = try Jack(of: .hearts)
        let fiveOfDiamonds = try Five(of: .diamonds)
        let fiveOfClubs = try Five(of: .clubs)
        let fiveOfSpades = try Five(of: .spades)
        let cutCard = try Five(of: .hearts)
        let cards = [jackOfHearts, fiveOfDiamonds, fiveOfClubs, fiveOfSpades]
        let expected = cutCard
        let cribbageHand = try CribbageHand(with: cards, and: cutCard)
        
        // When
        let actual = cribbageHand.cutCard
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
