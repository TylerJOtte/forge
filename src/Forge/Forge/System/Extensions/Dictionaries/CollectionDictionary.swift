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

/// An extension for common `Dictionary`operations where the value of an entry is a `Collection`.
extension Dictionary where Value: Collection {
    
    /// A collection of all `Element`s from all `Value`s.
    var allValueElements: [Value.Element] { allValues.flatMap{$0} }
    
    /// The total count of all `Collection` values
    var totalCount: Int { map{$1.count}.sum }
}
