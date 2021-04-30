//=============================================================================//
//                                                                             //
//  PlayingCard.swift                                                          //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/02/21.                                       //
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

/// A standard French-suited playing `Card`.
public class PlayingCard: Card {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The hierarchical position.
    public let rank: Rank
    
    /// The symbol grouping.
    public let suit: Suit?
    
    /// The total # of points.
    public let points: Int
    
    /// The primary `Color`.
    public let color: Color
    
    /// The standard`Rank` hierarchy.
    private let hiearchy: [Rank:Int] = [
    
        .joker: 0,
        .ace: 1,
        .two: 2,
        .three: 3,
        .four: 4,
        .five: 5,
        .six: 6,
        .seven: 7,
        .eight: 8,
        .nine: 9,
        .ten: 10,
        .jack: 11,
        .queen: 12,
        .king: 13
    ]
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `PlayingCard` with the given `Rank`, `Suit`, & `Color`.
    ///
    /// - Precondition:
    ///   - `Rank` = `ace`..`ten`, `jack`, `queen`, `king`, or `joker`.
    ///   - `Suit` =`clubs`, `diamonds`, `hearts`, `spades`, or `null`.
    ///   - `Suit` = `null` if `Rank` equals `joker`.
    /// - Postcondition:
    ///   - The `Card`s `Rank`is set to the given `Rank`.
    ///   - The `Card`s `Suit` is set to the given `Suit`.
    ///   - The `Card`s points are set to the standard default points for the`Rank`.
    ///   - The `Card`s title is set to "`Rank` of `Suit`" if not a `joker`, else `Color` Joker.
    ///   - The `Card`s `Color` is set to
    ///      -  The given `Color` if the specified `Rank` is a `joker`, or
    ///      - `red` if the if the specified `Suit` is `hearts` or `diamonds`, or
    ///      - `black` if the the specified `Suit` is `clubs` or `spades`.
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - suit: The color-coded `Symbol`.
    ///   - color: The primary `Color`.
    /// - Throws:
    ///   - `FeatureError.invalidRank` if the given `Rank` is not an `ace`, `one`..`ten`,
    ///     `jack`, `queen`, `king`, or `joker`.
    ///   - `FeatureError.invalidSuit`  if the given `Suit` is not `clubs`, `diamonds`,
    ///     `hearts`, `spades`, or `null`.
    ///   - `PlayingCardError.invalidRankAndSuitCombination` if the given
    ///      - `Rank` is not a `joker` and the specified `Suit` is `null`, or
    ///      - `Rank` is a `joker`, and the specified `Suit` is not `null`.
    init(_ rank: Rank, of suit: Suit = .hearts, in color: Color = .red) throws {
        
        guard (rank.isValid()) else {
            
            print("The given Rank is not a valid PlayingCard Rank.")
            throw FeatureError.invalidRank
        }
        
        guard (suit.isValid()) else {
            
            print("\(suit) is not PlayingCard Suit.")
            throw FeatureError.invalidSuit
        }
        
        guard ((rank != .joker && suit != .null) ||
               (rank == .joker && suit == .null)) else {
            
            print("The given Rank and Suit is not a valid combination.")
            throw PlayingCardError.invalidRankAndSuitCombination 
        }
        
        self.rank = rank
        self.suit = suit
        self.points = rank.getPoints()
        self.color = rank == .joker ? color : suit.isRed() ? .red : .black
        super.init(named: rank.getTitle(for: suit, color))
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the `Card` is  less than the  given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to compare against.
    /// - Returns: True if the `Card` is  less than the  given `Card`.
    override func isLessThan(_ card: Card) -> Bool {

        return (card as? PlayingCard).map{ playingCard in
            
            return (playingCard is Ace && rank != .joker) ?
                (playingCard as! Ace).isHigh :
                hiearchy[rank]! < hiearchy[playingCard.rank]!
            
        } ?? false
    }
    
    /// Determines if the `Card` is  equal to the  given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to compare against.
    /// - Returns: True if the `Card` is equal to the  given `Card`.
    override func equals(_ card: Card) -> Bool {

        return (card as? PlayingCard).map{ playingCard in
            
            return rank == playingCard.rank
            
        } ?? false
    }
    
    /// Determines if the `Card` is  greater  than the  given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to compare against.
    /// - Returns: True if the `Card` is  greater than the  given `Card`.
    override func isGreaterThan(_ card: Card) -> Bool {

        return (card as? PlayingCard).map{ playingCard in
            
            return playingCard is Ace ? !(playingCard as! Ace).isHigh :
                hiearchy[rank]! > hiearchy[playingCard.rank]!
            
        } ?? false
    }
}
