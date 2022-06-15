//
//  MovieListViewModel.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import Foundation

protocol MovieListViewModelData {
    func getNumberOfMovies() -> Int
    func getMoviesList() -> [Movie]
}

class MovieListViewModel: MovieListViewModelData {
    private var moviesList: [Movie]
    
    init(moviesList: [Movie]) {
        self.moviesList = moviesList
    }
    
    func getNumberOfMovies() -> Int {
        return moviesList.count
    }
    
    func getMoviesList() -> [Movie] {
        return moviesList
    }
}
