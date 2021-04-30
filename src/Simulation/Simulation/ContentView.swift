//
//  ContentView.swift
//  Simulation
//
//  Created by Tyler J. Otte on 4/18/21.
//

import SwiftUI
import CoreData
import Forge

struct ContentView: View {
    
    let card1 = Card("Card 1")
    let card2 = Card("Card 2")
    let card3 = Card("Card 3")
    let cards = [card1, card2, card3]
    let deck = Deck()
    
    var body: some View {
        Text("Title: \(card1.title)")
            .padding()
        Text("Card A < Card B: \(card1 < card2)" as String)
            .padding()
        Text("Card A = Card A: \(card1 == card3)" as String)
            .padding()
        Text("Card C > Card A: \(card4 > card1)" as String)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
