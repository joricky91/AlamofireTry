//
//  ContentView.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .foregroundColor(.accentColor)
                .frame(width: 40, height: 40)
            Text("Hello, world!")
                .font(.title2)
                .fontWeight(.semibold)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
