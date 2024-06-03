//
//  RouterView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 10/5/24.
//

import SwiftUI

// MARK: - RootView
struct RootView: View {
    
    // MARK: Properties
    @StateObject var viewModel: HerosViewModel
    
    // MARK: View
    var body: some View {
        switch viewModel.status {
        case .home:
            Text("Status Home")
                .onAppear {
                    viewModel.getHeros()
                }
        case .loading:
            LoadingView()
        case .loaded:
            HerosView()
        case .error(error: let errorString):
            ErrorView(error: errorString) {
                viewModel.status = .home
            }
        }
    }
}

#Preview {
    RootView(viewModel: HerosViewModel())
}
