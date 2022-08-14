//=============================================================================//
//                                                                             //
//  Relatable.swift                                                            //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/15/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//


/// A relatable `Trait`.
public protocol Relatable: Trait, Comparable {
    
    /// Determines if the {Model} is less than the given {Model}.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The {Model} to compare to.
    /// - Returns: True if the {Model} is less than the given {Model}, else false.
    func isLessThan(_ rhs: Self) -> Bool

    /// Determines if the {Model} equals the given {Model}.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The {Model} to compare to.
    /// - Returns: True if the {Model} equals the given {Model}, else false.
    func equals(_ rhs: Self) -> Bool
}
