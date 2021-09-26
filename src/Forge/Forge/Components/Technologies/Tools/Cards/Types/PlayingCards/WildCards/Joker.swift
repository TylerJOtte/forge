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

/// A standard French-suited `joker Rank`ed `PlayingCard`.
public class Joker: PlayingCard {

    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//

    /// The primary `Color`.
    public let color: Color

    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//

    /// Creates a `joker` with the given terms.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Card`'s `Color` is to the given `Color`.
    ///   - The `Card`'s `Rank` is set to `joker`.
    ///   - The `Card`'s `Suit` is set to `null`.
    ///   - The `Card`'s points are set to 0.
    ///   - The `Card`'s title is set to "`{Color}` Joker".
    /// - Parameter color: The primary `Color`.
    public init(color: Color) {

        let rank = Rank.joker
        let points = 0
        let position = 0
        let title = "\(color) \(rank)".capitalized

        self.color = color

        super.init(rank, worth: points, at: position, with: title)
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the `Card` equals the given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Card` to compare to.
    /// - Returns: True if the `Card` equals the given `Card`, else false.
    public override func equals(_ rhs: Card) -> Bool {
        
        var equals = false
        
        if let card = rhs as? Joker {
            
            equals = rank == card.rank && color == card.color
        }
        
        return equals
    }
}
