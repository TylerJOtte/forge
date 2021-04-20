//=============================================================================//
//                                                                             //
//  Suit.swift                                                                 //
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

/// A color-coded symbol.
public enum Suit: String, Depiction {// Hashable {
    
    case null
    case clubs
    case diamonds
    case hearts
    case spades
    case stars
//    //=========================================================================//
//    //                                ATTRIBUTES                               //
//    //=========================================================================//
//
//    /// The `Symbol`'s hue.
//    public let color: Color
//
//    /// The  icon.
//    public let symbol: Symbol
//
//    public func hash(into hasher: inout Hasher) {
//             hasher.combine(ObjectIdentifier(self).hashValue)
//        }
//
//    //=========================================================================//
//    //                               CONSTRUCTORS                              //
//    //=========================================================================//
//
//    /// Creates a `Suit` with the given `Color` and specified `Symbol`.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition:
//    ///   - The `Suit`'s `Color` is set to the given `Color`.
//    ///   - The `Suit`'s `Symbol` is set to the given `Symbol`.
//    /// - Parameters:
//    ///   - color: The `Symbol`'s hue.
//    ///   - symbol: The icon.
//    public init(_ color: Color, _ symbol: Symbol) {
//
//        self.color = color
//        self.symbol = symbol
//    }
//
//    //=========================================================================//
//    //                                 METHODS                                 //
//    //=========================================================================//
//
//    /// Determines if the given `Suit`s are equal.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Parameters:
//    ///   - lhs: The value to compare against.
//    ///   - rhs: The value to compare to.
//    /// - Returns: True if the given `Suit`s are equal, else false.
//    public static func == (lhs: Suit, rhs: Suit) -> Bool {
//
//        return lhs.color == rhs.color && lhs.symbol == rhs.symbol
//    }
}
