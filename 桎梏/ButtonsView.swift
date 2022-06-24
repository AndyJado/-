//
//  ButtonsView.swift
//  桎梏
//
//  Created by Andy Jado on 2022/6/23.
//

import SwiftUI


final class ViewModel: ObservableObject {
    
    @Published var rope:[(String,Date)] = []
    
    init() {
        
    }
    
    func addKnot(_ carver: Carver) {
        rope.append(carver.knot())
    }
    
    // heavy
    func drawRope() -> String {
        
        guard
            let start = rope.first?.1,
            let end = rope.last?.1,
            start != end
        else {return rope.last?.0 ?? ""}
        
        let duration = end.timeIntervalSince(start)
        let spacing = rope.count
        var last = 0.0
        var drewRope:String = ""
        
        for knot in rope {
            
            let current = knot.1.timeIntervalSince(start) / duration
            
            let space = Int((current - last) * Double(spacing))
            
            for _ in 0 ..< space {
                drewRope += " "
            }
            drewRope += knot.0
            last = current
        }
        return drewRope
    }
}

struct ButtonsView: View {
    
    @StateObject private var vm = ViewModel()
    @State private var rope:String = "rope here"
    
    var body: some View {
        
        VStack {
            
            ScrollView([.horizontal], showsIndicators: true) {
                Text(rope)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                
            }
            .padding(.top, 200)
            VStack {
                Button {
                    rope = vm.drawRope()
                } label: {
                    Text("draw rope")
                }
                .padding()
                
                Button {
                    rope.removeAll()
                    vm.rope.removeAll()
                } label: {
                    Text("REMOVAL!!")
                }
                .padding()

            }
            .padding()
            

            
            Spacer()
            
            
            
            HStack {
                carveButton(.lost)
                carveButton(.thinking)
                carveButton(.going)
            }
            .padding(.bottom, 30)
            
            HStack {
                carveButton(.aStart)
                
                Menu {
                    Button {
                        print("sth")
                    } label: {
                        Text("sth")
                    }

                } label: {
                    Text("append")
                        .underline()
                }

                
                carveButton(.aEnd)
            }
            .padding(.bottom, 80)
        }
    }
}


extension ButtonsView {
    
    func carveButton(_ carve: Carver) -> some View {
        
        Button {
            vm.addKnot(carve)
            print(carve.literal)
        } label: {
            Text(carve.literal)
                .font(.largeTitle)
                .foregroundColor(.primary)
                .padding(15)
                .overlay(alignment: .center) {
                    Circle()
                    .foregroundColor(.secondary)
                }
                .clipped()
                .frame(width: 60, height: 60)
        }
        
    }
    
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
