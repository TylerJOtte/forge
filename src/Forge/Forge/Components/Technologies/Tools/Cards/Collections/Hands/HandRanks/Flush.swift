//=============================================================================//
//                                                                             //
//  Flush.swift                                                                //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/10/21.                                       //
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

/// A `HandRank` of equally `Suit`ed `Card`s.
public class Flush: PlayingCardHand, HandRank {
    
    /// The primary name.
    public var title: String
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Flush`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain at least four`Card`s.
    ///   - The given `Card`s must all have the same `Suit`.
    /// - Postcondition:
    ///   - The `HandRank` can hold four to`Int.max Card`s.
    ///   - The `HandRank` contains the given `Card`s.
    ///   - The `HandRank`s title is set according to the # and order of `Card`s it holds.
    ///   - The `HandRank`s points are set according to the # of `Card`s it holds.
    ///   - title = "Flush", "Straight Flush", or "Royal Flush" depdending on the the given `Card`s.
    /// - Parameter cards: The `Card`s to create the `HandRank` with.
    /// - Throws:
    ///   - `ElementsError.insufficientElements` if the given `Card`s
    ///      - Contain less than four `Card`s, or
    ///      - Do not all have the same `Suit`.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 4
        let max = Int.max
        let high = true
        var title: String
        
        guard (cards.count >= min) else {
            
            print("The collection must contain at least \(min) Cards.")
            throw ElementsError.insufficientElements
        }
        
        guard (cards.areEquallySuited()) else {
            
            print("The given Cards must all have the same Suit.")
            throw ElementsError.insufficientElements
        }
        
        let areSequential = try cards.areSequential(ace: high)
        let isAStraight = cards.count == 5 && areSequential
        
        if (isAStraight) {
            
           let isRoyal = cards[0].rank == Rank.ten &&
                cards[1].rank == Rank.jack && cards[2].rank == Rank.queen &&
                cards[3].rank == Rank.king &&
                (cards[4].rank == Rank.ace || cards[4].rank == Rank.one)
                
                
            title = isRoyal ? "Royal Flush" : "Straight Flush"
            
        } else {
            
            title = "Flush"
        }
        
        self.title = title
        
        try super.init(of: min, to: max, cards)
    }
}
