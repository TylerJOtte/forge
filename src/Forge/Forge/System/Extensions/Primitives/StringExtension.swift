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

/// An extension for common `String SubSequence` operations.
extension String {

    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The `String` with the first letter capitalized.
    var firstUppercased: String {
        
        return prefix(1).uppercased() + dropFirst()
    }
    
    /// The `String`'s plural form.
    var plural: String {
        
        return last == "s" ? "\(self)" : "\(self)s"
    }
    
    //=========================================================================//
    //                                  ADDERS                                 //
    //=========================================================================//
    
    /// Adds the given token before each letter where the specified predicate is true.
    ///
    /// - Precondition: None.
    /// - Postcondition: The given token is added before each letter where the predicate is true.
    /// - Parameters:
    ///    - token: The token to add before each letter where the predicate is true.
    ///    - predicate: The evaluation to perform.
    /// - Returns: A `String` with the given token added before each letter where the predicate is true.
    func add(_ token: String, before predicate: (Iterator.Element) throws ->
             Bool) rethrows -> String {

        return try self
            .split(where: predicate)
            .map{String($0)}
            .joined(separator: token)
    }

    //=========================================================================//
    //                                COVERTERS                                //
    //=========================================================================//
    
    /// Splits on the capital letters using the given token.
    ///
    /// - Precondition: None.
    /// - Postcondition: The given token is added before each capital letter.
    /// - Parameter token: The token to add before each capital letter.
    /// - Returns: A `String` with the given token added before each capital letter.
    func splitOnCapitals(using token: String = " ") -> String {

        return add(token, before: {$0.isUppercased})
    }
}
