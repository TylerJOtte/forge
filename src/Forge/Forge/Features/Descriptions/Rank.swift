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

/// A hierarchical position.
public enum Rank: Description {
    
    case ace
    case bishop
    case doubleRun
    case doubleDoubleRun
    case eight
    case fifteen
    case five
    case flush
    case four
    case fourOfAKind
    case jack
    case joker
    case king
    case knight
    case nine
    case nobs
    case one
    case pair
    case queen
    case run
    case seven
    case six
    case ten
    case three
    case threeOfAKind
    case tripleRun
    case two
    case zero
}
