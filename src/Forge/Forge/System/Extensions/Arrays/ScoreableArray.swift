//=============================================================================//
//                                                                             //
//  ScoreableArray.swift                                                       //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 6/02/21.                                       //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the Forge framework project.                    //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
//=============================================================================//

///// An extension for common `Scoreable Array` operations.
//extension Array where Element: Scoreable  {
//
//    //=========================================================================//
//    //                               CALCULATORS                               //
//    //=========================================================================//
//
//    /// Sums all the `Element`s' points.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: The sum of all the `Element`s' points, or 0 if empty.
//    func sumPoints() -> Int {
//
//        return map{$0.points}.sum()
//    }
//}
//
///// An extension for common `Scoreable Array` operations.
//extension Collection where Iterator.Element: Collection, Iterator.Element.Iterator.Element: Scoreable {
//
//    //=========================================================================//
//    //                               CALCULATORS                               //
//    //=========================================================================//
//
//    /// Sums all the `Element`s' points.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: The sum of all the `Element`s' points, or 0 if empty.
//    func sumPoints() -> Int {
//
//        return map{$0.map{$0.points}.sum()}.sum()
//    }
//}
