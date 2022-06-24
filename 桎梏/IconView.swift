//
//  IconView.swift
//  桎梏
//
//  Created by Andy Jado on 2022/6/23.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.ultraThinMaterial)
            
            Text("{  _  ~~}~~")
                .foregroundColor(.secondary)
                .font(.largeTitle)
            
        }
        .frame(width: 250, height: 250)
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}
