//
//  RootViewModel.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 3/5/24.
//

import SwiftUI

struct RootViewModel: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch appState.status {
        case .home:
            Text("Home")
        case .detail:
            Text("Detail")
        }
    }
}

#Preview {
    RootViewModel()
}
