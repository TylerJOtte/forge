////=============================================================================//
////                                                                             //
////  PlayingCardHand.swift                                                      //
////  Forge                                                                      //
////                                                                             //
////  Created by Tyler J. Otte on 5/01/21.                                       //
////-----------------------------------------------------------------------------//
////                                                                             //
//// This source file is part of the Forge framework project.                    //
////                                                                             //
//// Copyright (c) 2021, Tyler J. Otte.                                          //
//// Licensed under the GNU Affero General Public License v3.0.                  //
////                                                                             //
//// See https://github.com/TylerJOtte/forge/LICENSE.txt for more details.       //
////=============================================================================//
//
//import Foundation
//import SwiftUI
//
///// A `Hand` of `PlayingCard`s.
//public class PlayingCardHand: Hand {
//    
//    //=========================================================================//
//    //                               CONSTRUCTORS                              //
//    //=========================================================================//
//    
//    /// Creates a`PlayingCardHand`with the given `Card`s and specified `max`.
//    ///
//    /// - Precondition:
//    ///   - `max` must be  >= 1.
//    ///   - The # of given `Card`s must be &lt;= `max`.
//    /// - Postcondition:
//    ///   - The `Hand` can hold zero to given max `Card`s.
//    ///   - The `Hand` contains the given `Card`s.
//    ///   - title = name of calling model.
//    /// - Parameters:
//    ///   - cards: The `Card`s to create `Hand` with.
//    ///   - max: The maximum # of `Card`s allowed in the `Hand`.
//    /// - Throws:
//    ///   - `RangeError.invalidMax` if the given max is &lt; one.
//    ///   - `ElementsError.insufficientElements` if the # of given `Card`s > specified max.
//    init(of cards: [PlayingCard], with max: Int = Int.max) throws {
//        
//        try super.init(of: cards, with: max)
//    }
//    
//    /// Creates a`Hand`with the given `Card`s and specified `min` & `max`.
//    ///
//    /// - Precondition:
//    ///   - `min` must be >= 0.
//    ///   - `max` must be  >= 1.
//    ///   - `max` must be >= `minCards`.
//    ///   - The # of given `Card`s must be &lt;= `max`.
//    /// - Postcondition:
//    ///   - The `Hand` can hold zero to given max `Card`s.
//    ///   - The `Hand` contains the given `Card`s.
//    ///   - title = name of calling model.
//    /// - Parameters:
//    ///   - min: The minimum # of `Card`s allowed in the `Hand`.
//    ///   - max: The maximum # of `Card`s allowed in the `Hand`.
//    ///   - cards: The `Card`s to create `Hand` with.
//    /// - Throws:
//    ///   - `RangeError.invalidMin` if the given min is &lt; zero.
//    ///   - `RangeError.invalidMax` if the given max is &lt; one or &lt; the specified min.
//    ///   - `ElementsError.insufficientElements` if the # of given `Card`s > specified max.
//    init(of min: Int, to max: Int, _ cards: [PlayingCard]) throws {
//        
//        try super.init(of: min, to: max, cards)
//    }
//    
////    /// Creates a`Hand`with the given terms.
////    ///
////    /// - Precondition:
////    ///   - `min` must be >= 0.
////    ///   - `max` must be  >= 1.
////    ///   - `max` must be >= `minCards`.
////    ///   - The # of given `Card`s must be &lt;= `max`.
////    /// - Postcondition:
////    ///   - The `Hand` can hold zero to given max `Card`s.
////    ///   - The `Hand` contains the given `Card`s.
////    ///   - The `Hand`'s title is set to the given title.
////    ///   - title = given title.
////    /// - Parameters:
////    ///   - min: The minimum # of `Card`s allowed in the `Hand`.
////    ///   - max: The maximum # of `Card`s allowed in the `Hand`.
////    ///   - cards: The `Card`s to create `Hand` with.
////    ///   - title: The `Hand`'s primary name.
////    /// - Throws:
////    ///   - `RangeError.invalidMin` if the given min is &lt; zero.
////    ///   - `RangeError.invalidMax` if the given max is &lt; one or &lt; the specified min.
////    ///   - `ElementsError.insufficientElements` if the # of given `Card`s > specified max.
////    init(of min: Int, to max: Int, _ cards: [PlayingCard],
////                  named title: String) throws {
////
////        try super.init(of: min, to: max, cards, named: title)
////    }
////
//    //=========================================================================//
//    //                                 METHODS                                 //
//    //=========================================================================//
//    
//    //-------------------------------------------------------------------------//
//    //                                 Getters                                 //
//    //-------------------------------------------------------------------------//
//
////    /// Retrieves all the `Kind`s in the `Hand`.
////    ///
////    /// - Precondition: None.
////    /// - Postcondition: None.
////    /// - Returns: A collection of `Kind`s.
////    public func getKinds() throws -> [Kind] {
////
////        return try cards.getPairs().map{try Kind(of: $1)}
////    }
////
//    /// Retrieves all the `Run`s in the `Hand`.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: A collection of `Run`s.
//    public func getRuns() -> [Run] {
//        
//        // TODO: implement stub
//        
//        return []
//    }
//    
//    /// Retrieves a `Flush` in the `Hand`, if any.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: An optional `Flush`.
//    public func getFlush() -> Flush? {
//        
//        // TODO: implement stub
//        
//        return nil
//    }
//    
//    //-------------------------------------------------------------------------//
//    //                               Calculators                               //
//    //-------------------------------------------------------------------------//
//    
//    /// Retrieves the `Hand`'s `Score`.
//    ///
//    /// - Precondition: None.
//    /// - Postcondition: None.
//    /// - Returns: The `Hand`'s `Score`.
//    public func Count() -> HandScore {
//        
//        // TODO: implement stub
//        
//        return HandScore(with: [:])
//    }
//}
