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
public class PlayingCard: RankedCard {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The symbol grouping.
    public let suit: Suit
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    // TODO: Add tests for below constructor
    
    /// Creates a `PlayingCard` with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Rank` must be a standard`PlayingCard Rank`.
    ///   - The given position must be between 0-14.
    /// - Postcondition:
    ///   - The `Card`'s `Rank` is set to the given `Rank`.
    ///   - The `Card`'s `Suit` is set to `null` if  given `Rank` is a `joker`, else `hearts`.
    ///   - The `Card`'s points are set to the given points.
    ///   - The `Card`'s position is set to the given position.
    ///   - The `Card`'s title is set to the given title if not empty, else "`{Rank}` of `{Suit}`".
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - points: The total # of points.
    ///   - position: The given `Rank`'s order in the hierarchy.
    init(_ rank: Rank, worth points: Int, at position: Int,
         with title: String = "") {
        
        let suit = rank == .joker ? Suit.null : Suit.hearts
        let cardTitle = title == "" ? "\(rank) Of \(suit)".capitalized : title
        
        assert(rank.isStandard(),
               "The given Rank is not a standard PlayingCard Rank.")
        
        assert(suit.isStandard(),
               "The given Suit is not a standard PlayingCard Suit.")

        assert((suit == .null && rank == .joker) ||
               (suit != .null && rank != .joker),
               "The given Rank & Suit is not a valid combination.")
        
        assert(position >= 0 && position <= 14,
               "The given order must be between 1-14.")
        
        self.suit = suit

        super.init(with: rank, at: position, worth: points, named: cardTitle)
    }
    
    /// Creates a `PlayingCard` with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Rank` must be a standard`PlayingCard Rank`.
    ///   - The given `Suit` must be a standard `PlayingCard Suit`.
    ///   - The given `Suit` must be `null` if the specified `Rank` is a `joker`.
    ///   - The given position must be between 0-14.
    /// - Postcondition:
    ///   - The `Card`'s `Rank` is set to the given `Rank`.
    ///   - The `Card`'s `Suit` is set to the given `Suit`.
    ///   - The `Card`'s points are set to the given points.
    ///   - The `Card`'s position is set to the given position.
    ///   - The `Card`'s title is set to the given title if not empty, else "`{Rank}` of `{Suit}`".
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - suit: The symbol grouping.
    ///   - points: The total # of points.
    ///   - position: The given `Rank`'s order in the hierarchy.
    /// - Throws:
    ///   - `invalidSuit` if:
    ///     - The given `Suit` is not a standard `PlayingCard Suit`, or
    ///     - The given `Suit` is `null` and the specified `Rank` is not a `joker`, or
    ///     - The given `Suit` is not `null` and the specified `Rank` is a `joker`.
    init(_ rank: Rank, of suit: Suit, worth points: Int,
         at position: Int, with title: String = "") throws {

        assert(rank.isStandard(),
               "The given Rank is not a standard PlayingCard Rank.")
        
        assert(position >= 0 && position <= 14,
               "The given order must be between 1-14.")

        guard (suit.isStandard()) else {

            print("The given Suit is not a standard PlayingCard Suit.")
            throw DepictionError.invalidSuit
        }

        guard ((suit == .null && rank == .joker) ||
               (suit != .null && rank != .joker)) else {

            print("The given Rank & Suit is not a valid combination.")
            throw DepictionError.invalidSuit
        }
        
        self.suit = suit

        let title = title == "" ? "\(rank) Of \(suit)".capitalized : title

        super.init(with: rank, at: position, worth: points, named: title)
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the `Card` equals the given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Card` to compare to.
    /// - Returns: True if the `Card` equals the given `Card`, else false.
    public override func equals(_ rhs: Card) -> Bool {
        
        var equals = false
        
        if let card = rhs as? PlayingCard {
            
            equals = rank == card.rank && suit == card.suit && position ==
                card.position
        }
        
        return equals
    }
}
