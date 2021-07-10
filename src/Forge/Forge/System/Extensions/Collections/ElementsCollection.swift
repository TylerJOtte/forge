//=============================================================================//
//                                                                             //
//  ElementsCollection.swift                                                   //
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


/// An extension for common `Elements Collection` operations.
extension Collection where Element: Containable {

    /// The sum total of each `Element`'s count.
    var totalCount: Int { return map{$0.count}.sum }
}
