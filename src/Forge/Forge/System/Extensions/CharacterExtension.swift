//=============================================================================//
//                                                                             //
//  CharacterExtension.swift                                                   //
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

/// An extension for common `Character` operations.
extension Character {
    
    /// True if instance is upercased, else false.
    var isUpperCased: Bool {
        
        return String(self) == String(self).uppercased()
    }
}
