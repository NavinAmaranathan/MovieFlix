//
//  ViewModel.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func didReceiveAPIData(data: [Movie])
    func failedToGetAPIData()
}

protocol ViewModelData {
    var delegate: ViewModelDelegate? { get set }
    func validateFields(_ userName: String?, _ password: String?) -> Bool
    func fetchData(for url: String)
}

class ViewModel: ViewModelData {    
    // MARK: - Properties
    weak var delegate: ViewModelDelegate?
    private var networkManager: NetworkManager?
    private var validator: FieldValidator?
    
    // MARK: - init

    init(_networkManager: NetworkManager, _validator: FieldValidator) {
        networkManager = _networkManager
        validator = _validator
    }
    
    // MARK: - Methods

    func validateFields(_ userName: String?, _ password: String?) -> Bool {
       return validator?.validateUserInput(userName, password) ?? false
    }
    
    func fetchData(for url: String) {
        networkManager?.getDataFromServer(for: url, resultType: MovieFlixModel.self, completionHandler: { result in
            guard let result = result else {
                self.delegate?.failedToGetAPIData()
                return
            }
            self.delegate?.didReceiveAPIData(data: result.results)
        })
    }
}
