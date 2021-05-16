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
    
    /// The primary name
    var title: String {
        
        let model = String(describing: type(of: self))
            
        return model.splitOnCapitals()
    }
}
