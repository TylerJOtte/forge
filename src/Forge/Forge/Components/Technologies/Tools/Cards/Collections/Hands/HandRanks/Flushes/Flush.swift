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
public class Flush: HandRank<PlayingCard> {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Flush`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain at least four`Card`s.
    ///   - The given `Card`s must all contain the same `Suit`.
    /// - Postcondition:
    ///   - The `Flush` contains the given `Card`s.
    ///   - The `Flush` can hold four to`Int.max Card`s.
    ///   - The `Flush`'s points are set to the # of given `Card`s.
    ///   - The `Flush`'s title is set to "Flush".
    /// - Parameter cards: The `Card`s to include in the `Flush`.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`s do not contain at least four `Card`s.
    ///   - `invalidSuit` if the given `Card`s do not all contain the same `Suit`.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 4
        let max = Int.max
        let points = cards.count

        guard (cards.areEquallySuited()) else {
            
            print("The given Cards must all contain the same Suit.")
            throw DepictionError.invalidSuit
        }
        
        try super.init(of: min, to: max, cards, worth: points)
    }
}
