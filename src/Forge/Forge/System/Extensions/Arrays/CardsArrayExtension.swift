//=============================================================================//
//                                                                             //
//  CardsArrayExtension.swift                                                       //
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


/// An extension for common `Cards Array` operations.
extension Array where Element: Cards {

    //=========================================================================//
    //                               CALCULATORS                               //
    //=========================================================================//
    
    /// Sums all the `Element`s' counts.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The sum of all the `Element`s' counts.
    func sumCounts() -> Int {
        
        return self.map{$0.count}.reduce(0, +)
    }
    
}
