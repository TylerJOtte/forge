//=============================================================================//
//                                                                             //
//  Cards.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 3/14/21.                                       //
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

/// A collection of `Card`s.
public protocol Cards: Elements where T: Card {
    
    /// The minimum # of `Card`s allowed.
    ///
    /// - Precondition: Must be >= 0.
    var minCards: Int { get }
    
    /// The maximum # of `Card`s allowed.
    ///
    /// - Precondition:
    ///   - Must be >= 1.
    ///   - Must be >= `minCards`.
    var maxCards: Int { get }
}
