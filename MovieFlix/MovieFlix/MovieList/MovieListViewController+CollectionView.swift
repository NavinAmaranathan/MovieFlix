//
//  MovieListViewController+CollectionView.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import UIKit

// MARK: UICollectionViewDelegate methods

extension MovieListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
            detailVC.movie = viewModel?.getMoviesList()[indexPath.row]
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

// MARK: UICollectionViewDataSource methods

extension MovieListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getNumberOfMovies() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.movie = viewModel?.getMoviesList()[indexPath.row]
        cell.configure()
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout methods

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 300)
    }
}
