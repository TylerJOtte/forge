//=============================================================================//
//                                                                             //
//  Score.swift                                                                //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/01/21.                                       //
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

/// A point total.
public class Score: Reward, Scoreable, Relatable {

    /// The total # of points.
    public var points: Int { return 0 }
    
    //-------------------------------------------------------------------------//
    //                                  <                                      //
    //-------------------------------------------------------------------------//
    
    /// Determines if the `Score` is less than the given `Score`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Score` to compare to.
    /// - Returns: True if the `Score` is less than the given {Model}, else false.
    public func isLessThan(_ rhs: Score) -> Bool {
        
        return points < rhs.points
    }
    
    /// Determines if the given left-handside`Score` is less than the specified right-handside `Score`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Score` to compare against.
    ///   - rhs: The `Score` to compare to.
    /// - Returns: True if the left-handside`Score` is less than the right-handside `Score`, else false.
    public static func < (lhs: Score, rhs: Score) -> Bool {
        
        return lhs.isLessThan(rhs)
    }
    
    //-------------------------------------------------------------------------//
    //                                  =                                      //
    //-------------------------------------------------------------------------//
    
    /// Determines if the `Score` equals the given `Score`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Score` to compare to.
    /// - Returns: True if the `Score` equals the given `Score`, else false.
    public func equals(_ rhs: Score) -> Bool {
        
        return points == rhs.points
    }
    
    /// Determines if the given left-handside`Score` equals the specified right-handside `Score`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - lhs: The `Score` to compare against.
    ///   - rhs: The `Score` to compare to.
    /// - Returns: True if the left-handside`Score` equals the right-handside `Score`, else false.
    public static func == (lhs: Score, rhs: Score) -> Bool {
        
        return lhs.equals(rhs)
    }
}
