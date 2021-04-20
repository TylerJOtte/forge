//=============================================================================//
//                                                                             //
//  Joker.swift                                                                //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/19/21.                                       //
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
import SwiftUI

/// A standard French-suited joker `PlayingCard`.
public class Joker: FaceCard {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`Joker` with the given `Color`.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Card`s `Rank` is set to ` Joker`.
    ///   - The `Card`s `Suit` is set to nil.
    ///   - The `Card`s points are set to 0.
    ///   - The `Card`s title is set to "`Color Joker`.
    ///   - The `Card`s `Color` is set to the given `Color`.
    /// - Parameter color: The primary `Color`.
    public init(color: Color = Color.red) throws {
        
        try super.init(.joker, of: .null)
    }
}
