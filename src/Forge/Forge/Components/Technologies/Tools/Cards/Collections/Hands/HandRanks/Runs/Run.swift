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
public class Run: PlayingCardHand, HandRank {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Run`with the given `Card`s.
    ///
    /// - Precondition:
    ///    - The given `Card`s must contain at least three `Card`s.
    ///    - The given `Card`s must be in sequential order.
    /// - Postcondition:
    ///    - The `HandRank` can hold three to `Int.max Card`s.
    ///    - The `HandRank` contains the given `Card`s.
    ///    - The `HandRank`s title is set to "Run".
    ///    - The `HandRank`s points are set to the `count`.
    ///    - title = "Run".
    /// - Parameter cards: The `Card`s to create the `HandRank` with.
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s contain less than
    ///       three `Card`s.
    ///    - `ElementsError.areNotSequential` if the given `Card`s are not in sequential order.
    public init(of cards: [PlayingCard]) throws {
        
        let min = 3
        let max = Int.max
        
        guard (cards.count >= min) else {
            
            print("The collection must contain at least \(min) Cards.")
            throw ElementsError.insufficientElements
        }
        
        guard (try cards.areSequential()) else {

            print("The given Cards are not in sequential order.")
            throw ElementsError.areNotSequential
        }
        
        try super.init(of: min, to: max, cards)
    }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Run`with the given `Card`s and specified # of pairs.
    ///
    /// - Precondition:
    ///    - The given min must be >= three.
    ///    - The specified `Card`s must contain the given min`Card`s.
    ///    - The # of specified pairs must be >= one.
    ///    - The given `Card`s must contain the specified # of pairs.
    ///    - The given `Card`s must be in sequential order.
    /// - Postcondition:
    ///    - The `HandRank` can hold four to `Int.max Card`s.
    ///    - The `HandRank` contains the given `Card`s.
    ///    - The `HandRank`s title is set to "Run of `count`".
    ///    - The `HandRank`s points are set to the `count`.
    ///    - title = name of calling model.
    /// - Parameters:
    ///    - cards: The `Card`s to create the `HandRank` with.
    ///    - pairs: The # of pairs that the given `Card`s contain.
    ///    - groups: True if multiple pair groups allowed, else false.
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s
    ///       - Contain less than three `Card`s.
    ///    - `ElementsError.invalidDuplicateCount` if
    ///       - Doesn't contain the specified # of pairs, or
    ///       - Specified groups is false, and `Card`s contain multiple pair groups
    ///    - `RangeError.invalidMin`if
    ///       - The given min is less than four.
    ///       -  The # of specified pairs &lt;= zero.
    ///    - `ElementsError.areNotSequential` if the given `Card`s are not in sequential order.
    init(of min: Int, _ cards: [PlayingCard], with pairs: Int,
         multiple groups: Bool = true) throws {
        
        let minCards = 3
        let max = Int.max
        
        guard (min >= minCards) else {
            
            print("The given min must be >= \(minCards).")
            throw ElementsError.insufficientElements
        }
        
        guard (try cards.areSequential(with: pairs, multiple: groups)) else {

            print("The given Cards are not in sequential order.")
            throw ElementsError.areNotSequential
        }
        
        try super.init(of: min, to: max, cards)
    }
}
