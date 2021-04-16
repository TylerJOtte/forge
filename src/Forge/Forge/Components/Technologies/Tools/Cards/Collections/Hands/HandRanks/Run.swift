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
    
    /// The total # of points.
    public let points: Int
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Run`with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Card`'s count  must be >= 3 with 0 specified pairs, or
    ///   - The given `Card`'s count must be 4 or 5 with 1 specified pair, or
    ///   - The given `Card`'s count must be 5 with 2 or 3 specified pairs.
    ///   - All `Card`s in the given collection must be in sequential order.
    /// - Postcondition:
    ///   - The `Run` can hold three to Int.max `Card`s with 0 specified paris, or
    ///   - The `Run` can hold 4-5  `Card`s with 1 specified pair, or
    ///   - The `Run` can hold 5 `Card`s with 2-3 specified pairs.
    ///   - The `Run` contains the given `Card`s.
    ///   - The `Run`s title is set according to the # of `Card`s and pairs it holds.
    ///   - The `Run`s points is set according to the # of `Card`s and pairs  it holds.
    /// - Parameters:
    ///   - cards: The `Card`s to create `Run` with.
    ///   - pairs: The # of pairs in the given `Card`s.
    public init?(of cards: [PlayingCard], with pairs: Int = 0) {
        
        let count = cards.count
        let isSequence = pairs == 0 && count >= 3
        let isDoubleRun = pairs == 1 && (count == 4 || count == 5)
        let isDoubleDoubleRun = pairs == 2 && count == 5
        let isTripleRun = pairs == 3 && count == 5
        let hasMultipleRuns = isDoubleRun || isDoubleDoubleRun || isTripleRun
        let min = isSequence ? 3 : isDoubleRun ? 4 : 5
        let max = isSequence ? Int.max : 5

        guard (count >= min) else {
            
            print("The # of given Cards must be >= to \(min).")
            return nil
        }
        
        guard (isSequence || hasMultipleRuns) else {
            
            print("The collection requires >= \(min) Cards with \(pairs) pairs.")
            return nil
        }
        
        guard (cards.areSequential()) else {
            
            print("The given Cards must be in sequential order.")
            return nil
        }
        
        // TODO: Add formula to calculate title and points so users can have
        //       more cards in combinations (e.g., double run with 6..* Cards).
        if (isSequence) {
            
            self.title = "Run Of \(count)"
            self.points = count
        
        } else if (isDoubleRun) {
            
            self.title = "Double Run Of \(count - 1)"
            self.points = count == 4 ? 8 : 10
        
        } else if (isDoubleDoubleRun) {
            
            self.title = "Double Double Run"
            self.points = 16
        
        } else if (isTripleRun) {
            
            self.title = "Triple Run"
            self.points = 15
            
        }  else {
            
            // TODO: Add edge cases
            print("Error. Invalid Run.")
            return nil
        }

        super.init(of: min, to: max, cards)
    }
}
