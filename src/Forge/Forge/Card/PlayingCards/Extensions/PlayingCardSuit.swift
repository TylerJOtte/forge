//=============================================================================//
//                                                                             //
//  PlayingCardSuit.swift                                                      //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/03/21.                                       //
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

/// A `PlayingCard Suit` extension.
extension Suit {

    /// Determines if the `Suit` is a standard French-suited`PlayingCard Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Suit` is a standard French-suited`PlayingCard Suit`, else false.
    func isStandard() -> Bool {
        
        return self.symbol == .clover || self.symbol == .diamond ||
            self.symbol == .heart || self.symbol == .spade
    }
}
