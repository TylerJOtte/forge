//=============================================================================//
//                                                                             //
//  MultiRun.swift                                                             //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/29/21.                                       //
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

/// A `HandRank` of multiple `Run`s with at least one common `Card`.
public class MultiRun: Run {
    
    /// The total # of runs.
    public let runs: Int
    
    /// The total # of pairs.
    public let pairs: Int
    
    /// The total # of `Card`s in a run.
    public var sequence: Int { count -
        
        (pairs % 2 == 0 ? pairs : Int(ceil(Double(pairs) / 2)))
    }
    
    /// The total # of points from runs.
    public var runPoints: Int { runs * sequence }
    
    /// The total # of points from pairs.
    public var pairPoints: Int { pairs * 2 }
    
    /// The total # of points.
    public var points: Int { runPoints + pairPoints }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`MultiRun`with the given terms.
    ///
    /// - Precondition:
    ///    - The given min must be >= four.
    ///    - The specified `Card`s must contain the given min`Card`s.
    ///    - The # of specified pairs must be >= one.
    ///    - The given `Card`s must contain the specified # of pairs.
    ///    - The given `Card`s must be in sequential order.
    /// - Postcondition:
    ///    - The `HandRank` can hold four to `Int.max Card`s.
    ///    - The `HandRank` contains the given `Card`s.
    ///    - The `HandRank`s title is set to the given title.
    ///    - The `HandRank`s points are set to according to the sequence length in the given `Card`s.
    ///    - title = name of calling model.
    /// - Parameters:
    ///    - cards: The `Card`s to create the `HandRank` with.
    ///    - pairs: The # of pairs that the given `Card`s contain.
    ///    - groups: True if multiple pair groups allowed, else false.
    /// - Throws:
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s
    ///       - Contain less than four `Card`s, or
    ///       - Contain less pairs than the specified # of pairs.
    ///    - `ElementsError.invalidDuplicateCount` if specified groups is false, and `Card`s
    ///       contain multiple pair groups.
    ///    - `ElementsError.excessiveElements` if the given `Card`s contain more  pairs than
    ///       the specified # of pairs.
    ///    - `RangeError.invalidMin`if
    ///       - The given min is less than four.
    ///       -  The # of specified pairs &lt;= zero.
    ///    - `ElementsError.areNotSequential` if the given `Card`s are not in sequential order.
    init(of min: Int, _ cards: [PlayingCard], with runs: Int, and pairs: Int,
         multiple groups: Bool = true) throws {
        
        let minCards = 4
        
        guard (min >= minCards) else {
            
            print("The given min must be >= \(minCards).")
            throw ElementsError.insufficientElements
        }
        
        guard (cards.count >= min) else {
            
            print("The collection must contain at least \(minCards) Cards.")
            throw ElementsError.insufficientElements
        }
        
        self.runs = runs
        self.pairs = pairs
        
        try super.init(of: min, cards, with: pairs, multiple: groups)
    }
}
