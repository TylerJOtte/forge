//=============================================================================//
//                                                                             //
//  DoubleRun.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/10/21.                                       //
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

/// A `HandRank` of two sequential `Run`s.
public class DoubleRun: Run {
    
    /// The primary name.
    public override var title: String { return "Double Run of \(count)" }
    
    /// The total # of points.
    public var points: Int { return count == 4 ? 8 : 10 }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`DoubleRun`with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Card`'s count  must be >= 4 & &lt;= 5.
    ///   - The given `Card`s must contain one and only one '2 Of A `Kind`'.
    ///   - The given `Card`s must contain two `Run`s.
    ///   - All `Card`s in the given collection must be in sequential order when sorted.
    /// - Postcondition:
    ///   - The `DoubleRun` can hold four to five `Card`s.
    ///   - The `DoubleRun` contains the given `Card`s.
    ///   - The `DoubleRun`s title is set according to the # of `Card`s it holds.
    ///   - The `DoubleRun`s points are set to eight if `Cards`'s count equals four, else ten.
    /// - Parameter cards: The `Card`s to create `Run` with.
    public override init?(of cards: [PlayingCard]) {
        
        guard (cards.count >= 4 && cards.count <= 5) else {
            
            print("The given Card collection must contain four or five Cards.")
            return nil
        }
        
        guard (cards.getDuplicates().count == 1) else {
            
            print("The given Cards must contain one and only one '2 Of A Kind'.")
            return nil
        }
        
        super.init(of: 4, to: 5, cards, duplicates: true)
    }
}
