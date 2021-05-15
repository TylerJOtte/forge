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
public class PlayingCard: Card, Comparable {
    
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
    private let position: Int
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `PlayingCard` with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Rank` must be a standard`PlayingCard Rank`.
    ///   - The given `Suit` must be a standard `PlayingCard Suit`.
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
    ///   - `invalidSuit`  if the given `Suit` is not a standard `PlayingCard Suit`.
    ///   - `invalidPosition`  if the given position is not between 1-14.
    init(_ rank: Rank, of suit: Suit, worth points: Int,
         at position: Int) throws {
        
        guard (rank.isStandard()) else {

            print("The given Rank is not a standard PlayingCard Rank.")
            throw DescriptionError.invalidRank
        }

        guard (suit.isStandard()) else {

            print("The given Suit is not a standard PlayingCard Suit.")
            throw DepictionError.invalidSuit
        }
        
        guard (position >= 1 && position <= 14) else {

            print("The given order must be between 1-14.")
            throw RangeError.invalidPosition
        }
        
        self.rank = rank
        self.suit = suit
        self.points = points
        self.position = position
        let title = "\(rank) Of \(suit)".capitalized
        
        super.init(named: title)
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the given left `PlayingCard` is less than the specified right `PlayingCard`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `PlayingCard` to compare against.
    ///   - rhs: The `PlayingCard` to compare to.
    /// - Returns: True if the given left `PlayingCard`s is less, else false.
    public static func < (lhs: PlayingCard, rhs: PlayingCard) -> Bool {

        return lhs.position < rhs.position
    }
    
    /// Determines if the given `PlayingCard`s are equal.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `PlayingCard` to compare against.
    ///   - rhs: The `PlayingCard` to compare to.
    /// - Returns: True if the given `PlayingCard`s are equal, else false.
    public static func == (lhs: PlayingCard, rhs: PlayingCard) -> Bool {

        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }
}
