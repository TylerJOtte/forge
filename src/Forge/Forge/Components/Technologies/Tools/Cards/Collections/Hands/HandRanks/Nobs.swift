//=============================================================================//
//                                                                             //
//  Nobs.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/11/21.                                       //
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

/// A `HandRank` of `PlayingCard`s with a  standard non-`jack Card` & a`jack Card` with
/// same `Suit`.
public class Nobs: PlayingCardHand, HandRank {
    
    /// The primary name.
    public let title: String = "Nobs"
    
    /// The total # of points.
    public let points: Int = 1
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Nobs HandRank`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain two and only two`Card`s.
    ///   - The given `Card`'s must contain a standard non-`jack Card`.
    ///   - The given `Card`'s  must contain a `jack Card` with the same `Suit` as the other.
    /// - Postcondition:
    ///   - The `HandRank` can hold two `Card`s.
    ///   - The `HandRank` contains the given `Card`s.
    ///   - The `HandRank`s title is set to `Nobs`.
    ///   - The `HandRank`s points are set to one.
    /// - Parameter cards: The `Card`s to create the `HandRank` with.
    /// - Throws:
    ///   - `ElementsError.insufficientElements` if the given `Card`s
    ///      - Contain less than two `Card`s, or
    ///      - Do not contain a standard non-`jack Card`, or
    ///      - Do not contain a a `jack Card` with the same `Suit` as the other.
    ///   - `ElementsError.excessiveElements` if the given `Card`s contain more than five
    ///     `Card`s.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 2
        let max = 2
        let nonJack = cards.filter{$0.rank != .jack}.first
        let jack = cards.filter{$0.rank == .jack}.first
        
        guard (cards.count >= min) else {
            
            print("The collection must contain at least \(min) Cards.")
            throw ElementsError.insufficientElements
        }
        
        guard (cards.count <= max) else {
            
            print("The collection must contain at most \(max) Cards.")
            throw ElementsError.excessiveElements
        }
        
        guard (nonJack != nil) else {
            
            print("The given collection must contain a standard non-jack Card.")
            throw ElementsError.insufficientElements
        }
        
        guard (jack != nil) else {
            
            print("The given collection must contain a jack Card.")
            throw ElementsError.insufficientElements
        }
        
        guard (jack!.suit == nonJack!.suit) else {
            
            print("The given Cards must contain a jack Card with the same Suit "
                + "as the non-jack Card.")
            throw ElementsError.insufficientElements
        }
        
        try super.init(of: min, to: max, cards)
    }
}
