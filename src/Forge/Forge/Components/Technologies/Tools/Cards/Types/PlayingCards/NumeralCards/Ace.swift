//=============================================================================//
//                                                                             //
//  Ace.swift                                                                  //
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

/// A standard French-suited ace `PlayingCard`.
public class Ace: NumeralCard {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// True if is the high `Card`, else false.
    public let isHigh: Bool
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates an`Ace` with the given terms.
    ///
    /// - Precondition: The given `Suit` must be `clubs`, `diamonds`, `hearts`, or
    ///  `spades`.
    /// - Postcondition:
    ///   - The `Card`s `Rank`is set to `ace`.
    ///   - The `Card`s `Suit` is set to the given `Suit`.
    ///   - The `Card`s points are set to one.
    ///   - The `Card`s title is set to `Ace` of `{Suit}`.
    ///   - The `Card`s `Color` is set to
    ///      - `red` if the if the specified `Suit` is `hearts` or `diamonds`, or
    ///      - `black` if the the specified `Suit` is `clubs` or `spades`.
    ///   - The `Card`'s `isHigh` status is set to the given `high` status.
    /// - Parameters:
    ///   - suit: The symbol grouping.
    ///   - high: True if the `ace` is the high `Card`, else false.
    /// - Throws:
    ///   -  `FeatureError.invalidSuit`  if the given `Suit` is not `clubs`,
    ///   `diamonds`, `hearts`, or `spades`.
    public init(of suit: Suit = .hearts, is high: Bool = false) throws {
        
        guard (suit.isStandard()) else {
            
            print("The given Suit must be clubs, diamonds, hearts, or spades.")
            throw FeatureError.invalidSuit
        }
        
        self.isHigh = high
        
        try super.init(.ace, of: suit)
    }
 
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the `Element` is  less than the  given `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Element` to compare against.
    /// - Returns: True if the `Element` is  less than the  given `Element`.
    override func isLessThan(_ element: Element) -> Bool {

        return (element as? PlayingCard).map{ card in
            
            return !isHigh && !(card is Ace)
            
        } ?? false
    }
    
    /// Determines if the `Element` is  greater  than the  given `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Element` to compare against.
    /// - Returns: True if the `Element` is  greater than the  given `Element`.
    override func isGreaterThan(_ element: Element) -> Bool {

        return (element as? PlayingCard).map{ card in
            
            return isHigh && !(card is Ace)
            
        } ?? false
    }
}
