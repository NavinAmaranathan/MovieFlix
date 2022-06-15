//
//  ViewController.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    private var viewModel: ViewModelData = ViewModel(_networkManager: NetworkManager.shared, _validator: FieldValidator.shared)
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    
    // MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    // MARK: - Action methods
    
    @IBAction func didTapLogin() {
        showLoadingSpinner()
        if viewModel.validateFields(username.text, password.text) {
            viewModel.fetchData(for: APIConstants.nowPlaying.rawValue)
        } else {
            displayValidationError()
        }
    }
    
    // MARK: - Private methods

    private func displayValidationError() {
        CustomAlert.alert.show(over: self, type: .validationFailure) {
            self.hideLoadingSpinner()
            self.resetTextFields()
        }
    }
    
    private func showLoadingSpinner() {
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    private func hideLoadingSpinner() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    private func resetTextFields() {
        username.text = nil
        password.text = nil
    }
}

// MARK: - ViewModelDelegate methods

extension ViewController: ViewModelDelegate {
    func failedToGetAPIData() {
        CustomAlert.alert.show(over: self, type: .apiFailure)
    }
    
    func didReceiveAPIData(data: [Movie]) {
        DispatchQueue.main.async {
            self.resetTextFields()
            self.hideLoadingSpinner()
            if let movieListVC = self.navigationController?.storyboard?.instantiateViewController(withIdentifier: "MovieList") as? MovieListViewController {
                movieListVC.moviesList = data
                self.navigationController?.pushViewController(movieListVC, animated: true)
            }
        }
    }
}
