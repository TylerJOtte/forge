//=============================================================================//
//                                                                             //
//  PlayingCardRank.swift                                                      //
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
import SwiftUI

/// A `PlayingCard Rank` extension.
extension Rank {
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if the `Rank` is equal to the given `Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter rank: The `Rank` to compare to.
    /// - Returns: True if the `Rank` is equal to the given `Rank`, else false.
    func equals(_ rank: Rank) -> Bool {
        
        return self == rank || (self == .ace && rank == .one) ||
            (self == .one && rank == .ace)
    }
    
    /// Determines if the `Rank` is a numeric `PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a numeric `PlayingCard Rank`, else false.
    func isNumericRank() -> Bool {
        
        return self == .ace || self.isNumeric()
    }
    
    /// Determines if the `Rank` is a face `PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a face`PlayingCard Rank`, else false.
    func isFaceCardRank() -> Bool {
        
        return self == .jack || self == .queen || self == .king
    }
    
    /// Determines if the `Rank` is a standard French-suited`PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a standard French-suited`PlayingCard Rank`, else false.
    func isStandard() -> Bool {
        
        return isNumericRank() || isFaceCardRank()
    }
    
    /// Determines if the `Rank` is a standard `PlayingCard Rank`, and the given `Suit` is a
    /// standard `PlayingCard Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter suit: The color-coded `Symbol` to test with the `Rank`.
    /// - Returns: True if the `Rank` is a standard `PlayingCard Rank`, and the given `Suit` is a
    ///   standard `PlayingCard Suit`, else false.
    func isStandard(for suit: Suit) -> Bool {
        
        return isStandard() && suit.isStandard()
    }
    
    /// Determines if the `Rank` is a valid `PlayingCard Rank` for the given `Suit`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter suit: The color-coded `Symbol` to test with the `Rank`.
    /// - Returns: True if the `Rank` is a valid `PlayingCard Rank` for the given `Suit`, else false.
    func isValid(for suit: Suit?) -> Bool {
        
        return (self == .joker && suit == nil) || isStandard(for: suit!)
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    /// Retrieves the standard French-suited `PlayingCard` points for the `Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: The standard French-suited `PlayingCard` points for the `Rank`.
    func getPoints() -> Int {
        
        var points: Int
        
        if (self == .ace) {
            
            points = 1
        
        } else if (self.isNumeric()) {
            
            points = self.rawValue
        
        } else if (self.isFaceCardRank()) {
            
            points = 10
        
        } else {
            
            points = 0
        }
        
        return points
    }
    
    /// Retrieves the standard French-suited `PlayingCard` title for the`Rank`,  given`Suit` & `Color`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - suit: The color-coded `Symbol`.
    ///   - color: The primary `Color`.
    /// - Returns: The standard French-suited `PlayingCard` title for the`Rank`,  given`Suit` &
    ///  `Color`.
    func getTitle(for suit: Suit?, _ color: Color) -> String {
        
        var title: String
        
        if (self == .joker) {
            
            title =  "\(color) \(self)"
        
        } else if (self == .ace || self == .one) {
            
            title = "Ace of \(suit!.symbol)s"
        
        } else {
            
           title = "\(self) of \(suit!.symbol)s"
        }
        
        return title
    }
}
