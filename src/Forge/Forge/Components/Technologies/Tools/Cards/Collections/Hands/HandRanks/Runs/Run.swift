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

/// A `HandRank` of sequentially `Rank`ed `Card`s.
public class Run<T: RankedCard>: HandRank<T> {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Run` with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must contain at least three `Card`s.
    ///   - The given `Card`s must be in sequential order.
    /// - Postcondition:
    ///   - The `Run` contains the given `Card`s.
    ///   - The `Run` can hold three to `Int.max Card`s.
    ///   - The `Run`'s points are set to the # of given `Card`s.
    ///   - The `Run`'s title is set to "Run".
    /// - Parameter cards: The `Card`s to include in the `Run`.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`s do not contain at least three `Card`s.
    ///   - `invalidRank` if the given `Card`s are not in sequential order.
    public init(of cards: [T]) throws {

        let min = 3
        let max = Int.max
        let points = cards.count
        
        guard (cards.areSequential()) else {

            print("The given Cards must be in sequential order.")
            throw DescriptionError.invalidRank
        }
        
        try super.init(of: min, to: max, cards, worth: points)
    }
}
