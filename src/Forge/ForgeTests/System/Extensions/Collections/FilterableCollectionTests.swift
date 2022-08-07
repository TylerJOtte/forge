//=============================================================================//
//                                                                             //
//  FilterableCollection.swift                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 7/11/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//

import XCTest
@testable import Forge

/// Unit tests for a `Filterable Collection`.
class FilterableCollectionTests: XCTestCase {
 
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                         getUniqueSubElements()                          //
    //-------------------------------------------------------------------------//
    
    //                       //
    // With Empty Collection //
    //                       //
    
    /// Tests that retrieving the unique sub-`Element`s of an empty `Filterable Collection`
    /// returns an empty `Collection.`
    func test_getUniqueSubElements_withEmptyCollection_returnsEmpty() {
        
        // Given
        let collection: [Hand] = []
        
        // When
        let subElements = collection.getUniqueSubElements()
        
        // Then
        XCTAssert(subElements.isEmpty)
    }
    
    //                     //
    // With Empty Elements //
    //                     //
    
    /// Tests that retrieving the unique sub-`Element`s of a `Filterable Collection` with
    /// `Element`s that are all empty returns an empty `Collection.`
    func test_getUniqueSubElements_withEmptyElements_returnsEmpty() {
        
        // Given
        let collection = [Hand(), Hand(), Hand()]
        
        // When
        let subElements = collection.getUniqueSubElements()
        
        // Then
        XCTAssert(subElements.isEmpty)
    }
    
    //               //
    // With Elements //
    //               //
    
    /// Tests that retrieving the unique sub-`Element`s of a `Filterable Collection` where all
    /// sub-`Element`s are unqique returns all sub-`Element`s.
    func test_getUniqueSubElements_withAllUniqueSubElements_returnAllSubElements()
        throws {
        
        // Given
        let subElement1 = try Ace(of: .hearts)
        let subElement2 =  try Ace(of: .spades)
        let subElement3 = try Ace(of: .diamonds)
        let subElement4 = try Ace(of: .clubs)
        let subElement5 = try Two(of: .hearts)
        let subElement6 = try Two(of: .clubs)
        let subElements1: [RankedCard] = [subElement1, subElement2]
        let subElements2: [RankedCard]  = [subElement3, subElement4]
        let subElements3: [RankedCard]  = [subElement5, subElement6]
        let element1 = try Pair(of: subElements1)
        let element2 = try Pair(of: subElements2)
        let element3 = try Pair(of: subElements3)
        let collection: [HandRank<RankedCard>] = [element1, element2, element3]
        let expected = [subElement1, subElement2, subElement3, subElement4,
                        subElement5, subElement6]
        
        // When
        let actual = collection.getUniqueSubElements()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that retrieving the unique sub-`Element`s of a `Filterable Collection` where the
    /// `Element`s contain common sub-`Element`s returns only the expected values.
    func test_getUniqueSubElements_withCommonSubElements_returnsExpected()
        throws {
        
        // Given
        let subElement1 = try Ace(of: .hearts)
        let subElement2 =  try Ace(of: .spades)
        let subElement3 = try Ace(of: .hearts)
        let subElement4 = try Ace(of: .diamonds)
        let subElement5 = try Ace(of: .hearts)
        let subElement6 = try Ace(of: .clubs)
        let subElements1 = [subElement1, subElement2]
        let subElements2 = [subElement3, subElement4]
        let subElements3 = [subElement5, subElement6]
        let element1 = try Pair(of: subElements1)
        let element2 = try Pair(of: subElements2)
        let element3 = try Pair(of: subElements3)
        let collection = [element1, element2, element3]
        let expected = [subElement1, subElement2, subElement4, subElement6]
        
        // When
        let actual = collection.getUniqueSubElements()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
    
