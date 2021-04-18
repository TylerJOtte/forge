//=============================================================================//
//                                                                             //
//  DoubleRun.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/17/21.                                       //
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

/// A `HandRank` of with two `Run`s and  a pair.
public class DoubleRun: Run {
    
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
    
    /// Creates a`DoubleRun`with the given `Card`s.
    ///
    /// - Precondition:
    ///    - The given `Card`s must contain at least four`Card`s.
    ///    - The given `Card`s must contain one and only one pair.
    ///    - The given `Card`s must be in sequential order.
    /// - Postcondition:
    ///    - The `HandRank` can hold four to `Int.max Card`s.
    ///    - The `HandRank` contains the given `Card`s.
    ///    - The `HandRank`s title is set to "Double Run".
    ///    - The `HandRank`s points are set to according to the sequence length in the given `Card`s.
    /// - Parameter cards: The `Card`s to create the `HandRank` with.
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s ontain less than four
    ///      `Card`s.
    ///    - `ElementsError.invalidDuplicateCount` if the given `Card`s doesn't contain one
    ///       and only pair.
    ///    - `ElementsError.areNotSequential` if the given `Card`s are not in sequential order.
    public override init(of cards: [PlayingCard]) throws {
        
        let min = 4
        let runs = 2
        let pairs = 1
        let title = "Double Run"
  
        guard (cards.count >= min) else {
            
            print("The collection must contain at least \(min) Cards.")
            throw ElementsError.insufficientElements
        }
        
        self.runs = runs
        self.pairs = pairs
        
        try super.init(of: min, cards, with: pairs, named: title)
    }
    
    /// Creates a`DoubleRun`with the given terms.
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
    /// - Parameters:
    ///    - cards: The `Card`s to create the `HandRank` with.
    ///    - pairs: The # of pairs that the given `Card`s contain.
    ///    - title: The name of the`HandRank`.
    /// - Throws:
    /// - Throws:
    ///    - `ElementsError.insufficientElements` if the given `Card`s
    ///       - Contain less than four `Card`s, or
    ///       - Contain less pairs than the specified # of pairs.
    ///    - `ElementsError.excessiveElements` if the given `Card`s contain more  pairs than the specified # of pairs.
    ///    - `RangeError.invalidMin`if
    ///       - The given min is less than four.
    ///       -  The # of specified pairs &lt;= zero.
    ///    - `ElementsError.areNotSequential` if the given `Card`s are not in sequential order.
    init(of min: Int, _ cards: [PlayingCard], with runs: Int,
                  and pairs: Int, named title: String) throws {
        
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
        
        try super.init(of: min, cards, with: pairs, named: title)
    }
}
