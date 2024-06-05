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
        case .none:
            Text("Status Home")
                .onAppear {
                    viewModel.getHeros()
                }
        case .loadingView:
            LoadingView()
        case .herosView:
            HerosView()
        case .detailView:
            DetailView()
        case .errorView(error: let errorString):
            ErrorView(error: errorString) {
                viewModel.status = .none
            }
        }
    }
}


// MARK: - Preview
#Preview {
    RootView(viewModel: HerosViewModel())
}
