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
    @EnvironmentObject var viewModel: HerosViewModel
        
    // MARK: View
    var body: some View {
        switch viewModel.status {
        case .none:
            Text("Status none")
                .onAppear {
                    viewModel.getHeros()
                }
                .id(0)
        case .loadingView:
            LoadingView()
                .id(1)
        case .home:
            HerosListView().environmentObject(viewModel)
                .id(2)
        case .errorView(error: let errorString):
            ErrorView(error: errorString) {
                viewModel.status = .none
            }
            .id(3)
        }
    }
}


// MARK: - Preview
/*
 #Preview {
     RootView(viewModel: HerosViewModel())
 }
 */

