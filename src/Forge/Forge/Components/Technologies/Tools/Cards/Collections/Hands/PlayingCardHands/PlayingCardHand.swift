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
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a`PlayingCardHand`with the given `Card`s and specified `max`.
    ///
    /// - Precondition:
    ///   - `max` must be  >= 1.
    ///   - The # of given `Card`s must be &lt;= `max`.
    /// - Postcondition:
    ///   - The `Hand` can hold zero to given max `Card`s.
    ///   - The `Hand` contains the given `Card`s.
    /// - Parameters:
    ///   - cards: The `Card`s to create `Hand` with.
    ///   - max: The maximum # of `Card`s allowed in the `Hand`.
    /// - Throws:
    ///   - `RangeError.invalidMax` if the given max is &lt; one.
    ///   - `ElementsError.insufficientElements` if the # of given `Card`s > specified max.
    init(of cards: [PlayingCard], with max: Int = Int.max) throws {
        
        try super.init(of: cards, with: max)
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 Getters                                 //
    //-------------------------------------------------------------------------//

    /// Retrieves all the `Kind`s in the `Hand`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A collection of `Kind`s.
    public func getKinds() -> [Kind] {
        
        // TODO: implement stub
        
        return []
    }
    
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
    public func getFlush() -> Flush! {
        
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
