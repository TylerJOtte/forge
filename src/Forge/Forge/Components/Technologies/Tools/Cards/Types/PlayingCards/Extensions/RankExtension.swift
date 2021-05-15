//=============================================================================//
//                                                                             //
//  RankExtension.swift                                                        //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/03/21.                                       //
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

/// A `PlayingCard Rank` extension.
extension Rank {

    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//

    /// Determines if the `Rank` is a standard numeral `PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a standard numeral `PlayingCard Rank`, else false.
    func isNumeral() -> Bool {

        let min = 2
        let max = 10
        
        return self == .ace || self.isNumeric(from: min, to: max)
    }

    /// Determines if the `Rank` is a standard royal `PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a standard royal`PlayingCard Rank`, else false.
    func isRoyal() -> Bool {

        return self == .jack || self == .queen || self == .king
    }

    /// Determines if the `Rank` is a standard French-suited`PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a standard French-suited`PlayingCard Rank`, else false.
    func isStandard() -> Bool {

        return isNumeral() || isRoyal()
    }
    
    func next(ace high: Bool = false) -> Rank {
        
        return Rank.ace
    }
}
