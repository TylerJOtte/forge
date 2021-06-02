//=============================================================================//
//                                                                             //
//  PlayingCardArray.swift                                                     //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/02/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//


/// An extension for common `PlayingCard Array` operations.
extension Array where Element: PlayingCard  {

    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if all the `Card`s in the given collection contain the same`Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if all the `Card`s in the given collection contain the same`Suit`, else false.
    func areEquallySuited() -> Bool {
        
        return splitBySuit().count == 1
    }
    
    /// Splits all the `Card`s in the given collection by `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A dictionary with the `Suit`s as keys and their respective `Card`s as the values.
    func splitBySuit() -> [Suit:[PlayingCard]] {
        
        return Dictionary(grouping: self, by: {$0.suit})
    }
}
