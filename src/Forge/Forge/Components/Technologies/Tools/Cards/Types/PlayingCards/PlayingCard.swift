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

/// A standard French-suited playing `Card`.
public class PlayingCard: Card {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The hierarchical position.
    public let rank: Rank
    
    /// The symbol grouping.
    public let suit: Suit
    
    /// The total # of points.
    public let points: Int
    
    /// The `Rank`s order in the hierarchy.
    internal let position: Int
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `PlayingCard` with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Rank` must be a standard`PlayingCard Rank`.
    ///   - The given `Suit` must be a standard `PlayingCard Suit`.
    ///   - The given `Suit` must be `null` if the specified `Rank` is a `joker`.
    ///   - The given position must be between 1-14.
    /// - Postcondition:
    ///   - The `Card`'s `Rank` is set to the given `Rank`.
    ///   - The `Card`'s `Suit` is set to the given `Suit`.
    ///   - The `Card`'s points are set to the given points.
    ///   - The `Card`'s position is set to the given position.
    ///   - The `Card`'s title is set to "`{Rank}` of `{Suit}`".
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - suit: The symbol grouping.
    ///   - points: The total # of points.
    ///   - position: The given `Rank`'s order in the hierarchy.
    /// - Throws:
    ///   - `invalidRank`  if the given `Rank` is not a standard `PlayingCard Rank`.
    ///   - `invalidSuit` if:
    ///     - The given `Suit` is not a standard `PlayingCard Suit`, or
    ///     - The given `Suit` is `null` and the specified `Rank` is not a `joker`, or
    ///     - The given `Suit` is not `null` and the specified `Rank` is a `joker`.
    ///   - `invalidPosition`  if the given position is not between 1-14.
    init(_ rank: Rank, of suit: Suit, worth points: Int,
         at position: Int, with title: String = "") throws {
        
        guard (rank.isStandard()) else {

            print("The given Rank is not a standard PlayingCard Rank.")
            throw DescriptionError.invalidRank
        }

        guard (suit.isStandard()) else {

            print("The given Suit is not a standard PlayingCard Suit.")
            throw DepictionError.invalidSuit
        }
        
        guard ((suit == .null && rank == .joker) ||
               (suit != .null && rank != .joker)) else {

            print("The given Rank & Suit is not a valid combination.")
            throw DepictionError.invalidSuit
        }
        
        guard (position >= 0 && position <= 14) else {

            print("The given order must be between 1-14.")
            throw RangeError.invalidPosition
        }
        
        self.rank = rank
        self.suit = suit
        self.points = points
        self.position = position
        let title = title == "" ? "\(rank) Of \(suit)".capitalized : title
        
        super.init(named: title)
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the `Card` is less than the given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Card` to compare to.
    /// - Returns: True if the `Card` is less than the given {Model}, else false.
    public override func isLessThan(_ rhs: Card) -> Bool {
        
        var isLessThan = false
        
        if let card = rhs as? PlayingCard {
            
            isLessThan = position < card.position
        }
        
        return isLessThan
    }
    
    /// Determines if the `Card` equals the given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Card` to compare to.
    /// - Returns: True if the `Card` equals the given `Card`, else false.
    public override func equals(_ rhs: Card) -> Bool {
        
        var equals = false
        
        if let card = rhs as? PlayingCard {
            
            equals = rank == card.rank && suit == card.suit
        }
        
        return equals
    }
}
