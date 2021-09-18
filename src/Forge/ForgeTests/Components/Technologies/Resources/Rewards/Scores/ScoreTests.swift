////=============================================================================//
////                                                                             //
////  ScoreTests.swift                                                           //
////  Forge                                                                      //
////                                                                             //
////  Created by Tyler J. Otte on 6/11/21.                                       //
////-----------------------------------------------------------------------------//
////                                                                             //
//// This source file is part of the Forge framework project.                    //
////                                                                             //
//// Copyright (c) 2021, Tyler J. Otte.                                          //
//// Licensed under the GNU Affero General Public License v3.0.                  //
////                                                                             //
//// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
////=============================================================================//
//
//import XCTest
//@testable import Forge
//
///// Unit tests for a `Score`.
//class ScoreTests: XCTestCase {
//    
//    //=========================================================================//
//    //                              PROPERTIES                                 //
//    //=========================================================================//
//
//    //-------------------------------------------------------------------------//
//    //                                Points                                   //
//    //-------------------------------------------------------------------------//
//
//    /// Tests that the points for a default `Score` equal zero.
//    func test_points_ofDefaultScore_equalZero() {
//
//        // Given
//        let score = Score()
//        let expected = 0
//
//        // When
//        let actual = score.points
//
//        // Then
//        XCTAssertEqual(expected, actual)
//    }
//
//    //=========================================================================//
//    //                               TESTERS                                   //
//    //=========================================================================//
//
//    //-------------------------------------------------------------------------//
//    //                                  <                                      //
//    //-------------------------------------------------------------------------//
//
//    /// Tests that a `Score` with lower points than another `Score` is less than the latter.
////    func test_isLessThan_scoreWithLessPoints_true() {
////
////        // Given
////        let score1 = Score(of: 1)
////        let score2 = Score(of: 2)
////        let score = Score(
////
////        // When/Then
////        XCTAssert(score1.isLessThan(score2))
////    }
////
////    /// Tests that a `Score` with lower points than another `Score` is less than the latter, using the less
////    /// than  operator.
////    func test_isLessThan_scoreWithLessPointsAndOperator_true() {
////
////        // Given
////        let score1 = Score(of: 1)
////        let score2 = Score(of: 2)
////
////        // When/Then
////        XCTAssertLessThan(score1, score2)
////    }
//
//    //-------------------------------------------------------------------------//
//    //                                  =                                      //
//    //-------------------------------------------------------------------------//
//
//    /// Tests that two `Card`s with the same title are equal.
//    func test_card_equalsCardWithSameTitle_true() {
//
//        // Given
//        let card1 = Card(named: "Card")
//        let card2 = Card(named: "Card")
//
//        // When/Then
//        XCTAssert(card1.equals(card2))
//    }
//
//    /// Tests that two `Card`s with the same title are equal, using the equality operator
//    func test_card_equalsCardWithSameTitleWithOperator_true() {
//
//        // Given
//        let card1 = Card(named: "Card")
//        let card2 = Card(named: "Card")
//
//        // When/Then
//        XCTAssertEqual(card1, card2)
//    }
//}
