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
public protocol Element {

}

/// Default implementations for a game `Element`.
extension Element {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The primary name
    var title: String {
        
        let name = isClass() ? getMetatypeName() : getInstanceName()
        let shortName = getShortname(from: name)
        
        return shortName.splitOnCapitals()
    }
    
    //=========================================================================//
    //                                  TESTERS                                //
    //=========================================================================//
    
    /// Determines if the current instance is a `Class Type`.
    ///
    /// - Returns: True if the given instance is a `Class Type`, else false.
    private func isClass() -> Bool {
        
        return type(of: self) is AnyClass
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    /// Retrieves the name of the instance.
    ///
    /// - Parameter capitalized: True if return the instance name as capitalized, else false.
    /// - Returns: A `String` containing the name of the instance.
    private func getInstanceName(_ capitalized: Bool = true) -> String {
        
        let instanceName = String(describing: self)
        
        return capitalized ? instanceName.capitalized : instanceName
    }
    
    /// Retrieves the name of the model.
    ///
    /// - Returns: A `String` containing the name of the model.
    private func getMetatypeName() -> String {
        
        return String(describing: type(of: self))
    }
    
    /// Retrieves a version of the given name without extra syntax (e.g., generic parameters), if any.
    ///
    /// - Parameter name: The name to get shortname for.
    /// - Returns: A `String.SubSequence` of the given name without extra syntax, if any.
    private func getShortname(from name: String) -> String.SubSequence {
        
        return name.split(separator: "<").first ?? ""
    }
}
