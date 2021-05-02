//=============================================================================//
//                                                                             //
//  HandRank.swift                                                             //
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

import Foundation

/// A `Hand` of `Card`'s hiearchical position.
public protocol HandRank: PlayingCardHand {
    
    /// The total # of points.
    var points: Int { get }
}

/// Default implementations for a `HandRank`
extension HandRank {
    
    /// The total # of points.
    public var points: Int { count }
}
