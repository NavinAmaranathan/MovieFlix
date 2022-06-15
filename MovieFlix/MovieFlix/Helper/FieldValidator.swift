//
//  FieldValidator.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import Foundation

final class FieldValidator {
    
    static let shared = FieldValidator()
    
    func validateUserInput(_ userName: String?, _ password: String?) -> Bool {
        guard let userName = userName, let password = password, (!userName.isEmpty && !password.isEmpty && password.count >= 6) else {
            return false
        }
        return true
    }
}
