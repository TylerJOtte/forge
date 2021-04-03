//=============================================================================//
//                                                                             //
//  Rank.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/02/21.                                       //
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

/// A hierarchical position.
public enum Rank: Int {
    
    //=========================================================================//
    //                                 ATTRIBUTES                              //
    //=========================================================================//
    
    case ace
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack
    case queen
    case king
    case joker
    
    //=========================================================================//
    //                                  METHODS                                //
    //=========================================================================//

    /// Determines if the `Rank` is a numeric `Rank` between the given range.
    ///
    /// - Parameters:
    ///   - min: The minimum numeric `Rank` possible.
    ///   - max: The maximum numeric `Rank` possible.
    ///
    /// - Returns: True if the`Rank` is a numeric `Rank` between the given range.
    public func isNumeric(from min: Int = 1, to max: Int = 10) -> Bool {

        return self.rawValue >= min && self.rawValue <= max
    }
}
