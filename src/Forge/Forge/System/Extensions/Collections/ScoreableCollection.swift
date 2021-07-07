//=============================================================================//
//                                                                             //
//  ScoreableCollection.swift                                                  //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 7/07/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//

/// An extension for common `Scoreable Collection` operations.
extension Collection where Element: Scoreable  {
 
    /// The sum total of each `Element`'s points.
    var totalPoints: Int { return map{$0.points}.sum }
}

/// An extension for common `Collection` of `Scoreable Collection `s operations.
extension Collection where Element: Collection, Element.Element: Scoreable {
    
    /// The sum total of each `Element`'s total points.
    var totalPoints: Int { return map{$0.totalPoints}.sum }
}
