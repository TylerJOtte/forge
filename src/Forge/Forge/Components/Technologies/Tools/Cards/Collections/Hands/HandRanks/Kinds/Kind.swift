//=============================================================================//
//                                                                             //
//  Kind.swift                                                                 //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 4/04/21.                                       //
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

/// A `HandRank` of equally `Rank`ed `PlayingCard`s.
public class Kind: HandRank, Comparable {// PlayingCardHand, HandRank {
    
//    public init(of cards: [Card]) {
//
//        super.init(of: cards)
//    }
    /// The total # of points.
//    public var points: Int { count * (count - 1) }
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
//
//    /// Creates a`Kind`with the given `Card`s.
//    ///
//    /// - Precondition:
//    ///   - The given `Card`s must contain at least two`Card`s.
//    ///   - The given `Card`s must all have the same `Rank`.
//    /// - Postcondition:
//    ///   - The `HandRank` can hold two to`Int.max Card`s.
//    ///   - The `HandRank` contains the given `Card`s.
//    ///   - The `HandRank`s title is set according to the # of `Card`s it holds.
//    ///   - The `HandRank`s points are set according to the # of `Card`s it holds.
//    ///   - title = "Pair" if `Kind` contains two `Card`s, else "n Of A Kind" where "n" equals  the count.
//    /// - Parameter cards: The `Card`s to create the `HandRank` with.
//    /// - Throws:
//    ///   - `ElementsError.insufficientElements` if the given `Card`s
//    ///      - Contain less than two `Card`s, or
//    ///      - Do not all have the same `Rank`.
//    public init(of cards: [PlayingCard]) throws {
//
//        let min = 2
//        let max = Int.max
//        var title: String
//
//        guard (cards.count >= min) else {
//
//            print("The collection must contain at least \(min) Cards.")
//            throw ElementsError.insufficientElements
//        }
//
//        guard (cards.areEquallyRanked()) else {
//
//            print("The given Cards must all have the same Rank.")
//            throw ElementsError.insufficientElements
//        }
//
//        title = cards.count == 2 ? "Pair" : "\(cards.count) Of A Kind"
//
//        try super.init(of: min, to: max, cards, named: title)
//    }
    
//    /// Determines if all `Card`s in the collection have the same `Rank`.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: True if all `Card`s in the collection have the same `Rank`, else false.
//    func areEquallyRanked() -> Bool {
//
//        return !self.contains(where: {$0 != self.first})
//    }
//
    public static func < (lhs: Kind, rhs: Kind) -> Bool {

        return lhs.points < rhs.points
    }

    
    /// Determines if the given `Card`s are equal.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Card` to compare against.
    ///   - rhs: The `Card` to compare to.
    /// - Returns: True if the given `Card`s are equal, else false.
    public static func == (lhs: Kind, rhs: Kind) -> Bool {

        return lhs.points == rhs.points
    }
}
