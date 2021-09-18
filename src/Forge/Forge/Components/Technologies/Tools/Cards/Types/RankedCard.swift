//=============================================================================//
//                                                                             //
//  RankedCard.swift                                                           //
//  Forge                                                                      //
//                                                                             //
//  Created by Tyler J. Otte on 5/16/21.                                       //
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

/// A `Rank`ed `Card`.
public class RankedCard: Card, Rankable, Scoreable {

    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The hierarchical position.
    public let rank: Rank
    
    /// The order within the hierarchy.
    public let position: Int
    
    /// The total # of points.
    public let points: Int

    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//

    /// Creates a default `RankedCard`.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Card`'s `Rank` is set to `one`.
    ///   - The `Card`'s position is set to 1.
    ///   - The `Card`'s points are set to 1.
    ///   - The `Card`'s title is set to`One`.
    override public init() {
        
        self.rank = .one
        self.position = 1
        self.points = 1
        let title = String(describing: rank).capitalized
        
        super.init(named: title)
    }
    
    /// Creates a `RankedCard` with the given `Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Card`'s `Rank` is set to the given `Rank`.
    ///   - The `Card`'s position is set to 0.
    ///   - The `Card`'s points are set to 0.
    ///   - The `Card`'s title is set to the given `Rank`.
    /// - Parameter rank: The hierarchical position.
    public init(with rank: Rank) {
        
        self.rank = rank
        self.position = 0
        self.points = 0
        let title = String(describing: rank).capitalized
        
        super.init(named: title)
    }
    
    /// Creates a `RankedCard` with the given terms.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Card`'s `Rank` is set to the given `Rank`.
    ///   - The `Card`'s position is set to the given position.
    ///   - The `Card`'s points are set to 0.
    ///   - The `Card`'s title is set to the given `Rank`.
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - position: The given `Rank`'s order in the hierarchy.
    public init(with rank: Rank, at position: Int) {
        
        self.rank = rank
        self.position = position
        self.points = 0
        let title = String(describing: rank).capitalized
        
        super.init(named: title)
    }
    
    /// Creates a `RankedCard` with the given terms.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Card`'s `Rank` is set to the given `Rank`.
    ///   - The `Card`'s position is set to the given position.
    ///   - The `Card`'s points are set to the given points.
    ///   - The `Card`'s title is set to the given `Rank`.
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - position: The given `Rank`'s order in the hierarchy.
    ///   - points: The total # of points.
    public init(with rank: Rank, at position: Int, worth points: Int) {
        
        self.rank = rank
        self.position = position
        self.points = points
        let title = String(describing: rank).capitalized
        
        super.init(named: title)
    }
    
    /// Creates a `RankedCard` with the given terms.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Card`'s `Rank` is set to the given `Rank`.
    ///   - The `Card`'s points are set to the given points.
    ///   - The `Card`'s position is set to the given position.
    /// - Parameters:
    ///   - rank: The hierarchical position.
    ///   - position: The given `Rank`'s order in the hierarchy.
    ///   - points: The total # of points.
    ///   - title: The `Card`'s primary name.
    public init(with rank: Rank, at position: Int, worth points: Int,
         named title: String) {
        
        self.rank = rank
        self.position = position
        self.points = points
        
        super.init(named: title)
    }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if the `Card` is less than the given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Card` to compare to.
    /// - Returns: True if the `Card` is less than the given {Model}, else false.
    public override func isLessThan(_ rhs: Card) -> Bool {
        
        var isLessThan = false
        
        if let card = rhs as? RankedCard {
            
            isLessThan = position < card.position
        }
        
        return isLessThan
    }
    
    /// Determines if the `Card` equals the given `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters rhs: The `Card` to compare to.
    /// - Returns: True if the `Card` equals the given `Card`, else false.
    public override func equals(_ rhs: Card) -> Bool {
        
        var equals = false
        
        if let card = rhs as? RankedCard {
            
            equals = rank == card.rank && position == card.position &&
                points == card.points && super.equals(rhs)
        }
        
        return equals
    }
    
    /// Determines if the `Card` ranks the given `Card` in the hierarchy.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to test.
    /// - Returns: True if the `Card` ranks the given `Card`in the hierarchy, else false.
    public func ranks(_ card: RankedCard) -> Bool {
        
        return rank == card.rank && position == card.position
    }
    
    /// Determines if the `Card` immediately follows the given`Card` in the hierarchy.
    /// 
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to test.
    /// - Returns: True if the `Card` immediately follows the given `Card` in the hierarchy, else false.
    public func follows(_ card: RankedCard) -> Bool {
        
        return position == card.position + 1
    }
}
