//=============================================================================//
//                                                                             //
//  Dictionary.swift                                                           //
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

/// An extension for common `Dictionary`operations.
extension Dictionary {
    
    /// A `Collection` of all `Value`s.
    var allValues: [Self.Value] { Array(values) }
}
