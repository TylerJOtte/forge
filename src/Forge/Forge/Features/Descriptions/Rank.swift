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
public enum Rank: Int, Description {
    
    //=========================================================================//
    //                                 ATTRIBUTES                              //
    //=========================================================================//
    
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
    case joker
    case bishop
    case knight
    
    //=========================================================================//
    //                                  TESTERS                                //
    //=========================================================================//

    /// Determines if the `Rank` is a numeric `Rank` between the given range.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - min: The minimum numeric `Rank` possible.
    ///   - max: The maximum numeric `Rank` possible.
    /// - Returns: True if the`Rank` is a numeric `Rank` between the given range, else false.
    func isNumeric(from min: Int, to max: Int) -> Bool {

        return self.rawValue >= min && self.rawValue <= max
    }
}
