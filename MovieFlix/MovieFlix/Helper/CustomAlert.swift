//
//  CustomAlert.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import Foundation
import UIKit

enum FailureAlertType {
    case validationFailure
    case apiFailure
    case standard
    
    var title: String {
        switch self {
        case .validationFailure:
            return "Oops"
        case .apiFailure:
            return "Sorry"
        case .standard:
            return "Don't worry"
        }
    }
    
    var message: String {
        switch self {
        case .validationFailure:
            return "Please enter credentials correctly"
        case .apiFailure:
            return "Try again!!!"
        case .standard:
            return "Try after sometime"
        }
    }
    
    var action: String {
        "Ok"
    }
}

final class CustomAlert {
    
    static let alert = CustomAlert()
    
    func show(over vc: UIViewController, type: FailureAlertType, completionHandler: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: type.title, message: type.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: type.action, style: .default, handler: nil))
            vc.present(alert, animated: true)
            completionHandler?()
        }
    }
}
