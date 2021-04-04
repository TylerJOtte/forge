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
public class HandRank: Hand {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    // The primary name.
    public let title: String
    
    // The total # of points
    public let points: Int
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`HandRank`with the given terms.
    ///
    /// - Precondition:
    ///   - `min` must be >= 0.
    ///   - `max` must be  >= 1.
    ///   - `max` must be >= `minCards`.
    ///   - The # of given `Card`s must be &lt;= `max`.
    /// - Postcondition:
    ///   - The `HandRank` can hold zero to given max `Card`s.
    ///   - The `HandRank` contains the given `Card`s.
    ///   - The `HandRank` contains the given title.
    ///   - The `HandRank` contains the given points.
    /// - Parameters:
    ///   - min: The minimum # of `Card`s allowed in the `HandRank`.
    ///   - max: The maximum # of `Card`s allowed in the `HandRank`.
    ///   - cards: The `Card`s to create `HandRank` with.
    ///   - title: The `HandRank`'s primary name..
    ///   - points: The `HandRank`'s total # of points.
    public init?(of min: Int, to max: Int, _ cards: [Card], with title: String,
                 and points: Int) {
        
        self.title = title
        self.points = points
        super.init(of: min, to: max, cards)
    }
}
