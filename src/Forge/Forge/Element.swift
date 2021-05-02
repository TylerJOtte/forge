//=============================================================================//
//                                                                             //
//  Element.swift                                                              //
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

import Foundation

/// A game `Element`.
public class Element: Comparable {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The primary name.
    public let title: String
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a default `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: The `Element`'s title is set to the name of the model.
    public init() {
        
        let modelName = String(describing: type(of: self))
        let title = modelName.splitOnCapitals()
        
        self.title = title
    }
    
    /// Creates an `Element` with the given title.
    ///
    /// - Precondition: None.
    /// - Postcondition: The `Element`s title is set to the given title.
    /// - Parameter title: The primary name.
    public init(named title: String) {
        
        self.title = title
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
    func isLessThan(_ element: Element) -> Bool {

        return title < element.title
    }
    
    /// Determines if the `Element` is  equal to the  given `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Element` to compare against.
    /// - Returns: True if the `Element` is equal to the  given `Element`.
    func equals(_ element: Element) -> Bool {

        return title == element.title
    }
    
    /// Determines if the `Element` is  greater  than the  given `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Element` to compare against.
    /// - Returns: True if the `Element` is  greater than the  given `Element`.
    func isGreaterThan(_ element: Element) -> Bool {

        return title > element.title
    }
    
    //-------------------------------------------------------------------------//
    //                               Operators                                 //
    //-------------------------------------------------------------------------//
    
    /// Determines if the given left-handside `Element` is less than the specified right-handside
    /// `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Element` to compare against.
    ///   - rhs: The `Element` to compare to.
    /// - Returns: True if given left-handside `Element` is less than the specified right-handside
    ///            `Element`.
    public static func < (lhs: Element, rhs: Element) -> Bool {
        
        return lhs.isLessThan(rhs)
    }

    /// Determines if the given left-handside `Element` is equal to the specified right-handside
    /// `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Element` to compare against.
    ///   - rhs: The `Element` to compare to.
    /// - Returns: True if given left-handside `Element` is equal to the specified right-handside
    ///            `Element`.
    public static func == (lhs: Element, rhs: Element) -> Bool {
        
        return lhs.equals(rhs)
    }
    
    /// Determines if the given left-handside `Element` is greater than the specified right-handside
    /// `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Element` to compare against.
    ///   - rhs: The `Element` to compare to.
    /// - Returns: True if given left-handside `Element` is greater than the specified right-handside
    ///            `Element`.
    public static func > (lhs: Element, rhs: Element) -> Bool {

        return lhs.isGreaterThan(rhs)
    }
}

