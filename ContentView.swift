//
//  ContentView.swift
//  ParallaxEffect
//
//  Created by Jesus Antonio Gil on 2/2/25.
//

import SwiftUI


struct ContentView: View {
    let animals = ["Pic1","Pic2","Pic3","Pic4","Pic5","Pic6","Pic7"]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
                ForEach(animals, id: \.self) { animal in
                    ZStack {
                        Image(animal)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 450)
                            .scrollTransition(axis: .horizontal) { content, phase in
                                return content.offset(x: phase.value * -250)
                            }
                    }
                    .containerRelativeFrame(.horizontal)
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                }
            }
        }
        .contentMargins(.horizontal, 32)
    }
}


#Preview {
    ContentView()
}
