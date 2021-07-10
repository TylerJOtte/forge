//=============================================================================//
//                                                                             //
//  CollectionExtensionTests.swift                                             //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 7/10/21.                                       //
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

/// Unit tests for a`Collection extension`.
class CollectionExtensionTests: XCTestCase {
 
    //=========================================================================//
    //                                 FILTERS                                 //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                 except()                                //
    //-------------------------------------------------------------------------//
    
    //                        //
    // With Empty Collections //
    //                        //
    
    // Both Empty //
    // ~~~~~~~~~~ //
    
    /// Tests that filtering an empty `Collection` for `Element`s  that don't exist in another empty
    /// `Collection` returns zero `Element`s.
    func test_except_withEmptyCollections_ReturnsZeroElements() {
        
        // Given
        let collection1: [Card] = []
        let collection2: [Card] = []
        let expected = 0
        
        // When
        let elements = collection1.except(collection2)
        let actual = elements.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Empty Base //
    // ~~~~~~~~~~ //
    
    /// Tests that filtering an empty `Collection` for `Element`s  that don't exist in another
    /// `Collection` returns zero `Element`s.
    func test_except_withEmptyBaseAndCollection_ReturnsZeroElements() {
        
        // Given
        let collection1: [Card] = []
        let collection2 = [Card(), Card(), Card()]
        let expected = 0
        
        // When
        let elements = collection1.except(collection2)
        let actual = elements.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Empty Other //
    // ~~~~~~~~~~~ //
    
    /// Tests that filtering a `Collection` for `Element`s  that don't exist in another empty
    /// `Collection` returns `Element`s with the base `Collection` count.
    func test_except_withBaseAndEmptyCollection_ReturnsElementsWithBaseCount()
        {
        
        // Given
        let collection1 = [Card(), Card(), Card()]
        let collection2: [Card] = []
        let expected = collection1.count
        
        // When
        let elements = collection1.except(collection2)
        let actual = elements.count
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //               //
    // With Elements //
    //               //
    
    // All Unique Elements //
    // ~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that filtering a `Collection` for `Element`s  that don't exist in another `Collection`
    /// where all `Element`s between the `Collection`s are unique returns the base `Collection`'s
    /// `Element`s.
    func test_except_withAllUniqueElements_ReturnsBaseElements() {
        
        // Given
        let element1 = Card(named: "Card 1")
        let element2 = Card(named: "Card 2")
        let element3 = Card(named: "Card 3")
        let element4 = Card(named: "Card 4")
        let collection1 = [element1, element2]
        let collection2 = [element3, element4]
        let expected = collection1
        
        // When
        let actual = collection1.except(collection2)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // Unique & Common Elements //
    // ~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that filtering a `Collection` for `Element`s  that don't exist in another `Collection`
    /// where each `Collection` contains unique and common `Element`s returns only the unique
    /// base `Collection Element`s.
    func test_except_withUniqueAndCommonElements_ReturnsUniqueBaseElements() {
        
        // Given
        let element1 = Card(named: "Card 1")
        let element2 = Card(named: "Card 2")
        let element3 = Card(named: "Card 3")
        let element4 = Card(named: "Card 4")
        let element5 = Card(named: "Card 5")
        let collection1 = [element1, element2, element3]
        let collection2 = [element3, element4, element5]
        let expected = [element1, element2]
        
        // When
        let actual = collection1.except(collection2)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    // All The Same Elements //
    // ~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that filtering a `Collection` for `Element`s  that don't exist in another `Collection`
    /// where all `Element`s between the `Collection`s are the same returns an empty
    /// `Collection`.
    func test_except_withAllSameElements_ReturnsEmptyCollection() {
        
        // Given
        let element1 = Card(named: "Card 1")
        let element2 = Card(named: "Card 2")
        let element3 = Card(named: "Card 3")
        let element4 = Card(named: "Card 4")
        let collection1 = [element1, element2, element3, element4]
        let collection2 = [element4, element3, element2, element1]
        
        // When
        let elements = collection1.except(collection2)
        
        // Then
        XCTAssert(elements.isEmpty)
    }
}
    
