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
public class Flush: Hand, HandRank {
    
    /// The primary name.
    public var title: String { return "\(count)-Card Flush" }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Flush`with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Card`'s count  must be >= 4 and &lt;= 5.
    ///   - All `Card`s in the given collection must have the same `Suit`.
    /// - Postcondition:
    ///   - The `Flush` can hold four to five `Card`s.
    ///   - The `Flush` contains the given `Card`s.
    ///   - The `Flush`s title is set according to the # of `Card`s it holds.
    ///   - The `Flush`s points is set according to the # of `Card`s it holds.
    /// - Parameter cards: The `Card`s to create `Kind` with.
    public init?(of cards: [PlayingCard]) throws {
        
        guard (cards.count >= 4 && cards.count <= 5) else {
            
            print("The given Card collection must contain four or five Cards.")
            return nil
        }
        
        guard (cards.areEquallySuited()) else {
            
            print("The given Cards must all have the same Suit.")
            return nil
        }
        
        try super.init(of: 4, to: 5, cards)
    }
}
