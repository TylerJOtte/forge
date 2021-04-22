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
public class PlayingCard: Card {//, Hashable {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The hierarchical position.
    public let rank: Rank
    
    /// The symbol groupoing.
    public let suit: Suit?
    
    /// The total # of points.
    public let points: Int
    
    /// The primary `Color`.
    public let color: Color
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a default `PlayingCard`.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Card`s `Rank`is set to `ace`.
    ///   - The `Card`s `Suit` is set to `hearts`.
    ///   - The `Card`s points are set to one.
    ///   - The `Card`s title is set to "Ace of Hearts".
    ///   - The `Card`s `Color` is set to `red`.
    init() {
        
        self.rank = .ace
        self.suit = .hearts
        self.points = 1
        self.color = Color.red
        
        super.init("Ace Of Hearts")
    }
    
    /// Creates a `PlayingCard` with the given `Rank`, `Suit`, & `Color`.
    ///
    /// - Precondition:
    ///   - The given `Rank` must be an `ace`..`ten`, `jack`, `queen`, `king`, or `joker`.
    ///   - The given `Suit` must be `clubs`, `diamonds`, `hearts`, `spades`, or `null`.
    ///   - The given `Suit` must be nil if the specified `Rank` is a `joker`.
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
        super.init(rank.getTitle(for: suit, color))
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the given `Card`s are equal.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The value to compare against.
    ///   - rhs: The value to compare to.
    /// - Returns: True if the given `Card`s are equal, else false.
    public static func == (lhs: PlayingCard, rhs: PlayingCard) -> Bool {
        
        return lhs.rank.equals(rhs.rank) && lhs.suit == rhs.suit &&
            lhs.points == rhs.points && lhs.title == rhs.title
    }
    
    /// Determines if the given left-handside`Card` is less than the specified right-handside `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The value to compare against.
    ///   - rhs: The value to compare to.
    /// - Returns: True if given left-handside`Card` is less than the specified right-handside `Card`.
    public static func < (lhs: PlayingCard, rhs: PlayingCard) -> Bool {
        
        var isLessThan: Bool
        let aces = lhs.rank == .ace || rhs.rank == .ace
        let jokers = lhs.rank == .joker || rhs.rank == .joker
        
        if (aces || jokers) { // Account for ace being high & variable joker
            
            isLessThan = lhs.points < rhs.points
        
        } else { // Get the natural hierarchy
            
            let index1 = PlayingCards.ranks.firstIndex(of: lhs.rank)!
            let index2 = PlayingCards.ranks.firstIndex(of: rhs.rank)!
            
            isLessThan = index1 < index2
        }
        
        return isLessThan
    }
    
//    /// *Note* The following documentation is taken directly from Swift's `Hashable` protocol.
//    ///
//    /// Hashes the essential components of this value by feeding them into the
//    /// given hasher.
//    ///
//    /// Implement this method to conform to the `Hashable` protocol. The
//    /// components used for hashing must be the same as the components compared
//    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
//    /// with each of these components.
//    ///
//    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
//    ///   compile-time error in the future.
//    ///
//    /// - Parameter hasher: The hasher to use when combining the components
//    ///   of this instance.
//    public func hash(into hasher: inout Hasher) {
//
//        hasher.combine(title)
//        hasher.combine(rank)
//        hasher.combine(suit)
//        hasher.combine(points)
//        hasher.combine(color)
//    }
}
