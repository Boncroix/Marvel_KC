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
    
    #if os(watchOS)
        private let height = UIScreen.main.bounds.height/2
    #else
        private let height = UIScreen.main.bounds.height/3
    #endif
    
    var body: some View {
        Group {
            switch viewModel.status {
            case .none:
                Text("Status none")
                    .onAppear {
                        viewModel.getSeries(hero: self.hero)
                    }
            case .loadingView:
                LoadingView()
        
            case .errorView(error: let errorString):
                ErrorView(error: errorString) {
                    viewModel.status = .none
                }
            case .home:
                ZStack {
                    BackgroundSubView(opatity: 0.6)
                    
                    VStack(spacing: 8) {
                        Text(hero.name)
                            .font(AppFonts().textM)
                            .bold()
                        VStack {
                            if let urlString = hero.thumbnail.getUrlImage(), let url = URL(string: urlString) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .cornerRadius(20)
                                } placeholder: {
                                    PlaceHolderImage()
                                }
                            } else {
                                PlaceHolderImage()
                            }
                        }
                        .frame(height: height)
                        
                        ScrollView {
                            Text(hero.description)
                        }
                        if !viewModel.series.isEmpty {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(viewModel.series) { serie in
                                        SeriesRowView(serie: serie)
                                    }
                                }
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width-16)
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

