//
//  HerosView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 29/4/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - HerosView
struct HerosListView: View {
    
    // MARK: Properties
    @StateObject var herosViewModel: HerosViewModel
    
    
    // MARK: View
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundSubView(opatity: 0.1)
                    
                ScrollView {
                    ForEach(herosViewModel.heros) { hero in
                        NavigationLink(
                            destination: DetailView(),
                            label: { HerosRowView(hero: hero)
                            })
                    }
                }
            }
        }
        .navigationTitle(NSLocalizedString("HeroesList", comment: ""))
    }
}

// MARK: - Preview
#Preview {
    let viewModelFake = HerosViewModel(useCaseHeros: HerosUseCaseFake())
    Task {
        viewModelFake.getHeros()
    }
    
    return HerosListView(herosViewModel: viewModelFake)
}
