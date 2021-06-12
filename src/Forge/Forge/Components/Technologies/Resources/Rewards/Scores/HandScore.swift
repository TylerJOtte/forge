//=============================================================================//
//                                                                             //
//  HandScore.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/01/21.                                       //
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
import SwiftUI

/// A `Hand`'s point total.
public class HandScore: Score {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The `HandRank`'s that make up the `Hand`'s total points.
    public var handRanks: [String:[HandRank]]
    
    /// The total # of points.
    public override var points: Int {
    
        // Get the point sum for each HandRank
        let sums = handRanks.mapValues{$0.map{$0.points}.reduce(0, +)}
        
        // Sum all the HandRank points
        return sums.values.reduce(0, +)
    }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `HandScore` with the given collection's`HandRank`s.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `HandScore` contains the given collection's `HandRank`s.
    ///   - The `HandScore`'s points are set according to the given collection's `HandRank`s.
    /// - Parameter handRanks: The`HandRank`s to create the`HandScore` with.
    public init(with handRanks: [String:[HandRank]])  {
        
        self.handRanks = handRanks
        
        super.init()
    }
}
