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

/// A `HandRank` of `PlayingCard`s with a  non-`jack Card` and `jack Card` with  same `Suit`.
public class Nobs: Hand, HandRank {
    
    /// The primary name.
    public let title: String = "Nobs"
    
    /// The total # of points.
    public let points: Int = 1
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Nobs HandRank`with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Card`'s count  must = 2.
    ///   - The given `Card`'s must contain a non-`jack Card`.
    ///   - The given `Card`'s  must contain a `jack Card` with the same `Suit` as the other.
    /// - Postcondition:
    ///   - The `HandRank` can hold two `Card`s.
    ///   - The `HandRank` contains the given `Card`s.
    ///   - The `HandRank`s title is set to `Nobs`.
    ///   - The `HandRank`s points are set to 1.
    /// - Parameter cards: The `Card`s to create `Kind` with.
    public init?(of cards: [PlayingCard]) throws {
        
        let nonJack = cards.filter{$0.rank != .jack}.first
        let jack = cards.filter{$0.rank == .jack}.first
        
        guard (cards.count == 2) else {
            
            print("The given collection must contain two Cards.")
            return nil
        }
        
        guard (nonJack != nil) else {
            
            print("The given collection must contain one non-jack Card.")
            return nil
        }
        
        guard (jack != nil) else {
            
            print("The given collection must contain one jack Card.")
            return nil
        }
        
        guard (jack!.suit == nonJack!.suit) else {
            
            print("The given collection must contain a jack Card with the " +
                  "same Suit as the non-jack Card.")
            return nil
        }

        
        try super.init(of: 2, to: 2, cards)
    }
}
