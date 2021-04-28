//=============================================================================//
//                                                                             //
//  ElementsError.swift                                                        //
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

/// A throwable `Elements Error`.
public enum ElementsError: Error {
    
    case areNotSequential
    case excessiveElements
    case insufficientCapacity
    case insufficientElements
    case invalidDuplicateCount
    case isEmpty
    case isFull
    case notFound
}
