//=============================================================================//
//                                                                             //
//  Containable.swift                                                          //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/01/21.                                       //
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

/// A containable `Trait`.
public protocol Containable: Relatable {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The type of `Element` that the model contains.
    associatedtype T
    
    /// The total # of `Element`s.
    var count: Int { get }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if the {model} is empty.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the {model} is empty, else false.
    func isEmpty() -> Bool
    
    /// Determines if the {model} is full.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the {model} is full, else false.
    func isFull() -> Bool
    
    /// Determines if the given `T` exists.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter t: The `T` to find.
    /// - Returns: True if the given `T` exists, else false.
    func contains(_ t: T) -> Bool
}
