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
    public let title: String
    
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
        
        self.title = "Run"
  
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
    /// - Parameters:
    ///    - cards: The `Card`s to create the `HandRank` with.
    ///    - pairs: The # of pairs that the given `Card`s contain.
    ///    - title: The name of the`HandRank`.
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s
    ///       - Contain less than three `Card`s.
    ///    - `ElementsError.invalidDuplicateCount` if the given `Card`s doesn't contain the
    ///       specified # of pairs.
    ///    - `RangeError.invalidMin`if
    ///       - The given min is less than four.
    ///       -  The # of specified pairs &lt;= zero.
    ///    - `ElementsError.areNotSequential` if the given `Card`s are not in sequential order.
    init(of min: Int, _ cards: [PlayingCard], with pairs: Int,
         named title: String) throws {
        
        let minCards = 3
        let max = Int.max
        
        guard (min >= minCards) else {
            
            print("The given min must be >= \(minCards).")
            throw ElementsError.insufficientElements
        }
        
        guard (try cards.areSequential(with: pairs)) else {

            print("The given Cards are not in sequential order.")
            throw ElementsError.areNotSequential
        }
        
        self.title = title
        
        try super.init(of: min, to: max, cards)
    }
}
