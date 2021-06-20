//=============================================================================//
//                                                                             //
//  SequenceExtension.swift                                                    //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/01/21.                                       //
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

/// An extension for common `Sequence` operations.
extension Sequence {
    
    /// Splits the `Sequence` before each element where the given predicate is ture.
    ///
    /// - Precondition: None.
    /// - Postcondition: The `Sequence` is split  before each element where predicate is true.
    /// - Parameter predicate: The evalation to determine where to split `Sequence` elements.
    /// - Throws: `Error` if `Sequence` is unable to split elements using the given predicate.
    func split(where predicate: (Iterator.Element) throws -> Bool)
        rethrows -> [AnySequence<Iterator.Element>] {
        
            var result: [AnySequence<Iterator.Element>] = []
            var subSequence: [Iterator.Element] = []
            var iterator = self.makeIterator()
            
            while let element = iterator.next() {
                
                if try predicate(element) {
                    
                    if !subSequence.isEmpty {
                        result.append(AnySequence(subSequence))
                    }
                    
                    subSequence = [element]
                }
                else {
                    subSequence.append(element)
                }
            }
            
            result.append(AnySequence(subSequence))
            
            return result
        }
}

