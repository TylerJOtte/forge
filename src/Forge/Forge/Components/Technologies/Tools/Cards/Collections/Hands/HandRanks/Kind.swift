//=============================================================================//
//                                                                             //
//  Kind.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/04/21.                                       //
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

/// A `HandRank` of equally `Rank`ed `PlayingCard`s.
public class Kind: Hand, HandRank {
    
    /// The primary name.
    public var title: String { return "\(count) Of A Kind" }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Kind`with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Card`'s count  must be >= 2.
    ///   - All `Card`s in the given collection must have the same `Rank`.
    /// - Postcondition:
    ///   - The `Kind` can hold two  to Int.max `Card`s.
    ///   - The `Kind` contains the given `Card`s.
    ///   - The `Kind`s title is set according to the # of `Card`s it holds.
    ///   - The `Kind`s points is set according to the # of `Card`s it holds.
    /// - Parameter cards: The `Card`s to create `Kind` with.
    public init?(of cards: [PlayingCard]) {
        
        guard (cards.count >= 2) else {
            
            print("The given Card collection must contain two or more Cards.")
            return nil
        }
        
        guard (cards.areEquallySuited()) else {
            
            print("The given Cards must all have the same Rank.")
            return nil
        }
        
        super.init(of: 2, to: Int.max, cards)
    }
}
