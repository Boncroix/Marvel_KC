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
        private let height = WKInterfaceDevice.current().screenBounds.height / 3
        private let width = WKInterfaceDevice.current().screenBounds.width - 16
    #else
        private let height = UIScreen.main.bounds.height / 3
        private let width = UIScreen.main.bounds.width - 16
    #endif
    
    var home: some View {
        VStack(spacing: 8) {
            Text(hero.name)
                .font(AppFonts().textM)
                .bold()
                .id(3)
            VStack {
                if let urlString = hero.thumbnail.getUrlImage(), let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .cornerRadius(25)
                            .id(4)
                    } placeholder: {
                        PlaceHolderImage()
                    }
                } else {
                    PlaceHolderImage()
                }
            }
            .frame(height: height)
            .cornerRadius(25)
            
            ScrollView {
                Text(hero.description)
                    .id(5)
            }
            .frame(height: height / 1.5)
            
            if !viewModel.series.isEmpty {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.series) { serie in
                            SeriesRowView(serie: serie)
                                .id(6)
                        }
                    }
                }
            }
        }
        .frame(width: width)
    }
    
    var body: some View {
        Group {
            switch viewModel.status {
            case .none:
                Text("Status none")
                    .onAppear {
                        viewModel.getSeries(hero: self.hero)
                    }
                    .id(0)
            case .loadingView:
                LoadingView()
                    .id(1)
        
            case .errorView(error: let errorString):
                ErrorView(error: errorString) {
                    viewModel.status = .none
                }
                .id(2)
            case .home:
                #if os(watchOS)
                ZStack {
                    BackgroundSubView(opatity: 0.6)
                    ScrollView {
                        home
                    }
                }
                #else
                ZStack {
                    BackgroundSubView(opatity: 0.6)
                    home
                }
                #endif
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

