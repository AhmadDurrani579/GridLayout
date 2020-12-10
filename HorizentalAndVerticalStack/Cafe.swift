//
//  Cafe.swift
//  HorizentalAndVerticalStack
//
//  Created by dev003 on 10/12/2020.
//

import SwiftUI
struct Cafe: Identifiable {
    
    var id  = UUID()
    var image: String
    var coffePhotos: [Photo] = []
}

let sampleCafes: [Cafe] = {
    var cafes = (1...18).map{Cafe(image: "cafe-\($0)")}
    for index in cafes.indices {
        let randomNumber = Int.random(in: (2...12))
        cafes[index].coffePhotos = (1...randomNumber).map{Photo(name: "coffee-\($0)")}
    }
    return cafes
}()

