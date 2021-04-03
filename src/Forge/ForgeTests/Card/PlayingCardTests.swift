//=============================================================================//
//                                                                             //
//  PlayingCardTests.swift                                                     //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/03/21.                                       //
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

/// Unit tests for the `PlayingCard` class.
class PlayingCardTests: XCTestCase {
    
    //=========================================================================//
    //                             Initialization                              //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                Success                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that creating a`PlayingCard` with an `ace Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_witAceRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `one Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withOneRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.one
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `two Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withTwoRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.two
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `three Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withThreeRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `four Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withFourRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.four
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `five Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withFiveRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.five
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `six Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withSixRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.six
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `seven Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withSevenRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.seven
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with an `eight Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withEightRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.eight
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `nine Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withNineRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.nine
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `ten Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withTenRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.ten
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `jack Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withJackRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.jack
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `queen Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withQueenRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.queen
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `king Rank` & a standard `PlayingCard Suit`
    /// succeeds.
    func test_init_withKingRankAndValidSuit_true() {
        
        // Given
        let rank = Rank.king
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `joker Rank` & nil `Suit`succeeds.
    func test_init_withJokerAndNilSuit_true() {
        
        // Given
        let rank = Rank.joker
        
        // When
        let actual = PlayingCard(rank, of: nil)
        
        // Then
        XCTAssert(actual != nil)
    }
    
    //-------------------------------------------------------------------------//
    //                                Failure                                  //
    //-------------------------------------------------------------------------//
    
                                //             //
                                //  Valid Suit //
                                //             //
                                
    /// Tests that creating a`PlayingCard` with a `joker Rank` & `PlayingCard Suit`fails.
    func test_init_withJokerAndInvalidSuit_false() {
        
        // Given
        let rank = Rank.joker
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
                                //           //
                                //  Nil Suit //
                                //           //

    /// Tests that creating a`PlayingCard` with an `ace Rank` & a nil `Suit` fails.
    func test_init_witAceRankAndNilSuit_false() {

        // Given
        let rank = Rank.ace
        
        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `one Rank` & a nil `Suit` fails.
    func test_init_withOneRankAnddNilSuit_false() {

        // Given
        let rank = Rank.one
        
        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `two Rank` & a nil `Suit` fails.
    func test_init_withTwoRankAndNilSuit_false() {

        // Given
        let rank = Rank.two

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `three Rank` & a nil `Suit` fails.
    func test_init_withThreeRankAndNilSuit_false() {

        // Given
        let rank = Rank.three

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `four Rank` & a nil `Suit` fails.
    func test_init_withFourRankAndNilSuit_false() {

        // Given
        let rank = Rank.four

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `five Rank` & a nil `Suit` fails.
    func test_init_withFiveRankAndNilSuit_false() {

        // Given
        let rank = Rank.five

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `six Rank` & a nil `Suit` fails.
    func test_init_withSixRankAndNilSuit_false(){

        // Given
        let rank = Rank.six
        
        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `seven Rank` & a nil `Suit` fails.
    func test_init_withSevenRankAndNilSuit_false() {

        // Given
        let rank = Rank.seven

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with an `eight Rank` & a nil `Suit` fails.
    func test_init_withEightRankAndNilSuit_false() {

        // Given
        let rank = Rank.eight

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `nine Rank` & a nil `Suit` fails.
    func test_init_withNineRankAndNilSuit_false() {

        // Given
        let rank = Rank.nine

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `ten Rank` & a nil `Suit` fails.
    func test_init_withTenRankAndNilSuit_false() {

        // Given
        let rank = Rank.ten

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `jack Rank` & a nil `Suit` fails.
    func test_init_withJackRankAndNilSuit_false() {

        // Given
        let rank = Rank.jack

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `queen Rank` & a nil `Suit` fails.
    func test_init_withQueenRankAndNilSuit_false() {

        // Given
        let rank = Rank.queen

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }

    /// Tests that creating a`PlayingCard` with a `king Rank` & a nil `Suit` fails.
    func test_init_withKingRankAndNilSuit_false(){

        // Given
        let rank = Rank.king

        // When
        let actual = PlayingCard(rank, of: nil)

        // Then
        XCTAssert(actual == nil)
    }
    
                                //              //
                                // Invalid Suit //
                                //              //
    
    /// Tests that creating a`PlayingCard` with an `ace Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_witAceRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `one Rank` & a non-standard
    ///  `PlayingCard Suit` fails.
    func test_init_withOneRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.one
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `two Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withTwoRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.two
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `three Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withThreeRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.three
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `four Rank` & a non-standard
    ///  `PlayingCard Suit` fails.
    func test_init_withFourRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.four
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `five Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withFiveRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.five
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `six Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withSixRankAndInValidSuit_false(){
        
        // Given
        let rank = Rank.six
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `seven Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withSevenRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.seven
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with an `eight Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withEightRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.eight
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `nine Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withNineRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.nine
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `ten Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withTenRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.ten
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `jack Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withJackRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.jack
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `queen Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withQueenRankAndInValidSuit_false() {
        
        // Given
        let rank = Rank.queen
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `king Rank` & a non-standard
    /// `PlayingCard Suit` fails.
    func test_init_withKingRankAndInValidSuit_false(){
        
        // Given
        let rank = Rank.king
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    /// Tests that creating a`PlayingCard` with a `joker Rank` & a non-standard
    /// `PlayingCard Suit`fails.
    func test_init_withJokerAndInValidSuit_false(){
        
        // Given
        let rank = Rank.joker
        let color = Color.black
        let symbol = Symbol.star
        let suit = Suit(color, symbol)
        
        // When
        let actual = PlayingCard(rank, of: suit)
        
        // Then
        XCTAssert(actual == nil)
    }
    
    //=========================================================================//
    //                               ATTRIBUTES                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Points                                  //
    //-------------------------------------------------------------------------//
    
    /// Tests that the default points of a`PlayingCard` with an `ace Rank` equal one.
    func test_defaultPoints_ofAce_equalOne() {
        
        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 1
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `one Rank` equal one.
    func test_defaultPoints_ofOne_equalOne() {
        
        // Given
        let rank = Rank.one
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 1
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `two Rank` equal two.
    func test_defaultPoints_ofTwo_equalTwo(){
        
        // Given
        let rank = Rank.two
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 2
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `three Rank` equal three..
    func test_defaultPoints_ofThree_equalThree() {
        
        // Given
        let rank = Rank.three
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 3
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `four Rank` equal four.
    func test_defaultPoints_ofFour_equalFour() {
        
        // Given
        let rank = Rank.four
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 4
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `five Rank` equal five.
    func test_defaultPoints_ofFive_equalFive() {
        
        // Given
        let rank = Rank.five
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 5
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `six Rank` equal six.
    func test_defaultPoints_ofSix_equalSix() {
        
        // Given
        let rank = Rank.six
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 6
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `seven Rank` equal seven.
    func test_defaultPoints_ofSeven_equalSeven() {
        
        // Given
        let rank = Rank.seven
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 7
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with an `eight Rank` equal eight.
    func test_defaultPoints_ofEight_equalEight() {
        
        // Given
        let rank = Rank.eight
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 8
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `nine Rank` equal nine.
    func test_defaultPoints_ofNine_equalNine() {
        
        // Given
        let rank = Rank.nine
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 9
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `ten Rank` equal ten.
    func test_defaultPoints_ofTen_equalTen() {
        
        // Given
        let rank = Rank.ten
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 10
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `jack Rank` equal ten.
    func test_defaultPoints_ofJack_equalTen() {
        
        // Given
        let rank = Rank.jack
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 10
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `queen Rank` equal ten.
    func test_defaultPoints_ofQueen_equalTen() {
        
        // Given
        let rank = Rank.queen
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 10
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `king Rank` equal ten.
    func test_defaultPoints_ofKing_equalTen() {
        
        // Given
        let rank = Rank.king
        let color = Color.black
        let symbol = Symbol.clover
        let suit = Suit(color, symbol)
        let card = PlayingCard(rank, of: suit)!
        let expected = 10
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that the default points of a`PlayingCard` with a `joker Rank` equal zero.
    func test_defaultPoints_ofJoker_equalZero() {
        
        // Given
        let rank = Rank.joker
        let card = PlayingCard(rank, of: nil)!
        let expected = 0
        
        // When
        let actual = card.points
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Are Equal                               //
    //-------------------------------------------------------------------------//
    
    /// Tests that two standard`PlayingCard`s with the same `Rank` & `Suit` are equal.
    func test_areEqual_sameRankAndSuit_true() {
        
        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol = Symbol.clover
        let suit1 = Suit(color, symbol)
        let suit2 = Suit(color, symbol)
        let card1 = PlayingCard(rank, of: suit1)
        let card2 = PlayingCard(rank, of: suit2)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a`PlayingCard` with an `ace` `Rank` is equal to a `PlayingCard` with a `one`
    /// `Rank` of the same  `Suit`.
    func test_areEqual_aceAndOneOfSameSuit_true() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.one
        let color = Color.black
        let symbol = Symbol.clover
        let suit1 = Suit(color, symbol)
        let suit2 = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit1)
        let card2 = PlayingCard(rank2, of: suit2)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    /// Tests that a`PlayingCard` with a `one` `Rank` is equal to a `PlayingCard` with a `ace`
    /// `Rank` of the same  `Suit`.
    func test_areEqual_oneAndAceOfSameSuit_true() {
        
        // Given
        let rank1 = Rank.one
        let rank2 = Rank.ace
        let color = Color.black
        let symbol = Symbol.clover
        let suit1 = Suit(color, symbol)
        let suit2 = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit1)
        let card2 = PlayingCard(rank2, of: suit2)
        
        // When/Then
        XCTAssertEqual(card1, card2)
    }
    
    //-------------------------------------------------------------------------//
    //                               Are Not Equal                             //
    //-------------------------------------------------------------------------//
    
    /// Tests that two standard`PlayingCard`s with the same `Rank` &  different `Suit`s are not equal.
    func test_areNotEqual_sameRankAndDifferntSuit_true() {
        
        // Given
        let rank = Rank.ace
        let color = Color.black
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let suit1 = Suit(color, symbol1)
        let suit2 = Suit(color, symbol2)
        let card1 = PlayingCard(rank, of: suit1)
        let card2 = PlayingCard(rank, of: suit2)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    /// Tests that two standard`PlayingCard`s with different `Rank`s & the same`Suit` are not equal.
    func test_areNotEqual_differentRankAndSameSuit_true() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.king
        let color = Color.black
        let symbol = Symbol.clover
        let suit1 = Suit(color, symbol)
        let suit2 = Suit(color, symbol)
        let card1 = PlayingCard(rank1, of: suit1)
        let card2 = PlayingCard(rank2, of: suit2)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
    
    /// Tests that two standard`PlayingCard`s with different `Rank`s`Suit`s are not equal.
    func test_areNotEqual_differentRankAndSuit_true() {
        
        // Given
        let rank1 = Rank.ace
        let rank2 = Rank.king
        let color = Color.black
        let symbol1 = Symbol.clover
        let symbol2 = Symbol.spade
        let suit1 = Suit(color, symbol1)
        let suit2 = Suit(color, symbol2)
        let card1 = PlayingCard(rank1, of: suit1)
        let card2 = PlayingCard(rank2, of: suit2)
        
        // When/Then
        XCTAssertNotEqual(card1, card2)
    }
}
