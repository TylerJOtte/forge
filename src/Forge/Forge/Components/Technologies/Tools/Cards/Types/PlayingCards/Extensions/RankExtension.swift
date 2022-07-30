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
public extension Rank {

    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//

    /// Determines if the `Rank` is a standard numeral `PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a standard numeral `PlayingCard Rank`, else false.
    internal func isNumeralPlayingCardRank() -> Bool {

        return PlayingCards.numeralRanks.contains(self)
    }

    /// Determines if the `Rank` is a standard royal `PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a standard royal`PlayingCard Rank`, else false.
    internal func isRoyalPlayingCardRank() -> Bool {

        return PlayingCards.royalRanks.contains(self)
    }
    
    /// Determines if the `Rank` is a standard French-suited`PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a standard French-suited`PlayingCard Rank`, else false.
    func isStandardPlayingCardRank() -> Bool {

        return isNumeralPlayingCardRank() || isRoyalPlayingCardRank()
    }

    /// Determines if the `Rank` is a standard French-suited`PlayingCard Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: True if the `Rank` is a standard French-suited`PlayingCard Rank`, else false.
    internal func isPlayingCardRank() -> Bool {

        return isStandardPlayingCardRank() || self == .joker
    }
}
