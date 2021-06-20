//=============================================================================//
//                                                                             //
//  CharacterExtensionTests.swift                                              //
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

/// Unit tests for a `Character extension`.
class CharacterExtensionTests: XCTestCase {
 
    //=========================================================================//
    //                                TESTERS                                  //
    //=========================================================================//
    
    //-------------------------------------------------------------------------//
    //                             isUppercased()                              //
    //-------------------------------------------------------------------------//
    
    /// Tests that an an uppercased character is uppercased.
    func test_isUppercased_withUppercasedCharacter_true() throws {
        
        // Given
        let character: Character = "A"
        
        // When/Then
        XCTAssert(character.isUppercased)
    }
    
    /// Tests that an a lowercased character is not uppercased.
    func test_isUppercased_withLowercasedCharacter_false() throws {
        
        // Given
        let character: Character = "a"
        
        // When/Then
        XCTAssertFalse(character.isUppercased)
    }
}
    
