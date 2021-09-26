//=============================================================================//
//                                                                             //
//  PlayingCards.swift                                                         //
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

import Foundation
import SwiftUI

/// A helper for common `PlayingCard` operations.
class PlayingCards {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    static let ranks: [Rank] = [.ace, .two, .three, .four, .five, .six, .seven,
                                .eight, .nine, .ten, .jack, .queen, .king]
                       
    static let suits: [Suit] = [.clubs, .diamonds, .hearts, .spades]
    
    static let allSuits: [Suit] = [.clubs, .diamonds, .hearts, .spades, .null]
    
    //=========================================================================//
    //                                  GETTERS                                //
    //=========================================================================//

    //-------------------------------------------------------------------------//
    //                                NumeralCards                             //
    //-------------------------------------------------------------------------//
    
    /// Retrieves all the `NumeralCard`s with the given `Suit`.
    ///
    /// - Precondition:The given `Suit` must be a standard `PlayingCard Suit`.
    /// - Postcondition: None.
    /// - Parameter suit: The symbol grouping to get `Card`s for.
    /// - Returns: An array of `NumeralCard`s.
    static func getNumeralCards(with suit: Suit) -> [NumeralCard] {
        
        assert(suit.isStandardSymbol())
        
        return [
            try! Ace(of: suit),
            try! Two(of: suit),
            try! Three(of: suit),
            try! Four(of: suit),
            try! Five(of: suit),
            try! Six(of: suit),
            try! Seven(of: suit),
            try! Eight(of: suit),
            try! Nine(of: suit),
            try! Ten(of: suit)
        ]
    }
    
//    /// Retrieves all the `NumeralCard`s with the given `Suit`.
//    ///
//    /// - Precondition:The given `Suit` must be a standard `PlayingCard Suit`.
//    /// - Postcondition: None.
//    /// - Parameter suit: The symbol grouping to get `Card`s for.
//    /// - Throws: `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
//    /// - Returns: An array of `NumeralCard`s.
//    static func getNumeralCards(with suit: Suit) throws -> [NumeralCard] {
//
//        return [
//            try Ace(of: suit),
//            try Two(of: suit),
//            try Three(of: suit),
//            try Four(of: suit),
//            try Five(of: suit),
//            try Six(of: suit),
//            try Seven(of: suit),
//            try Eight(of: suit),
//            try Nine(of: suit),
//            try Ten(of: suit)
//        ]
//    }
    
    /// Retrieves all the `NumeralCard`s for each of the given `Suit`s.
    ///
    /// - Precondition:The given `Suit`s must be standard `PlayingCard Suit`s.
    /// - Postcondition: None.
    /// - Parameter suit: The symbol groupings to get `Card`s for.
    /// - Returns: An array of `NumeralCard`s.
    static func getNumeralCards(with suits: [Suit] = suits) -> [NumeralCard] {
        
        var cards: [NumeralCard] = []
        
        for suit in suits {
            
            let suitCards = getNumeralCards(with: suit);
            
            cards.append(contentsOf: suitCards)
        }
        
        return cards
    }
    
//    /// Retrieves all the `NumeralCard`s for each of the given `Suit`s.
//    ///
//    /// - Precondition:The given `Suit`s must be standard `PlayingCard Suit`s.
//    /// - Postcondition: None.
//    /// - Parameter suit: The symbol groupings to get `Card`s for.
//    /// - Throws: `invalidSuit`  if the given `Suit`s are not all standard `PlayingCard Suit`s.
//    /// - Returns: An array of `NumeralCard`s.
//    static func getNumeralCards(with suits: [Suit] = suits) throws ->
//        [NumeralCard] {
//
//        var cards: [NumeralCard] = []
//
//        for suit in suits {
//
//            let suitCards = try getNumeralCards(with: suit);
//
//            cards.append(contentsOf: suitCards)
//        }
//
//        return cards
//    }
    
    //-------------------------------------------------------------------------//
    //                                  FaceCards                              //
    //-------------------------------------------------------------------------//
    
    /// Retrieves all the `FaceCard`s with the given `Suit`.
    ///
    /// - Precondition:The given `Suit` must be a standard `PlayingCard Suit`.
    /// - Postcondition: None.
    /// - Parameter suit: The symbol grouping to get `Card`s for.
    /// - Returns: An array of `FaceCard`s.
    static func getFaceCards(with suit: Suit) -> [FaceCard] {
        
        assert(suit.isStandardSymbol())
        
        return [try! Jack(of: suit), try! Queen(of: suit), try! King(of: suit)]
    }
    
    /// Retrieves all the `FaceCard`s for each of the given `Suit`s.
    ///
    /// - Precondition:The given `Suit`s must be standard `PlayingCard Suit`s.
    /// - Postcondition: None.
    /// - Parameter suit: The symbol groupings to get `Card`s for.
    /// - Returns: An array of `FaceCard`s.
    static func getFaceCards(with suits: [Suit] = suits) -> [FaceCard] {
        
        var cards: [FaceCard] = []
        
        for suit in suits {
            
            let suitCards = getFaceCards(with: suit);
            
            cards.append(contentsOf: suitCards)
        }
        
        return cards
    }
    
//    /// Retrieves all the `FaceCard`s with the given `Suit`.
//    ///
//    /// - Precondition:The given `Suit` must be a standard `PlayingCard Suit`.
//    /// - Postcondition: None.
//    /// - Parameter suit: The symbol grouping to get `Card`s for.
//    /// - Throws: `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
//    /// - Returns: An array of `FaceCard`s.
//    static func getFaceCards(with suit: Suit) throws -> [FaceCard] {
//
//        return [try Jack(of: suit), try Queen(of: suit), try King(of: suit)]
//    }
//
//    /// Retrieves all the `FaceCard`s for each of the given `Suit`s.
//    ///
//    /// - Precondition:The given `Suit`s must be standard `PlayingCard Suit`s.
//    /// - Postcondition: None.
//    /// - Parameter suit: The symbol groupings to get `Card`s for.
//    /// - Throws: `invalidSuit`  if the given `Suit`s are not all standard `PlayingCard Suit`s.
//    /// - Returns: An array of `FaceCard`s.
//    static func getFaceCards(with suits: [Suit] = suits) throws -> [FaceCard] {
//
//        var cards: [FaceCard] = []
//
//        for suit in suits {
//
//            let suitCards = try getFaceCards(with: suit);
//
//            cards.append(contentsOf: suitCards)
//        }
//
//        return cards
//    }
    
    //-------------------------------------------------------------------------//
    //                                StandardCards                            //
    //-------------------------------------------------------------------------//
    
    /// Retrieves all the standard `PlayingCard`s with the given `Suit`.
    ///
    /// - Precondition:The given `Suit` must be a standard `PlayingCard Suit`.
    /// - Postcondition: None.
    /// - Parameter suit: The symbol grouping to get `Card`s for.
    /// - Throws: `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
    /// - Returns: An array of `PlayingCard`s.
    static func getStandardCards(with suit: Suit) -> [PlayingCard] {
        
        let numeralCards = getNumeralCards(with: suit)
        let faceCards = getFaceCards(with: suit)
        var standardCards: [PlayingCard] = []
        
        standardCards.append(contentsOf: numeralCards)
        standardCards.append(contentsOf: faceCards)
        
        return standardCards
    }
    
    /// Retrieves all the standard `PlayingCard`s for each of the given `Suit`s.
    ///
    /// - Precondition:The given `Suit`s must be standard `PlayingCard Suit`s.
    /// - Postcondition: None.
    /// - Parameter suit: The symbol groupings to get `Card`s for.
    /// - Throws: `invalidSuit`  if the given `Suit`s are not all standard `PlayingCard Suit`s.
    /// - Returns: An array of standard `PlayingCard`s.
    static func getStandardCards(with suits: [Suit] = suits) ->
        [PlayingCard] {

        var cards: [PlayingCard] = []

        for suit in suits {

            let suitCards = getStandardCards(with: suit);

            cards.append(contentsOf: suitCards)
        }

        return cards
    }
    
    //-------------------------------------------------------------------------//
    //                                    Jokers                               //
    //-------------------------------------------------------------------------//
    
    /// Retrieves all the `Joker`s.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An array of `Joker`s.
    static func getJokers() -> [Joker] {
        
        return [Joker(color: .red), Joker(color: .black)]
    }
    
    //-------------------------------------------------------------------------//
    //                                   All Cards                             //
    //-------------------------------------------------------------------------//
    
    /// Retrieves all the `PlayingCard`s with the given `Suit`, including `Joker`s.
    ///
    /// - Precondition:The given `Suit` must be a standard `PlayingCard Suit`.
    /// - Postcondition: None.
    /// - Parameter suit: The symbol grouping to get `Card`s for.
    /// - Throws: `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
    /// - Returns: An array of `PlayingCard`s.
    static func getAllCards(with suit: Suit) -> [PlayingCard] {
        
        let numeralCards = getNumeralCards(with: suit)
        let faceCards = getFaceCards(with: suit)
        let jokers = getJokers()
        var cards: [PlayingCard] = []
        
        cards.append(contentsOf: numeralCards)
        cards.append(contentsOf: faceCards)
        cards.append(contentsOf: jokers)
        
        return cards
    }
    
    /// Retrieves all the `PlayingCard`s for each of the given `Suit`s, including `Joker`s.
    ///
    /// - Precondition:The given `Suit`s must be standard `PlayingCard Suit`s.
    /// - Postcondition: None.
    /// - Parameter suit: The symbol groupings to get `Card`s for.
    /// - Throws: `invalidSuit`  if the given `Suit`s are not all standard `PlayingCard Suit`s.
    /// - Returns: An array of standard `PlayingCard`s.
    static func getAllCards(with suits: [Suit] = suits) -> [PlayingCard] {

        var cards: [PlayingCard] = []
        let jokers = getJokers()

        for suit in suits {

            let suitCards = getStandardCards(with: suit);

            cards.append(contentsOf: suitCards)
        }

        cards.append(contentsOf: jokers)

        return cards
    }
    
    // TODO: Add unit tests for below method
    
    /// Retrieves a `PlayingCard` for each standard `PlayingCard Rank` & `Suit` along with
    /// `Jokers`s, if specified.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter jokers: True if include `Joker`s, else false.
    /// - Returns: An array of standard `PlayingCard`s along with `Joker`s, if specified
    static func getCards(with jokers: Bool = false) -> [PlayingCard] {

       return jokers ? getAllCards() : getStandardCards()
    }
}
