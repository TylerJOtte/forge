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
public class Card: Tool, Comparable {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The primary name.
    public let title: String
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a `Card` with the given title.
    ///
    /// - Precondition: None.
    /// - Postcondition: The `Card`s title is set to the given title.
    /// - Parameter title: The primary name.
    public init(_ title: String) {
        
        self.title = title
    }
    
    //=========================================================================//
    //                                 METHODS                                 //
    //=========================================================================//
    
    /// Determines if the `Card` is  less than the  given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to compare against.
    /// - Returns: True if the `Card` is  less than the  given `Card`.
    func isLessThan(_ card: Card) -> Bool {

        print("------------------------")
        print("Card is less than")
        print("------------------------")
        
        return title < card.title
    }
    
    /// Determines if the `Card` is  equal to the  given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to compare against.
    /// - Returns: True if the `Card` is equal to the  given `Card`.
    func equals(_ card: Card) -> Bool {

        print("------------------------")
        print("Card equals")
        print("------------------------")
        
        return title == card.title
    }
    
    /// Determines if the `Card` is  greater  than the  given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to compare against.
    /// - Returns: True if the `Card` is  greater than the  given `Card`.
    func isGreaterThan(_ card: Card) -> Bool {

        print("------------------------")
        print("Card is greater than")
        print("------------------------")
        
        return title > card.title
    }
    
    //-------------------------------------------------------------------------//
    //                               Operators                                 //
    //-------------------------------------------------------------------------//
    
    /// Determines if the given left-handside `Card` is less than the specified right-handside `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Card` to compare against.
    ///   - rhs: The `Card` to compare to.
    /// - Returns: True if given left-handside `Card` is less than the specified right-handside `Card`.
    public static func < (lhs: Card, rhs: Card) -> Bool {

        print("------------------------")
        print("Card <")
        print("------------------------")
        
        return lhs.isLessThan(rhs)
    }

    /// Determines if the given left-handside `Card` is equal to the specified right-handside `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Card` to compare against.
    ///   - rhs: The `Card` to compare to.
    /// - Returns: True if given left-handside `Card` is equal to the specified right-handside `Card`.
    public static func == (lhs: Card, rhs: Card) -> Bool {

        print("------------------------")
        print("Card == ")
        print("------------------------")
        
        return lhs.equals(rhs)
    }
    
    /// Determines if the given left-handside `Card` is greater than the specified right-handside `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Card` to compare against.
    ///   - rhs: The `Card` to compare to.
    /// - Returns: True if given left-handside `Card` is greater than the specified right-handside `Card`.
    public static func > (lhs: Card, rhs: Card) -> Bool {

        print("------------------------")
        print("Card >")
        print("------------------------")
        
        return lhs.isGreaterThan(rhs)
    }
}
