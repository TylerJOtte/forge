//=============================================================================//
//                                                                             //
//  StringSubSequenceExtensionTests.swift                                      //
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

import Foundation
import XCTest
@testable import Forge

/// Unit tests for a `String.SubSequence extension`.
class StringSubSequenceExtensionTests: XCTestCase {
 
    //=========================================================================//
    //                                SPLITTERS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                            splitOnCapitals()                            //
    //-------------------------------------------------------------------------//

    /// Tests that splitting on the capitals with a titlecased `String.SubSequence` returns a `String`
    /// with a space before each capital letter by default.
    func test_splitOnCapitals_withTitlecasedValue_hasSpacesPreCapitals() {
        
        // Given
        let subSequence: String.SubSequence = "FourOfAKind"
        let expected = "Four Of A Kind"
        
        // When
        let actual = subSequence.splitOnCapitals()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting on the capitals with a titlecased `String.SubSequence` and a token returns a
    /// `String` with the given token before each capital letter.
    func test_splitOnCapitals_withTitlecasedValueAndToken_hasTokenPreCapitals() {
        
        // Given
        let subSequence: String.SubSequence = "FourOfAKind"
        let token = "-"
        let expected = "Four-Of-A-Kind"
        
        // When
        let actual = subSequence.splitOnCapitals(using: token)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting on the capitals with a lowercased `String.SubSequence` returns a `String`
    /// without any spaces.
    func test_splitOnCapitals_withLowercasedValue_hasNoSpaces() {
        
        // Given
        let subSequence: String.SubSequence = "doublerun"
        let expected = "doublerun"
        
        // When
        let actual = subSequence.splitOnCapitals()
        
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    /// Tests that splitting on the capitals with a lowercased `String.SubSequence` and a token returns
    /// a `String` without the given token inserted .
    func test_splitOnCapitals_withLowercasedValueAndToken_hasNoToken() {
        
        // Given
        let subSequence: String.SubSequence = "doublerun"
        let token = "-"
        let expected = "doublerun"
        
        // When
        let actual = subSequence.splitOnCapitals(using: token)
         
        // Then
        XCTAssertEqual(expected, actual)
    }
    
    //=========================================================================//
    //                                   ADDERS                                //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                                    add()                                //
    //-------------------------------------------------------------------------//

    /// Tests that adding a space before each captial letter in a`String.SubSequence` returns a
    /// `String` with a space before each capital letter.
    func test_add_withTokenAndIsUppercasedPredicate_hasSpacesPreCapitals()
        throws {
        
        // Given
        let subSequence: String.SubSequence = "FourOfAKind"
        let token = " "
        let predicate: (String.Iterator.Element) throws -> Bool =
                       {$0.isUppercased}
        let expected = "Four Of A Kind"
        
        // When
        let actual = try subSequence.add(token, before: predicate)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
