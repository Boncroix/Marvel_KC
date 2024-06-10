//
//  DetailView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 3/5/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: DetailView
struct DetailView: View {
    
    // MARK: Properties
    var hero: Hero
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        ZStack {
            BackgroundSubView(opatity: 0.6)
            
            VStack {
                if let urlString = hero.thumbnail.getUrlImage(), let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                    } placeholder: {
                        PlaceHolderImage()
                    }
                } else {
                    PlaceHolderImage()
                }
                ScrollView {
                    
                }
            }
        }
    }
}

// MARK: - DetailPreView
#Preview {
    let viewModelFake = DetailViewModel(useCaseSeries: SeriesUseCaseFake())
    Task {
        viewModelFake.getSeries(hero: character1)
    }
    
    return DetailView(hero: character1, viewModel: viewModelFake)
}

