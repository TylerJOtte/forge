//=============================================================================//
//                                                                             //
//  Fifteen.swift                                                              //
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

/// A `HandRank` of`PlayingCard`s with points that sum to 15.
public class Fifteen: Hand, HandRank {
    
    /// The total # of points.
    public let points: Int = 15
    
    /// The primary name.
    public let title: String = "Fifteen"
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Fifteen`with the given terms.
    ///
    /// - Precondition:
    ///   - The given `Card`'s count  must be >= 2 and &lte; 5.
    ///   - The given `Card`'s points must sum to 15.
    /// - Postcondition:
    ///   - The `Fifteen` can hold two  to five `Card`s.
    ///   - The `Fifteen` contains the given `Card`s.
    ///   - The `Fifteen`s title is set to `Fifteen`.
    ///   - The `Fifeen`s points are set to two.
    /// - Parameter cards: The `Card`s to create `Kind` with.
    public init?(of cards: [PlayingCard]) {
        
        guard (cards.count >= 2 && cards.count <= 5) else {
            
            print("The given Card collection must contain two to five Cards.")
            return nil
        }
        
        guard (cards.sum() == 15) else {
            
            print("The given Card's points must sum to 15.")
            return nil
        }
        
        super.init(of: 2, to: 5, cards)
    }
}
