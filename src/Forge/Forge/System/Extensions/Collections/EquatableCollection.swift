//=============================================================================//
//                                                                             //
//  EquatableCollection.swift                                                  //
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


/// An extension for common `Equatable Collection` operations.
extension Collection where Element: Equatable {

    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//

    
    /// Retrieves the # of `Element`s that equal the given `Element`.
    ///
    /// - Parameter element: The `Element` to compare to.
    /// - Returns: An interge representing the total count of the given `Element`.
    func getCount(of element: Element) -> Int {
        
        return self.filter({$0 == element}).count
    }
    
    //=========================================================================//
    //                                  ADDERS                                 //
    //=========================================================================//
    
    /// Adds  an `Element Array` to the given `Element Collection` for each of the latter's
    /// collections consistening of all but the last `Element` in the `Collection` along with the
    /// specified unique `Element`, starting from the `Element` at the given position..
    ///
    /// - Precondition: None.
    /// - Postcondition: The given `Element`s contains 0..* new `Element Array`s.
    /// - Parameters:
    ///   - position: The index position to start from.
    ///   - element: The unique `Element` to add to end of new `Element` array.
    ///   - elements: The `Element Array`s to get unique values in for new `Element Array`.
    func addBases(from position: Int, with element: Element,
                  to elements: inout [[Element]]) {
        
        let startIndex = 0

        for index in position..<elements.count {
            
            let endIndex = elements[index].count - 2
            let getBaseElements = endIndex >= 0
            let getPreviousBaseElements = getBaseElements && index > position
            
            let previousBase = getPreviousBaseElements ?
                elements[index - 1][startIndex...endIndex] : []
            
            var base = getBaseElements ?
                elements[index][startIndex...endIndex] : []
 
            if (base.last != previousBase.last || base.isEmpty) {
                
                base.append(element)
                elements.append(Array(base))
                
            }
        }
    }
}
