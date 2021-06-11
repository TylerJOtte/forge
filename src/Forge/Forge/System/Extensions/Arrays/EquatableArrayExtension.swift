//=============================================================================//
//                                                                             //
//  EquatableArrayExtension.swift                                              //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/06/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//


/// An extension for common `Equatable Array` operations.
extension Array where Element: Equatable {

    /// Adds  an `Element Array` to the given `Element Collection` for each of the latter's
    /// collections consistening of all but the last `Element` in the `Collection` along with the
    /// specified unique `Element`.
    ///
    /// - Precondition: None.
    /// - Postcondition: The given `Element`s contains 0..* new `Element Array`s.
    /// - Parameters:
    ///   - element: The unique `Element` to add to end of new `Element` array.
    ///   - elements: The `Element Array`s to get unique values in for new `Element Array`.
    func addBases(with element: Element, to elements: inout [[Element]]) {
        
        let startIndex = 0
        let endIndex = (elements.last?.count ?? 0) - 2
        let getBaseElements = endIndex >= 0
        
        for index in 0..<elements.count {
            
            let getPreviousBaseElements = getBaseElements && index > 0
            
            let previousBase = getPreviousBaseElements ?
                elements[index - 1][startIndex...endIndex] : []
            
            var base = getBaseElements ?
                elements[index][startIndex...endIndex] : []
 
            if (base.last != previousBase.last) {
                
                base.append(element)
                elements.append(Array(base))
            }
        }
    }
}
