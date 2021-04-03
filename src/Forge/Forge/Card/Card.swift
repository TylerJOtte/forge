//=============================================================================//
//                                                                             //
//  Card.swift                                                                 //
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

/// A game `Card`.
public class Card: Equatable {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The primary name.
    public let title: String
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `Card` with the given title.
    ///
    /// - Precondition: None.
    /// - Postcondition: The `Card`s title is set to the given title.
    /// - Parameter title: The primary name.
    public init(_ title: String) {
        
        self.title = title
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the given `Card`s are equal.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The value to compare against.
    ///   - rhs: The value to compare to.
    /// - Returns: True if the given `Card`s are equal, else false.
    public static func == (lhs: Card, rhs: Card) -> Bool {
        
        return lhs.title == rhs.title
    }
}
