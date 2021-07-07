//=============================================================================//
//                                                                             //
//  HandRankArrayDictionary.swift                                              //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/14/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//

/// An extension for common `Dictionary`operations where the value of an entry is a
/// `HandRank Array`.
extension Dictionary where Value: Collection, Value.Element: Scoreable {
    
    /// Sums all the `Element`s' points.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The sum of all the `Element`s' points.
    var points: Int {
        
        return Array(values).totalPoints
    }
}
