//
//  ContentView.swift
//  HorizentalAndVerticalStack
//
//  Created by dev003 on 08/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State var gridLayout: [GridItem] = [GridItem()]
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(samplePhotos.indices) { index in
                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: gridLayout.count == 1 ? 200 : 100)
                            .cornerRadius(20)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                    }
                    
                }.padding(.all , 10)
                .animation(.interactiveSpring())

            }.navigationTitle("Coffe Feed")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 4 + 1)
                        
                    }) {
                        Image(systemName: "square.grid.2x2")
                            .font(.title)
                            .foregroundColor(.primary)
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...20).map {
    Photo.init(name: "coffee-\($0)")
}

