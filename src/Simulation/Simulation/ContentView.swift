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
    
    let deck = PlayingCardDeck()
    let ace = [Ace(of: .clubs)]
    
    
    var body: some View {
        Text(deck.add(ace))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
