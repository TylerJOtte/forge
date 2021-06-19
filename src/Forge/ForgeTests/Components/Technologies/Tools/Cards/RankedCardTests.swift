//=============================================================================//
//                                                                             //
//  RankedCardTests.swift                                                      //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/14/21.                                       //
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

/// Unit tests for a `RankedCard`.
class RankedCardTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `RankedCard` equals "One".
    func test_title_ofDefaultRankedCard_equalsOne() {
        
        // Given
        let rankedCard = RankedCard()
        let expected = "One"
        
        // When
        let actual = rankedCard.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                  ==                                     //
    //-------------------------------------------------------------------------//

    /// Tests that two `RankedCard`s with all of the same property values are equal.
    func test_card_equalsCardWithSamePropertyValues_true() {
     
        // Given
        let rankedCard1 = RankedCard()
        let rankedCard2 = RankedCard()
        
        // When/Then
        XCTAssert(rankedCard1.equals(rankedCard2))
    }
    
    /// Tests that two `RankedCard`s with all of the same property values are equal, using the equality
    /// operator.
    func test_card_equalsCardWithSamePropertyValuesWithOperator_true() {
     
        // Given
        let rankedCard1 = RankedCard()
        let rankedCard2 = RankedCard()
        
        // When/Then
        XCTAssertEqual(rankedCard1, rankedCard2)
    }
    
    //-------------------------------------------------------------------------//
    //                                  !=                                     //
    //-------------------------------------------------------------------------//

    //                 //
    // Different Ranks //
    //                //
    
    /// Tests that two `RankedCard`s with all of the same property values, except `Rank`,  are not equal.
    func test_card_equalsCardWithDifferentRank_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        
        // When/Then
        XCTAssertFalse(rankedCard1.equals(rankedCard2))
    }
    
    /// Tests that two `RankedCard`s with all of the same property values, except `Rank`, are not equal
    /// using the equality operator.
    func test_card_equalsCardWithDifferentRankWithOperator_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace)
        let rankedCard2 = RankedCard(with: .two)
        
        // When/Then
        XCTAssertNotEqual(rankedCard1, rankedCard2)
    }
    
    //                     //
    // Different Positions //
    //                     //
    
    /// Tests that two `RankedCard`s with all of the same property values, except position,  are not equal.
    func test_card_equalsCardWithDifferentPosition_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .ace, at: 2)
        
        // When/Then
        XCTAssertFalse(rankedCard1.equals(rankedCard2))
    }
    
    /// Tests that two `RankedCard`s with all of the same property values, except position, are not equal
    /// using the equality operator.
    func test_card_equalsCardWithDifferentPositionWithOperator_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .ace, at: 2)
        
        // When/Then
        XCTAssertNotEqual(rankedCard1, rankedCard2)
    }
    
    //                  //
    // Different Points //
    //                  //
    
    /// Tests that two `RankedCard`s with all of the same property values, except points,  are not equal.
    func test_card_equalsCardWithDifferentPoints_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1, worth: 1)
        let rankedCard2 = RankedCard(with: .ace, at: 1, worth: 2)
        
        // When/Then
        XCTAssertFalse(rankedCard1.equals(rankedCard2))
    }
    
    /// Tests that two `RankedCard`s with all of the same property values, except points, are not equal
    /// using the equality operator.
    func test_card_equalsCardWithDifferentPointsWithOperator_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1, worth: 1)
        let rankedCard2 = RankedCard(with: .ace, at: 1, worth: 2)
        
        // When/Then
        XCTAssertNotEqual(rankedCard1, rankedCard2)
    }
    
    //                 //
    // Different Title //
    //                 //
    
    /// Tests that two `RankedCard`s with all of the same property values, except title,  are not equal.
    func test_card_equalsCardWithDifferentTitle_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1, worth: 1, named: "Ace")
        let rankedCard2 = RankedCard(with: .ace, at: 1, worth: 1, named: "One")
        
        // When/Then
        XCTAssertFalse(rankedCard1.equals(rankedCard2))
    }
    
    /// Tests that two `RankedCard`s with all of the same property values, except title, are not equal
    /// using the equality operator.
    func test_card_equalsCardWithDifferentTitleWithOperator_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1, worth: 1, named: "Ace")
        let rankedCard2 = RankedCard(with: .ace, at: 1, worth: 1, named: "One")
        
        // When/Then
        XCTAssertNotEqual(rankedCard1, rankedCard2)
    }
}
