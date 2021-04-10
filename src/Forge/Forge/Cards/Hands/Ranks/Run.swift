//=============================================================================//
//                                                                             //
//  Run.swift                                                                  //
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

/// A `HandRank` of sequential `Card`s.
public class Run: Hand, HandRank {
    
    /// The primary name.
    public var title: String { return "Run of \(count)" }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Run`with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Card`'s count  must be >= 3.
    ///   - All `Card`s in the given collection must be sequential when sorted.
    /// - Postcondition:
    ///   - The `Run` can hold three to Int.max `Card`s.
    ///   - The `Run` contains the given `Card`s.
    ///   - The `Run`s title is set according to the # of `Card`s it holds.
    ///   - The `Run`s points is set according to the # of `Card`s it holds.
    /// - Parameter cards: The `Card`s to create `Run` with.
    public init?(of cards: [PlayingCard]) {
        
        guard (cards.count >= 3) else {
            
            print("The given Card collection must contain three or more Cards.")
            return nil
        }
        
        guard (cards.sorted().areSequential()) else {
            
            print("The given Cards must all be the same.")
            return nil
        }
        
        super.init(of: 3, to: Int.max, cards)
    }
}
