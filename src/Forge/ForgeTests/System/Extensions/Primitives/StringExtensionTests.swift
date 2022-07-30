//=============================================================================//
//                                                                             //
//  StringExtensionTests.swift                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/20/21.                                       //
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

/// Unit tests for a `String extension`.
class StringExtensionTests: XCTestCase {
 
    //=========================================================================//
    //                                SPLITTERS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                            splitOnCapitals()                            //
    //-------------------------------------------------------------------------//

    /// Tests that splitting on the capitals with a titlecased `String` returns a `String` with a space
    ///  before each capital letter by default.
    func test_splitOnCapitals_withTitlecasedValue_hasSpacesPreCapitals() {
        
        // Given
        let name = "FourOfAKind"
        let expected = "Four Of A Kind"
        
        // When
        let actual = name.splitOnCapitals()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting on the capitals with a titlecased `String` and a token returns a `String` with
    ///  the given token before each capital letter.
    func test_splitOnCapitals_withTitlecasedValueAndToken_hasTokenPreCapitals() {
        
        // Given
        let name = "FourOfAKind"
        let token = "-"
        let expected = "Four-Of-A-Kind"
        
        // When
        let actual = name.splitOnCapitals(using: token)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting on the capitals with a lowercased `String` returns a `String` without any
    ///  spaces.
    func test_splitOnCapitals_withLowercasedValue_hasNoSpaces() {
        
        // Given
        let name = "doublerun"
        let expected = "doublerun"
        
        // When
        let actual = name.splitOnCapitals()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting on the capitals with a lowercased `String` and a token returns a `String`
    /// without the given token inserted .
    func test_splitOnCapitals_withLowercasedValueAndToken_hasNoToken() {
        
        // Given
        let name = "doublerun"
        let token = "-"
        let expected = "doublerun"
        
        // When
        let actual = name.splitOnCapitals(using: token)
         
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                                   ADDERS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                    add()                                //
    //-------------------------------------------------------------------------//

    /// Tests that adding a space before each captial letter in a titlecased `String` returns a `String`
    /// with a space before each capital letter.
    func test_add_spacesToTitlecasedValueBeforeCapitals_hasSpacesPreCapitals()
        throws {
        
        // Given
        let name = "FourOfAKind"
        let token = " "
        let predicate: (String.Iterator.Element) throws -> Bool =
                       {$0.isUppercased}
        let expected = "Four Of A Kind"
        
        // When
        let actual = try name.add(token, before: predicate)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that adding a space before each captial letter in a`String` that has no capital letters returns
    /// a `String` without spaces.
    func test_add_spacesToLowercasedValueBeforeCapitals_hasSpacesPreCapitals()
        throws {
        
        // Given
        let name = "doublerun"
        let token = " "
        let predicate: (String.Iterator.Element) throws -> Bool =
                       {$0.isUppercased}
        let expected = "doublerun"
        
        // When
        let actual = try name.add(token, before: predicate)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
