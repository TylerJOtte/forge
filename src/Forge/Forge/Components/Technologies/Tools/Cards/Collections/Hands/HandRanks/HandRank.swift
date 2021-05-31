//=============================================================================//
//                                                                             //
//  HandRank.swift                                                             //
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

/// A `Hand` of `Card`'s hiearchical position.
public class HandRank<T: RankedCard>: Hand<T>, Scoreable {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The total # of points.
    public var points: Int

    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`HandRank` with the given terms.
    ///
    /// - Precondition:
    ///   - `min` must be >= 1.
    ///   - `max` must be >= `minCards`.
    ///   - The given `Card`s must contain the specified min to max # of `Card`s.
    /// - Postcondition:
    ///   - The `HandRank` can hold the given min to max # of `Card`s.
    ///   - The `HandRank` contains the given `Card`s.
    ///   - The `HandRank`'s points are set to the given points.
    ///   - The `HandRank`'s title is set to the name of the model.
    /// - Parameters:
    ///   - min: The minimum # of `Card`s allowed in the `HandRank`.
    ///   - max: The maximum # of `Card`s allowed in the `HandRank`.
    ///   - cards: The `Card`s to include in the `HandRank`.
    ///   - points: The total # of points.
    /// - Throws:
    ///   - `invalidMin` if the given min is &lt; 1.
    ///   - `invalidMax` if the given max is &lt; the specified min.
    ///   - `invalidCount` if the given `Card`s do not contain the specified min to max # of `Card`s.
    init(of min: Int, to max: Int, _ cards: [T], worth points: Int) throws {
        
        guard (min >= 1) else {

            print("Min must be >= 1.")
            throw RangeError.invalidMin
        }
        
        self.points = points
        
        try super.init(of: min, to: max, cards)
    }
}
