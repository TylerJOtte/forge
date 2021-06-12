//=============================================================================//
//                                                                             //
//  PlayingCardHand.swift                                                      //
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
import SwiftUI

/// A `Hand` of `PlayingCard`s.
public class PlayingCardHand: Hand {
    
    //-------------------------------------------------------------------------//
    //                                 Getters                                 //
    //-------------------------------------------------------------------------//

    /// Retrieves all the `Run`s in the `Hand`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A collection of `Run`s.
    public func getRuns() -> [Run] {
        
        // TODO: implement stub
        
        return []
    }
    
    /// Retrieves a `Flush` in the `Hand`, if any.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: An optional `Flush`.
    public func getFlush() -> Flush? {
        
        // TODO: implement stub
        
        return nil
    }
    
    //-------------------------------------------------------------------------//
    //                               Calculators                               //
    //-------------------------------------------------------------------------//
    
    /// Retrieves the `Hand`'s `Score`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The `Hand`'s `Score`.
    public func Count() -> HandScore {
        
        // TODO: implement stub
        
        return HandScore(with: [:])
    }
}
