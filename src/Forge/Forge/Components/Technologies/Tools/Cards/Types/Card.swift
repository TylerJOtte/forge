//=============================================================================//
//                                                                             //
//  Card.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 3/14/21.                                       //
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

/// A game `Card`.
public class Card: Tool, Relatable {

    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The primary name.
    public let title: String
    
    /// True if is cut `Card`, else false.
    public var isCutCard: Bool = false

    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a default `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: The `Card`s title is set to "Card".
    public init() {

        self.title = "Card"
    }
    
    /// Creates a `Card` with the given title.
    ///
    /// - Precondition: None.
    /// - Postcondition: The `Card`s title is set to the given title.
    /// - Parameter title: The primary name.
    public init(named title: String) {

        self.title = title
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Determines if the `Card` is less than the given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Card` to compare to.
    /// - Returns: True if the `Card` is less than the given {Model}, else false.
    public func isLessThan(_ rhs: Card) -> Bool {
        
        return title < rhs.title
    }
    
    /// Determines if the given left-handside`Card` is less than the specified right-handside `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Card` to compare against.
    ///   - rhs: The `Card` to compare to.
    /// - Returns: True if the left-handside`Card` is less than the right-handside `Card`, else false.
    public static func < (lhs: Card, rhs: Card) -> Bool {
        
        return lhs.isLessThan(rhs)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Determines if the `Card` equals the given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Card` to compare to.
    /// - Returns: True if the `Card` equals the given `Card`, else false.
    public func equals(_ rhs: Card) -> Bool {
        
        return title == rhs.title
    }
    
    /// Determines if the given left-handside`Card` equals the specified right-handside `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Card` to compare against.
    ///   - rhs: The `Card` to compare to.
    /// - Returns: True if the left-handside`Card` equals the right-handside `Card`, else false.
    public static func == (lhs: Card, rhs: Card) -> Bool {
        
        return lhs.equals(rhs)
    }
}
