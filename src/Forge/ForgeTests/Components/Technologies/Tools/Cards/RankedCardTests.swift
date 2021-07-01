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
    //                                 Rank                                    //
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
    
    //-------------------------------------------------------------------------//
    //                               Position                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that the position of a default `RankedCard` equals one..
    func test_position_ofDefaultRankedCard_equalsOne() {
        
        // Given
        let rankedCard = RankedCard()
        let expected = 1
        
        // When
        let actual = rankedCard.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the position of a new `RankedCard` created with only a `Rank` equals zero.
    func test_position_ofNewRankedCardWithRank_equalsZero() {
        
        // Given
        let rank = Rank.ace
        let rankedCard = RankedCard(with: rank)
        let expected = 0
        
        // When
        let actual = rankedCard.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the position of a new `RankedCard` created with a `Rank` and position equals the given
    /// position.
    func test_position_ofNewRankedCardWithRankAndPosition_equalsGivenPosition() {
        
        // Given
        let rank = Rank.ace
        let position = 1
        let rankedCard = RankedCard(with: rank, at: position)
        let expected = position
        
        // When
        let actual = rankedCard.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the position of a new `RankedCard` created with a `Rank`, position, and points equals
    /// the given position.
    func test_position_ofNewRankedCardWithRankPositionAndPoints_equalsGivenPosition() {
        
        // Given
        let rank = Rank.ace
        let position = 1
        let points = 1
        let rankedCard = RankedCard(with: rank, at: position, worth: points)
        let expected = position
        
        // When
        let actual = rankedCard.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the position of a new `RankedCard` created with a `Rank` and title equals the given
    /// position.
    func test_position_ofNewRankedCardWithRankAndTitle_equalsGivenPosition() {
        
        // Given
        let rank = Rank.ace
        let position = 13
        let points = 1
        let title = "High Ace"
        let rankedCard = RankedCard(with: rank, at: position, worth: points,
                                    named: title)
        let expected = position
        
        // When
        let actual = rankedCard.position

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //-------------------------------------------------------------------------//
    //                                Points                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that the points of a default `RankedCard` equals one.
    func test_points_ofDefaultRankedCard_equalsOne() {
        
        // Given
        let rankedCard = RankedCard()
        let expected = 1
        
        // When
        let actual = rankedCard.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the points of a new `RankedCard` created with only a `Rank` equals zero.
    func test_points_ofNewRankedCardWithRank_equalsZero() {
        
        // Given
        let rank = Rank.ace
        let rankedCard = RankedCard(with: rank)
        let expected = 0
        
        // When
        let actual = rankedCard.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the points of a new `RankedCard` created with a `Rank` and position equals zero.
    func test_points_ofNewRankedCardWithRankAndPosition_equalsZero() {
        
        // Given
        let rank = Rank.ace
        let position = 1
        let rankedCard = RankedCard(with: rank, at: position)
        let expected = 0
        
        // When
        let actual = rankedCard.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the points of a new `RankedCard` created with a `Rank`, position, and points equals
    /// the given points.
    func test_position_ofNewRankedCardWithRankPositionAndPoints_equalsGivenPoints() {
        
        // Given
        let rank = Rank.ace
        let position = 1
        let points = 1
        let rankedCard = RankedCard(with: rank, at: position, worth: points)
        let expected = points
        
        // When
        let actual = rankedCard.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the points of a new `RankedCard` created with a `Rank` and title equals the given
    /// points.
    func test_position_ofNewRankedCardWithRankAndTitle_equalsGivenPoints() {
        
        // Given
        let rank = Rank.ace
        let position = 13
        let points = 1
        let title = "High Ace"
        let rankedCard = RankedCard(with: rank, at: position, worth: points,
                                    named: title)
        let expected = points
        
        // When
        let actual = rankedCard.points

        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `RankedCard` with a lesser position  is less than another `RakedCard` with a greater
    /// position.
    func test_isLessThan_RankedCardWithLesserPosition_true() {
     
        // Given
        let lowAce = RankedCard(with: .ace, at: 1)
        let highAce = RankedCard(with: .ace, at: 13)
        
        // When/Then
        XCTAssert(lowAce.isLessThan(highAce))
    }
    
    /// Tests that a `RankedCard` with a lesser position  is less than another `RakedCard` with a greater
    /// position, using the less than operator.
    func test_isLessThan_RankedCardWithLesserPositionUsingOperator_true() {
     
        // Given
        let lowAce = RankedCard(with: .ace, at: 1)
        let highAce = RankedCard(with: .ace, at: 13)
        
        // When/Then
        XCTAssertLessThan(lowAce, highAce)
    }
    
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
    
    //=========================================================================//
    //                               TESTERS                                   //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               ranks()                                   //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `RankedCard` `Rank`s another `RankedCard` with the same `Rank` and position.
    func test_ranks_RankedCardWithSameRankAndPosition_true() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .ace, at: 1)
        
        // When/Then
        XCTAssert(rankedCard1.ranks(rankedCard2))
    }
    
    /// Tests that a `RankedCard` does not `Rank`s another `RankedCard` with the same `Rank`
    /// and different position.
    func test_ranks_RankedCardWithSameRankAndDifferentPosition_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .ace, at: 1)
        let rankedCard2 = RankedCard(with: .ace, at: 13)
        
        // When/Then
        XCTAssertFalse(rankedCard1.ranks(rankedCard2))
    }
    
    /// Tests that a `RankedCard` does not `Rank`s another `RankedCard` with a different `Rank`
    /// and same position.
    func test_ranks_RankedCardWithDifferentRankAndSamePosition_false() {
     
        // Given
        let rankedCard1 = RankedCard(with: .one, at: 1)
        let rankedCard2 = RankedCard(with: .ace, at: 1)
        
        // When/Then
        XCTAssertFalse(rankedCard1.ranks(rankedCard2))
    }
}
