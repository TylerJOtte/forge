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
    ///   - All `Card`s in the given collection must be in sequential order when sorted.
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
            
            print("The given Cards must be in sequential order when sorted.")
            return nil
        }
        
        super.init(of: 3, to: Int.max, cards)
    }
    
    /// Creates a`Run`with the given terms.
    ///
    /// - Precondition:
    ///   - `min` must be >= 3.
    ///   - `max` must be  >= `min`.
    ///   - The given `Card`'s count  must be >= 3.
    ///   - All `Card`s in the given collection must be in sequential order when sorted.
    /// - Postcondition:
    ///   - The `Run` can hold three to given `max Card`s.
    ///   - The `Run` contains the given `Card`s.
    ///   - The `Run`s title is set according to the # of `Card`s it holds.
    ///   - The `Run`s points is set according to the # of `Card`s it holds.
    /// - Parameters:
    ///   - min: The minimum # of `Card`s allowed in the `Run`.
    ///   - max: The maximum # of `Card`s allowed in the `Run`.
    ///   - cards: The `Card`s to create `Run` with.
    ///   - duplicates: True if allow duplicates in sequential order, else false.
    public init?(of min: Int, to max: Int, _ cards: [PlayingCard],
                 duplicates: Bool = false) {
        
        guard (min >= 3) else {
            
            print("Min must be >= 3.")
            return nil
        }
        
        guard (max >= min) else {
            
            print("Max must be >= min.")
            return nil
        }
        
        guard (cards.count >= min) else {
            
            print("The given Card collection must contain three or more Cards.")
            return nil
        }
        
        guard (cards.sorted().areSequential(duplicates: duplicates)) else {
            
            print("The given Cards must be in sequential order when sorted.")
            return nil
        }
        
        super.init(of: min, to: max, cards)
    }
}
