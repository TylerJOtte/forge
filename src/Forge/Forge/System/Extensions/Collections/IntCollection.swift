//=============================================================================//
//                                                                             //
//  IntCollection.swift                                                        //
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



/// An extension for common `Int Collection` operations.
extension Collection where Element == Int {

    /// The sum total of all `Element`s.
    var sum: Int { return reduce(0, +) }
}
