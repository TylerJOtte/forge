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
public class Card: Tool {
    
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
    override func isLessThan(_ element: Element) -> Bool {
        
        return (element as? Card).map{ card in
            
            return title < card.title
            
        } ?? false
    }
    
    /// Determines if the `Element` is  equal to the  given `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Element` to compare against.
    /// - Returns: True if the `Element` is equal to the  given `Element`.
    override func equals(_ element: Element) -> Bool {
        
        
        return (element as? Card).map{ card in
            
            return title == card.title
            
        } ?? false
    }
    
    /// Determines if the `Element` is  greater  than the  given `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Element` to compare against.
    /// - Returns: True if the `Element` is  greater than the  given `Element`.
    override func isGreaterThan(_ element: Element) -> Bool {

        
        return (element as? Card).map{ card in
            
            return title > card.title
            
        } ?? false
    }
}
