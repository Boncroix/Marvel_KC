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
    @EnvironmentObject var viewModel: HerosViewModel
    
    #if os(watchOS)
        private let height = WKInterfaceDevice.current().screenBounds.height / 2
        private let width = WKInterfaceDevice.current().screenBounds.width - 16
    #else
        private let height = UIScreen.main.bounds.height / 3
        private let width = UIScreen.main.bounds.width - 16
    #endif

    // MARK: View
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundSubView(opatity: 0.6)
                    .id(0)
                    
                ScrollView {
                    ForEach(viewModel.heros) { hero in
                        NavigationLink(
                            destination: DetailView(hero: hero)
                                .environmentObject(DetailViewModel()),
                            label: { HerosRowView(hero: hero)
                            })
                        .id(1)
                        .frame(width: width, height: height)
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
    
    return HerosListView().environmentObject(viewModelFake)
}
