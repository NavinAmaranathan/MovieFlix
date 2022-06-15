//
//  MovieListViewController.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import UIKit

class MovieListViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet var collectionView: UICollectionView!
    
    var moviesList: [Movie]?
    var viewModel: MovieListViewModelData?
    
    // MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let moviesList = moviesList else {
            fatalError()
        }
        viewModel = MovieListViewModel(moviesList: moviesList)
        setupUI()
    }
    
    // MARK: - Private methods

    private func setupUI() {
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
