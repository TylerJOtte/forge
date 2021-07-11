//=============================================================================//
//                                                                             //
//  Element.swift                                                              //
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

/// A game `Element`.
public protocol Element: Hashable {

}

/// Default implementations for a game `Element`.
extension Element {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The primary name
    var title: String {
        
        let name = isClass() ? getMetatypeName() : getInstanceName()
        let shortName = getShortname(from: name)! // Okay to force unwrap this as
                                                  // instance or metatype name
                                                  // will never be nil.
        
        return shortName.splitOnCapitals()
    }
    
    //=========================================================================//
    //                                  TESTERS                                //
    //=========================================================================//
    
    /// Determines if the current instance is a `Class Type`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the given instance is a `Class Type`, else false.
    private func isClass() -> Bool {
        
        return type(of: self) is AnyClass
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    /// Retrieves the name of the instance, capitalized.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A `String` containing the name of the instance, capitalized.
    private func getInstanceName() -> String {
        
        return String(describing: self).capitalized
    }
    
    /// Retrieves the name of the model.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A `String` containing the name of the model.
    private func getMetatypeName() -> String {
        
        return String(describing: type(of: self))
    }
    
    /// Retrieves a version of the given name without extra syntax (e.g., generic parameters), if any.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter name: The name to get shortname for.
    /// - Returns: A `String.SubSequence` of the given name without extra syntax, if any.
    private func getShortname(from name: String) -> String.SubSequence? {
        
        return name.split(separator: "<").first
    }
    
    //=========================================================================//
    //                                 HASHERS                                 //
    //=========================================================================//
    
    /// *Note: The following documentation is taken directly from Apple's official `Hashable protocol`.
    /// 
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        
        hasher.combine(title)
    }
}
