//
//  ContentView.swift
//  Shared
//
//  Created by Michele Manniello on 29/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            HomeView()
                .navigationTitle("Dribble Ball Animation")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
