//=============================================================================//
//                                                                             //
//  Rank.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/02/21.                                       //
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

/// A hierarchical position.
public enum Rank: Int, Description {
    
    //=========================================================================//
    //                                 ATTRIBUTES                              //
    //=========================================================================//
    
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
    case joker
    case bishop
    case knight
    
    //=========================================================================//
    //                                  TESTERS                                //
    //=========================================================================//

    /// Determines if the `Rank` is a raw value between the given range.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - min: The minimum raw value to include.
    ///   - max: The maximum raw value to include.
    /// - Returns: True if the`Rank` is a numeric `Rank` between the given range, else false.
    internal func hasRawValue(from min: Int, to max: Int) -> Bool {

        return self.rawValue >= min && self.rawValue <= max
    }
    
    //=========================================================================//
    //                                 HASHERS                                 //
    //=========================================================================//
    
    /// *Note: The following documentation is taken directly from Apple's official `Hashable protocol`.
    ///
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        
        hasher.combine(self.rawValue)
    }
}
