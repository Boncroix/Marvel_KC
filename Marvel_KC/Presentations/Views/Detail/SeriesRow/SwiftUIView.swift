//
//  SwiftUIView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<10) { index in
                    VStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.yellow)
                        Text("Item \(index)")
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
