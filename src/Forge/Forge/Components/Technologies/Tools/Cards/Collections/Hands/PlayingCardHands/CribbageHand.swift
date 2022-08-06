//=============================================================================//
//                                                                             //
//  CribbageHand.swift                                                         //
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

/// A `PlayingCard Hand` for a game of Cribbage.
public class CribbageHand: PlayingCardHand {
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//

    /// Creates a default `CribbageHand`.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Hand` can hold zero to four `Card`s.
    ///   - The `Hand` is empty.
    ///   - The `Hand`'s title is set to "Cribbage Hand".
    override public init() {
         
        super.init(maxCards: 4)
    }
    
    /// Creates a`CribbageHand`with the given `Card`s.
    ///
    /// - Precondition:
    ///   - The given `Card`s must not contain more than  four `Card`s.
    ///   - The given `Card`s must not contain any `Joker`s.
    /// - Postcondition:
    ///   - The `Hand` can hold zero to four `Card`s.
    ///   - The `Hand` contains the given `Card`s.
    ///   - The `Hand`'s title is set to  "Cribbage Hand".
    /// - Parameter cards: The `Card`s to create the `Hand` with.
    /// - Throws:
    ///   - `invalidCount` if the given `Card`'s contain more than four `Card`s.
    ///   - `invalidRank` if the given `Card`s contains any `Joker`s.
    internal init(with cards: [PlayingCard]) throws {
        
        let max = 4
        
        guard (cards.count <= max) else {
            
            print("The given Cards can contain at most \(max) Cards.")
            throw ElementsError.invalidCount
        }
        
        guard (!cards.containJokers()) else {

            print("The given Cards must not contain any Jokers.")
            throw DescriptionError.invalidRank
        }

        try super.init(of: max, cards)
    }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
        
    /// Determines if a `Flush HandRank` exists with the given cut `Card`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A `Flush HandRank`, or `nil` if none exist.
    internal func hasFlush(with cutCard: PlayingCard) -> Bool {
        
        return isFull() && cards.hasOneSuit(with: cutCard)
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//

    /// Retrieves  all the`Fifteen HandRank`s with the given cut `Card`.
    ///
    /// - Precondition: The given cut `Card` cannot be a `Joker`.
    /// - Postcondition: None.
    /// - Returns: A collection of`Fifteen HandRank`s.
    /// - Throws:`invalidRank` if the given cut `Card` is a `Joker`.
    internal func getFifteens(with cutCard: PlayingCard) throws -> [Fifteen] {
        
        guard (!(cutCard is Joker)) else {

            print("The given cut card cannot be a Joker.")
            throw DescriptionError.invalidRank
        }
        
        let expected = 15
        let sum = cards.totalPoints + cutCard.points
        var fifteens: [Fifteen] = []
        
        // The sum of all Card points must at least equal 15, else there are no
        // Fifteens
        if (sum >= expected) {
            
            var cards = [cutCard]
            
            cards.append(contentsOf: self.cards)
            
            // If the sum of all card points equals 15, there is only one Fifteen
            if (sum == expected) {
        
                try fifteens.append(Fifteen(of: cards))
            
            } else {
                
                // For first card to penultimate card
                for i in 0..<cards.count - 1 {

                    // Compare current card and next card
                    for j in i + 1..<cards.count {
                     
                        var actual = [cards[i], cards[j]]
                        
                        if (actual.totalPoints == expected) {
                            
                            try fifteens.append(Fifteen(of: actual))
                        
                        }
                        
                        else {
                            
                            // Compare current card and next two cards
                            for k in j + 1..<cards.count {
                                
                                actual = [cards[i], cards[j], cards[k]]
                                
                                if (actual.totalPoints == expected) {
                                    
                                    try fifteens.append(Fifteen(of: actual))
                                
                                } else {
                                    
                                    // Compare current card and next three cards
                                    for l in k + 1..<cards.count {
                                        
                                        actual = [cards[i], cards[j], cards[k],
                                                  cards[l]]
                                    
                                        if (actual.totalPoints == expected) {
                                        
                                            try fifteens
                                                .append(Fifteen(of: actual))
                                    
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
        
        return fifteens
    }
    
    /// Retrieves  a`Flush HandRank` with the given cut `Card`.
    ///
    /// - Precondition: The given cut `Card` cannot be a `Joker`.
    /// - Postcondition: None.
    /// - Returns: A `Flush HandRank`, or `nil` if none exists.
    /// - Throws:`invalidRank` if the given cut `Card` is a `Joker`.
    internal func getFlush(with cutCard: PlayingCard) throws -> Flush? {
        
        guard (!(cutCard is Joker)) else {

            print("The given cut card cannot be a Joker.")
            throw DescriptionError.invalidRank
        }
        
        return hasFlush(with: cutCard) ? try Flush(of: cards) : nil
    }
    
    /// Retrieves  a`Nobs HandRank`for the given cut `Card`.
    ///
    /// - Precondition: The given cut `Card` cannot be a `Jack` or a `Joker`.
    /// - Postcondition: None.
    /// - Parameter cutCard: The `Deck`'s cut `Card`.
    /// - Returns: A `Nobs HandRank`, or `nil` if none exist.
    /// - Throws:`invalidRank` if the given cut `Card` is a `Jack` or a `Joker`.
    internal func getNobs(with cutCard: PlayingCard) throws -> Nobs? {

        guard (!(cutCard is Jack) && !(cutCard is Joker)) else {

            print("The given cut card cannot be a Jack or a Joker.")
            throw DescriptionError.invalidRank
        }

        var nobs: Nobs?

        if let jack = cards.firstJack(of: cutCard.suit) {

            nobs = try Nobs(with: jack, and: cutCard)
        }

        return nobs
    }
}
