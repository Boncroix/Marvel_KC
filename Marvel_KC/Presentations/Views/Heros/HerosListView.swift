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
    @StateObject var viewModel: HerosViewModel

    // MARK: View
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundSubView(opatity: 0.6)
                    
                ScrollView {
                    ForEach(viewModel.heros) { hero in
                        NavigationLink(
                            destination: DetailView(
                                hero: hero,
                                viewModel: DetailViewModel()),
                            label: { HerosRowView(hero: hero)
                            })
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Prev")
                        })
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Next")
                        })
                    }
                }
            }
            .navigationTitle(NSLocalizedString("HeroesList", comment: ""))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview
#Preview {
    let viewModelFake = HerosViewModel(useCaseHeros: HerosUseCaseFake())
    Task {
        viewModelFake.getHeros()
    }
    
    return HerosListView(viewModel: viewModelFake)
}
