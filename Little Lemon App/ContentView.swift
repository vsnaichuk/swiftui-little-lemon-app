//
//  ContentView.swift
//  Little Lemon App
//
//  Created by vsn on 15.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("littleLemon")
                .imageScale(.large)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
