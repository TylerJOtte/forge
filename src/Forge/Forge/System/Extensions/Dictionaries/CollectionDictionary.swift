//=============================================================================//
//                                                                             //
//  CollectionDictionary.swift                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/02/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//

/// An extension for common `Dictionary`operations where a `Collection` is the value.
extension Dictionary where Value: Collection {
    
    /// The total count of all `Collection` values
    var totalCount: Int { map{$1.count}.sum() }
}
