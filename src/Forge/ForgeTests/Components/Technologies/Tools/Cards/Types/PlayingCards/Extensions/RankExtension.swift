//=============================================================================//
//                                                                             //
//  RankExtensionTests.swift                                                   //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/15/21.                                       //
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

/// Unit tests for a `PlayingCard Rank`.
class RankExtensionTests: XCTestCase {
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                isNumeral                                //
    //-------------------------------------------------------------------------//
    
    //              //
    // NumeralCards //
    //              //
    
    /// Tests that an`ace Rank` is a numeral `PlayingCard Rank`.
    func test_ace_isNumeral_true() {
        
        // Given
        let rank = Rank.ace
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    /// Tests that a`two Rank` is a numeral `PlayingCard Rank`.
    func test_two_isNumeral_true() {
        
        // Given
        let rank = Rank.two
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    /// Tests that a`three Rank` is a numeral `PlayingCard Rank`.
    func test_three_isNumeral_true() {
        
        // Given
        let rank = Rank.three
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    /// Tests that a`four Rank` is a numeral `PlayingCard Rank`.
    func test_four_isNumeral_true() {
        
        // Given
        let rank = Rank.four
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    /// Tests that a`five Rank` is a numeral `PlayingCard Rank`.
    func test_five_isNumeral_true() {
        
        // Given
        let rank = Rank.five
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    /// Tests that a`six Rank` is a numeral `PlayingCard Rank`.
    func test_six_isNumeral_true() {
        
        // Given
        let rank = Rank.six
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    /// Tests that a`seven Rank` is a numeral `PlayingCard Rank`.
    func test_seven_isNumeral_true() {
        
        // Given
        let rank = Rank.seven
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    /// Tests that an`eight Rank` is a numeral `PlayingCard Rank`.
    func test_eight_isNumeral_true() {
        
        // Given
        let rank = Rank.eight
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    /// Tests that a`nine Rank` is a numeral `PlayingCard Rank`.
    func test_nine_isNumeral_true() {
        
        // Given
        let rank = Rank.nine
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    /// Tests that a`ten Rank` is a numeral `PlayingCard Rank`.
    func test_ten_isNumeral_true() {
        
        // Given
        let rank = Rank.ten
        
        // When/Then
        XCTAssert(rank.isNumeral())
    }
    
    //           //
    // FaceCards //
    //           //
    
    /// Tests that a `jack Rank` is not a numeral `PlayingCard Rank`.
    func test_jack_isNumeral_false() {
        
        // Given
        let rank = Rank.jack
        
        // When/Then
        XCTAssertFalse(rank.isNumeral())
    }
    
    /// Tests that a `queen Rank` is not a numeral `PlayingCard Rank`.
    func test_queen_isNumeral_false() {
        
        // Given
        let rank = Rank.queen
        
        // When/Then
        XCTAssertFalse(rank.isNumeral())
    }
    
    /// Tests that a `king Rank` is not a numeral `PlayingCard Rank`.
    func test_king_isNumeral_false() {
        
        // Given
        let rank = Rank.king
        
        // When/Then
        XCTAssertFalse(rank.isNumeral())
    }
    
    //           //
    // WildCards //
    //           //
    
    /// Tests that a `joker Rank` is not a numeral `PlayingCard Rank`.
    func test_joker_isNumeral_false() {
        
        // Given
        let rank = Rank.joker
        
        // When/Then
        XCTAssertFalse(rank.isNumeral())
    }
    
    //                 //
    // Non-PlayingCard //
    //                 //
    
    /// Tests that a non-`PlayingCard Rank` is not a numeral `PlayingCard Rank`.
    func test_nonPlayingCardRank_isNumeral_false() {
        
        // Given
        let rank = Rank.one
        
        // When/Then
        XCTAssertFalse(rank.isNumeral())
    }
    

    //              //
    // NumeralCards //
    //              //
    
    /// Tests that an`ace Rank` is not a royal `PlayingCard Rank`.
    func test_ace_isRoyal_false() {
        
        // Given
        let rank = Rank.ace
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    /// Tests that a`two Rank` is not a royal  `PlayingCard Rank`.
    func test_two_isRoyal_false() {
        
        // Given
        let rank = Rank.two
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    /// Tests that a`three Rank` is not a royal  `PlayingCard Rank`.
    func test_three_isRoyal_false() {
        
        // Given
        let rank = Rank.three
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    /// Tests that a`four Rank` is not a royal `PlayingCard Rank`.
    func test_four_isRoyal_false() {
        
        // Given
        let rank = Rank.four
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    /// Tests that a`five Rank` is not a royal  `PlayingCard Rank`.
    func test_five_isRoyal_false() {
        
        // Given
        let rank = Rank.five
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    /// Tests that a`six Rank` is not a royal  `PlayingCard Rank`.
    func test_six_isRoyal_false() {
        
        // Given
        let rank = Rank.six
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    /// Tests that a`seven Rank` is not a royal  `PlayingCard Rank`.
    func test_seven_isRoyal_false() {
        
        // Given
        let rank = Rank.seven
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    /// Tests that an`eight Rank` is not a royal  `PlayingCard Rank`.
    func test_eight_isRoyal_false() {
        
        // Given
        let rank = Rank.eight
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    /// Tests that a`nine Rank` is not a royal  `PlayingCard Rank`.
    func test_nine_isRoyal_false() {
        
        // Given
        let rank = Rank.nine
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    /// Tests that a`ten Rank` is not a royal  `PlayingCard Rank`.
    func test_ten_isRoyal_false() {
        
        // Given
        let rank = Rank.ten
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    //           //
    // FaceCards //
    //           //
    
    /// Tests that a `jack Rank` is a royal  `PlayingCard Rank`.
    func test_jack_isRoyal_true() {
        
        // Given
        let rank = Rank.jack
        
        // When/Then
        XCTAssert(rank.isRoyal())
    }
    
    /// Tests that a `queen Rank` is a royal  `PlayingCard Rank`.
    func test_queen_isRoyal_true() {
        
        // Given
        let rank = Rank.queen
        
        // When/Then
        XCTAssert(rank.isRoyal())
    }
    
    /// Tests that a `king Rank` is a royal  `PlayingCard Rank`.
    func test_king_isRoyal_true() {
        
        // Given
        let rank = Rank.king
        
        // When/Then
        XCTAssert(rank.isRoyal())
    }
    
    //           //
    // WildCards //
    //           //
    
    /// Tests that a`joker Rank` is not a royal  `PlayingCard Rank`.
    func test_joker_isRoyal_false() {
        
        // Given
        let rank = Rank.joker
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    //                 //
    // Non-PlayingCard //
    //                 //
    
    /// Tests that a non-`PlayingCard Rank` is not a royal  `PlayingCard Rank`.
    func test_nonPlayingCardRank_isRoyal_false() {
        
        // Given
        let rank = Rank.knight
        
        // When/Then
        XCTAssertFalse(rank.isRoyal())
    }
    
    //-------------------------------------------------------------------------//
    //                               isStandard                                //
    //-------------------------------------------------------------------------//
    
    //              //
    // NumeralCards //
    //              //
    
    /// Tests that an`ace Rank` is a standard `PlayingCard Rank`.
    func test_ace_isStandard_true() {
        
        // Given
        let rank = Rank.ace
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a`two Rank` is a standard `PlayingCard Rank`.
    func test_two_isStandard__true() {
        
        // Given
        let rank = Rank.two
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a`three Rank` is a standard `PlayingCard Rank`.
    func test_three_isStandard__true() {
        
        // Given
        let rank = Rank.three
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a`four Rank` is a standard `PlayingCard Rank`.
    func test_four_isStandard__true() {
        
        // Given
        let rank = Rank.four
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a`five Rank` is a standard `PlayingCard Rank`.
    func test_five_isStandard_true() {
        
        // Given
        let rank = Rank.five
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a`six Rank` is a standard `PlayingCard Rank`.
    func test_six_isStandard__true() {
        
        // Given
        let rank = Rank.six
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a`seven Rank` is a standard `PlayingCard Rank`.
    func test_seven_isStandard__true() {
        
        // Given
        let rank = Rank.seven
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that an`eight Rank` is a standard `PlayingCard Rank`.
    func test_eight_isStandard__true() {
        
        // Given
        let rank = Rank.eight
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a`nine Rank` is a standard `PlayingCard Rank`.
    func test_nine_isStandard__true() {
        
        // Given
        let rank = Rank.nine
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a`ten Rank` is a standard `PlayingCard Rank`.
    func test_ten_isStandard__true() {
        
        // Given
        let rank = Rank.ten
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    //           //
    // FaceCards //
    //           //
    
    /// Tests that a `jack Rank` is a standard `PlayingCard Rank`.
    func test_jack_isStandard__true() {
        
        // Given
        let rank = Rank.jack
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a `queen Rank` is a standard `PlayingCard Rank`.
    func test_queen_isStandard__true() {
        
        // Given
        let rank = Rank.queen
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    /// Tests that a `king Rank` is a standard `PlayingCard Rank`.
    func test_king_isStandard__true() {
        
        // Given
        let rank = Rank.king
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    //           //
    // WildCards //
    //           //
    
    /// Tests that a`joker Rank` is a standard `PlayingCard Rank`.
    func test_joker_isStandard__false() {
        
        // Given
        let rank = Rank.joker
        
        // When/Then
        XCTAssert(rank.isStandard())
    }
    
    //                 //
    // Non-PlayingCard //
    //                 //
    
    /// Tests that a non-`PlayingCard Rank` is not a standard `PlayingCard Rank`.
    func test_nonPlayingCardRank_isStandard_false() {
        
        // Given
        let rank = Rank.knight
        
        // When/Then
        XCTAssertFalse(rank.isStandard())
    }
}
