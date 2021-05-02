//=============================================================================//
//                                                                             //
//  RewardTests.swift                                                          //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/02/21.                                       //
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

/// Unit tests for a `Reward`.
class RewardTests: XCTestCase {
    
    //=========================================================================//
    //                              PROPERTIES                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Title                                    //
    //-------------------------------------------------------------------------//
    
    /// Tests that the title of a default `Reward` equals  "Reward".
    func test_title_ofReward_equalsReward() {
        
        // Given
        let reward = Reward()
        let expected = "Reward"
        
        // When
        let actual = reward.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the title of a`Reward` equals a given title.
    func test_title_ofReward_equalsGivenTitle() {
        
        // Given
        let title = "Title"
        let reward = Reward(named: title)
        let expected = title
        
        // When
        let actual = reward.title
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                              COMPARISONS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                               Less Than                                 //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Reward` with an alphabetically earlier title is less than another `Reward` with an
    /// alphabetically later title.
    func test_isLessThan_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Reward A"
        let title2 = "Reward Z"
        let reward1 = Reward(named: title1)
        let reward2 = Reward(named: title2)
        
        // When/Then
        XCTAssert(reward1.isLessThan(reward2))
    }
    
    /// Tests that a `Reward` with an alphabetically earlier title is less than another `Reward` with an
    /// alphabetically later title, using the less than operator.
    func test_isLessThanOperator_WithAlphabeticallyEarlierTitle_true() {
        
        // Given
        let title1 = "Reward A"
        let title2 = "Reward Z"
        let reward1 = Reward(named: title1)
        let reward2 = Reward(named: title2)
        
        // When/Then
        XCTAssertLessThan(reward1, reward2)
    }
    
    //-------------------------------------------------------------------------//
    //                                Equality                                 //
    //-------------------------------------------------------------------------//
    
                              //                   //
                              // Default Reward //
                              //                   //
    
    /// Tests that two default `Reward`s are equal.
    func test_equals_defaultRewards_true() {
        
        // Given
        let reward1 = Reward()
        let reward2 = Reward()
        
        // When/Then
        XCTAssert(reward1.equals(reward2))
    }
    
    /// Tests that two default `Reward`s are equal, using the equality operator.
    func test_equalityOperator_defaultRewards_true() {
        
        // Given
        let reward1 = Reward()
        let reward2 = Reward()
        
        // When/Then
        XCTAssertEqual(reward1, reward2)
    }
    
                                  //             //
                                  // Same Titles //
                                  //             //
    
    /// Tests that two `Reward`s with the same given title are equal.
    func test_equals_rewardWithSameTitles_true() {
        
        // Given
        let title1 = "Reward A"
        let title2 = "Reward A"
        let reward1 = Reward(named: title1)
        let reward2 = Reward(named: title2)
        
        // When/Then
        XCTAssertEqual(reward1, reward2)
    }

    /// Tests that two `Reward`s with the same given title are equal, using the equality operator.
    func test_equalityOperator_rewardWithSameTitles_true() {
        
        // Given
        let title1 = "Reward A"
        let title2 = "Reward A"
        let reward1 = Reward(named: title1)
        let reward2 = Reward(named: title2)
        
        // When/Then
        XCTAssertEqual(reward1, reward2)
    }
    
                               //                  //
                               // Different Titles //
                               //                  //
    
    /// Tests that two `Reward`s with different titles are not equal.
    func test_equals_rewardWithDifferentTitles_false() {
        
        // Given
        let title1 = "Reward A"
        let title2 = "Reward Z"
        let reward1 = Reward(named: title1)
        let reward2 = Reward(named: title2)
        
        // When/Then
        XCTAssertFalse(reward1.equals(reward2))
    }
    
    /// Tests that two `Reward`s with different titles are not equal, using the equality operator.
    func test_equalitOperator_rewardWithDifferentTitles_false() {
        
        // Given
        let title1 = "Reward A"
        let title2 = "Reward Z"
        let reward1 = Reward(named: title1)
        let reward2 = Reward(named: title2)
        
        // When/Then
        XCTAssertNotEqual(reward1, reward2)
    }
    
    //-------------------------------------------------------------------------//
    //                             Greater Than                                //
    //-------------------------------------------------------------------------//
    
    /// Tests that a `Reward` with an alphabetically later title is greater than another `Reward` with an
    /// alphabetically earlier title.
    func test_isGreaterThan_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Reward Z"
        let title2 = "Reward A"
        let reward1 = Reward(named: title1)
        let reward2 = Reward(named: title2)
        
        // When/Then
        XCTAssert(reward1.isGreaterThan(reward2))
    }
    
    /// Tests that a `Reward` with an alphabetically later title is greater than another `Reward` with an
    /// alphabetically earlier title, using the greater than operator.
    func test_isGreaterThanOperator_WithAlphabeticallyLaterTitle_true() {
        
        // Given
        let title1 = "Reward Z"
        let title2 = "Reward A"
        let reward1 = Reward(named: title1)
        let reward2 = Reward(named: title2)
        
        // When/Then
        XCTAssertGreaterThan(reward1, reward2)
    }
}
