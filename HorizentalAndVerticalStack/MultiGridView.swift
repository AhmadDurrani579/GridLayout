//
//  MultiGridView.swift
//  HorizentalAndVerticalStack
//
//  Created by dev003 on 10/12/2020.
//

import SwiftUI

struct MultiGridView: View {
//    @State var gridLayout: [GridItem] = [GridItem()]
        @State var gridLayout = [GridItem(.adaptive(minimum: 100)) , GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(sampleCafes) { cafe in
                                 Image(cafe.image)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: gridLayout.count == 1 ? 200 : 100)
                                .cornerRadius(20)
                                .shadow(color: Color.primary.opacity(0.3), radius: 1)
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                                ForEach(cafe.coffePhotos) { photo in
                                    Image(photo.name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0 , maxWidth: .infinity)
                                        .frame(height: 50)
                                        .cornerRadius(10)
                                }
                            }
                            .frame(minHeight: 0 , maxHeight: .infinity, alignment: .top)
                            .animation(.easeIn)
                        }
                }.padding(.all , 10)
                .animation(.interactiveSpring())

            }.navigationTitle("Coffe Feed")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 4 + 1)
//
//                    }) {
//                        Image(systemName: "square.grid.2x2")
//                            .font(.title)
//                            .foregroundColor(.primary)
//
//                    }
//                }
//            }
        }
    }
}

struct MultiGridView_Previews: PreviewProvider {
    static var previews: some View {
        MultiGridView()
    }
}
