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
    
    /// The color-coded `Symbol`.
    public let suit: Suit?
    
    /// The total # of points.
    public let points: Int
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `PlayingCard` with the given `Rank`, `Suit`, & `Color`.
    ///
    /// - Precondition:
    ///   - `Rank` must be an `ace`, `one`..`ten`, `jack`, `queen`, `king`, or `joker`.
    ///   - `Suit` must be nil if `Rank` is a `joker`, else `Suit`'s symbol must be a `clover`,
    ///     `diamond`, `heart`, or `spade`.
    /// - Postcondition:
    ///   - The `Card`s `Rank`is set to the given `Rank`.
    ///   - The `Card`s `Suit` is set to the given `Suit`.
    ///   - The `Card`s points are set to the standard default points for the`Rank`.
    ///   - The `Card`s title is set to "`Rank` of `Suit`" if not a `joker`, else `Color` Joker.
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - suit: The color-coded `Symbol`.
    ///   - color: The primary `Color`.
    public init?(_ rank: Rank, of suit: Suit?, _ color: Color = Color.white) {
        
        guard (rank.isValid(for: suit)) else {
            
            print("The given Rank and Suit are not a valid PlayingCard pair.")
            return nil
        }
        
        self.rank = rank
        self.suit = suit
        self.points = rank.getPoints()
        
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
        
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit &&
            lhs.points == rhs.points && lhs.title == rhs.title
    }
}
