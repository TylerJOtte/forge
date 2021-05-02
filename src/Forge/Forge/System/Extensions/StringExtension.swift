//=============================================================================//
//                                                                             //
//  StringExtension.swift                                                      //
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

/// An extension for common `String` operations.
extension String {
    
    /// Splits the `String` on capital letters using the given token.
    ///
    /// - Precondition: None.
    /// - Postcondition: The given token is added before each capital letter in the `String`.
    /// - Parameter token: The token to add before each capital letter in the `String`.
    /// - Returns: The `String` with the given token added before each capital letter.
    func splitOnCapitals(using token: String = " ") -> String {
        
        return add(token, before: {$0.isUpperCased})
    }
    
    /// Adds the given token before each letter in the `String` where the specified predicate is true.
    ///
    /// - Precondition: None.
    /// - Postcondition: The given token is added before each letter where the predicate is true.
    /// - Parameters:
    ///    - token: The token to add before each letter where predicate is true.
    ///    - predicate: The evaluation to perform on the `String`.
    /// - Returns: The `String` with the given token added before each letter where predicate is true.
    func add(_ token: String, before predicate: (Iterator.Element) throws ->
                Bool) rethrows -> String {
        
        return try self
            .split(where: predicate)
            .map{String($0)}
            .joined(separator: token)
    }
}
