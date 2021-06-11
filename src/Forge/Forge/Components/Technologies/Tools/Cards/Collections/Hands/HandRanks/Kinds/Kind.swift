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

/// A `HandRank` of equally `Rank`ed `Card`s.
public class Kind<T: RankedCard>: HandRank<T> {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Kind` with the given terms.
    ///
    /// - Precondition:
    ///   - `min` must be >= 2.
    ///   - `max` must be >= `minCards`.
    ///   - The given `Card`s must contain the specified min to max # of `Card`s.
    ///   - The given `Card`s must all contain the same `Rank`.
    /// - Postcondition:
    ///   - The `Kind` can hold the given min to max # of `Card`s.
    ///   - The `Kind` contains the given `Card`s.
    ///   - The `Kind`'s points are set to the sum of `Pair` points found in the given `Card`s.
    ///   - The `Kind`'s title is set to the name of the model.
    /// - Parameters:
    ///   - min: The minimum # of `Card`s allowed in the `Kind`.
    ///   - max: The maximum # of `Card`s allowed in the `Kind`.
    ///   - cards: The `Card`s to include in the `Kind`.
    /// - Throws:
    ///   - `invalidMin` if the given min is &lt; 2.
    ///   - `invalidMax` if the given max is &lt; the specified min.
    ///   - `invalidCount` if the given `Card`s do not contain the specified min to max # of `Card`s.
    ///   - `invalidRank` if the given `Card`s do not all contain the same `Rank`.
    init(of min: Int, to max: Int, _ cards: [T]) throws {

        guard (min >= 2) else {

            print("Min must be >= 2.")
            throw RangeError.invalidMin
        }

        guard (cards.areEquallyRanked()) else {

            print("The given Cards must all contain the same Rank.")
            throw DescriptionError.invalidRank
        }

        let points = cards.count * (cards.count - 1)

        try super.init(of: min, to: max, cards, worth: points)
    }
}
