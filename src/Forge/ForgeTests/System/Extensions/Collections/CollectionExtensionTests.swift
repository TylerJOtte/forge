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
    
    //-------------------------------------------------------------------------//
    //                              containsOnly()                             //
    //-------------------------------------------------------------------------//
    
    //                        //
    // With Empty Collections //
    //                        //
    
    // Both Empty //
    // ~~~~~~~~~~ //
    
    /// Tests that an empty `Collection` does not only contain the `Element`s of another empty
    /// `Collection`.
    func test_containsOnly_withEmptyCollections_false() throws {
        
        // Given
        let collection1: [Card] = []
        let collection2: [Card] = []
        
        // When/Then
        XCTAssertFalse(collection1.contains(only: collection2))
    }
    
    // Empty Base //
    // ~~~~~~~~~~ //
    
    /// Tests that an empty `Collection` does not only contain the `Element`s of another
    /// `Collection`.
    func test_containsOnly_withEmptyBaseAndCollection_false() throws {
        
        // Given
        let collection1: [Card] = []
        let collection2 = [Card(), Card(), Card()]
        
        // When/Then
        XCTAssertFalse(collection1.contains(only: collection2))
    }
    
    // Empty Other //
    // ~~~~~~~~~~~ //
    
    /// Tests that `Collection` does not only contain the `Element`s of another empty
    /// `Collection`.
    func test_containsOnly_withBaseAndEmptyCollection_false() throws {
        
        // Given
        let collection1 = [Card(named: "Card 1"), Card(named: "Card 2")]
        let collection2: [Card] = []
        
        // When/Then
        XCTAssertFalse(collection1.contains(only: collection2))
    }
    
    //               //
    // With Elements //
    //               //
    
    // With One Element //
    // ~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` with only one `Element` contains only a given `Collection` of
    /// `Element`s where each `Element` equals the base `Collection`'s only `Element`.
    func test_containsOnly_withOneElementBaseAndEqualElements_true() throws {
        
        // Given
        let element = Card()
        let collection1 = [element]
        let collection2 = [element, element]
        
        // When/Then
        XCTAssert(collection1.contains(only: collection2))
    }
    
    /// Tests that a `Collection` with only one `Element` does not only contain a given
    /// `Collection` of various `Element`s.
    func test_containsOnly_withOneElementBaseAndVariousElements_false() throws {
        
        // Given
        let element1 = Card(named: "Card 1")
        let element2 = Card(named: "Card 2")
        let collection1 = [element1]
        let collection2 = [element1, element2]
        
        // When/Then
        XCTAssertFalse(collection1.contains(only: collection2))
    }
    
    // With Various Elements //
    // ~~~~~~~~~~~~~~~~~~~~~ //
    
    /// Tests that a `Collection` with various `Element`s contains only a given `Collection` of
    /// `Element`s where each `Element` equals one of the base `Collection`'s  `Element`s.
    func test_containsOnly_withVariousElementsBaseAndEqualElements_true()
        throws {
        
        // Given
        let element1 = Card(named: "Card 1")
        let element2 = Card(named: "Card 2")
        let collection1 = [element1, element2]
        let collection2 = [element1, element2, element1, element2]
        
        // When/Then
        XCTAssert(collection1.contains(only: collection2))
    }
    
    /// Tests that a `Collection` with various `Element`s does not only contain a given
    /// `Collection` where not all `Element`s equal an `Element` in the base `Collection`.
    func test_containsOnly_withVariousElementsBaseAndInequalElements_false()
        throws {
        
        // Given
        let element1 = Card(named: "Card 1")
        let element2 = Card(named: "Card 2")
        let element3 = Card(named: "Card 3")
        let collection1 = [element1, element2]
        let collection2 = [element1, element2, element3]
        
        // When/Then
        XCTAssertFalse(collection1.contains(only: collection2))
    }
}
    
