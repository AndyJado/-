//
//  ContentView.swift
//  桎梏
//
//  Created by Andy Jado on 2022/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var offSize:CGSize = .zero
    @State private var offPoint:CGPoint = .zero
    
    var drag: some Gesture {
        
        DragGesture()
            .updating($offSize) { dragging, offSize, _  in
                offSize = dragging.translation
            }
        
    }
    
    var body: some View {
        
        ScrollView([.vertical,.horizontal], showsIndicators: true) {
            ZStack {
                Color.brown
                    .scaledToFill()
                    .ignoresSafeArea()
                    .onTapGesture { location in
                        withAnimation {
                            offPoint = location
                        }
                    }
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .gesture(drag)
                    .position(offPoint)
                VStack {
                    Text("(_~~)~~")
                        .font(.largeTitle)
                }
            }
            .padding(500)
            .scaledToFill()
        }
        .ignoresSafeArea()
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
