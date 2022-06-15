//
//  APIConstants.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import Foundation

enum APIConstants: String {
    case nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
    case trailers = "https://api.themoviedb.org/3/movie/209112/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
    case documentation = "https://developers.themoviedb.org/3/movies/get-now-playing"
    case posterPath = "https://image.tmdb.org/t/p/w342"
    case backdropPath = "https://image.tmdb.org/t/p/original"
}
