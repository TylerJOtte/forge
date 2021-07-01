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
    
    /// Tests that the title of a new `RankedCard` created with a `Rank` equals the given `Rank`'s
    /// name, capitalized.
    func test_title_ofNewRankedCardWithRank_equalsRankCapitalized() {
        
        // Given
        let rank = Rank.ace
        let rankedCard = RankedCard(with: rank)
        let expected = "Ace"
        
        // When
        let actual = rankedCard.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a new `RankedCard` created with a `Rank` and position equals the given
    /// `Rank`'s name, capitalized.
    func test_title_ofNewRankedCardWithRankAndPosition_equalsRankCapitalized() {
        
        // Given
        let rank = Rank.ace
        let position = 1
        let rankedCard = RankedCard(with: rank, at: position)
        let expected = "Ace"
        
        // When
        let actual = rankedCard.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a new `RankedCard` created with a `Rank`, position, and points equals the
    /// given `Rank`'s name, capitalized.
    func test_title_ofNewRankedCardWithRankPositionAndPoints_equalsRankCapitalized() {
        
        // Given
        let rank = Rank.ace
        let position = 1
        let points = 1
        let rankedCard = RankedCard(with: rank, at: position, worth: points)
        let expected = "Ace"
        
        // When
        let actual = rankedCard.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a new `RankedCard` created with a `Rank` and title equals the given title.
    func test_title_ofNewRankedCardWithRankAndTitle_equalsGivenTitle() {
        
        // Given
        let rank = Rank.ace
        let position = 13
        let points = 1
        let title = "High Ace"
        let rankedCard = RankedCard(with: rank, at: position, worth: points,
                                    named: title)
        let expected = title
        
        // When
        let actual = rankedCard.title

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the `Rank` of a default `RankedCard` equals `one`.
    func test_rank_ofDefaultRankedCard_equalsOne() {
        
        // Given
        let rankedCard = RankedCard()
        let expected = Rank.one
        
        // When
        let actual = rankedCard.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Rank` of a new `RankedCard` created with a `Rank` equals the given `Rank`.
    func test_rank_ofNewRankedCardWithRank_equalsGivenRank() {
        
        // Given
        let rank = Rank.ace
        let rankedCard = RankedCard(with: rank)
        let expected = rank
        
        // When
        let actual = rankedCard.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the`Rank` of a new `RankedCard` created with a `Rank` and position equals the given
    /// `Rank`.
    func test_rank_ofNewRankedCardWithRankAndPosition_equalsGivenRank() {
        
        // Given
        let rank = Rank.ace
        let position = 1
        let rankedCard = RankedCard(with: rank, at: position)
        let expected = rank
        
        // When
        let actual = rankedCard.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the `Rank` of a new `RankedCard` created with a `Rank`, position, and points equals the
    /// given `Rank`.
    func test_rank_ofNewRankedCardWithRankPositionAndPoints_equalsGivenRank() {
        
        // Given
        let rank = Rank.ace
        let position = 1
        let points = 1
        let rankedCard = RankedCard(with: rank, at: position, worth: points)
        let expected = rank
        
        // When
        let actual = rankedCard.rank

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the`Rank` of a new `RankedCard` created with a `Rank` and title equals the given
    /// `Rank`.
    func test_rank_ofNewRankedCardWithRankAndTitle_equalsGivenRank() {
        
        // Given
        let rank = Rank.ace
        let position = 13
        let points = 1
        let title = "High Ace"
        let rankedCard = RankedCard(with: rank, at: position, worth: points,
                                    named: title)
        let expected = rank
        
        // When
        let actual = rankedCard.rank

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
