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

/// A game `Element`.
public protocol Element: Hashable {

}

/// Default implementations for a game `Element`.
extension Element {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The primary name.
    public var title: String {
        
        return getShortname().firstUppercased.splitOnCapitals()
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
    
    /// Retrieves the instance name (e.g., enum case name).
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A `String` containing the instance name..
    private func getInstanceName() -> String {
        
        return String(describing: self)
    }
    
    /// Retrieves the moduel name (e.g., class name).
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A `String` containing the module name.
    private func getMetatypeName() -> String {
        
        return String(describing: type(of: self))
    }
    
    /// Retrieves the module or instance name (e.g., class or enum case name).
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A `String` containing the module or instance name.
    private func getName() -> String {
        
        return isClass() ? getMetatypeName() : getInstanceName()
    }
    
    /// Retrieves the module or instance name (e.g., class or enum case name) without extra syntax
    /// (e.g., generic parameters)..
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A `String` containing the module or instance name without extra syntax.
    private func getShortname() -> String {
        
        return String(getName().split(separator: "<").first ?? "")
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
