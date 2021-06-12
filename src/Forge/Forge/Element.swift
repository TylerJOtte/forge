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
        
        return getModelShortname().splitOnCapitals()
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    /// Retrieves the name of the model.
    ///
    /// - Returns: A `String` containing the name of the model.
    private func getModelName() -> String {
        
        return String(describing: type(of: self))
    }
    
    /// Retrieves the name of the model without the trailing parameter syntax, if any.
    ///
    /// - Returns: A `String.SubSequence` of the model name without the extra syntax.
    private func getModelShortname() -> String.SubSequence {
        
        // Okay to force unwrap as this will never be null.
        // Eevery module has to have a name.
        return getModelName().split(separator: "<").first!
    }
}
