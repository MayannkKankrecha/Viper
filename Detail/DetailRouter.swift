//
//  DetailRouter.swift
//  Viper
//
//  Created by Mayank Kankrecha on 04/04/24.
//  
//

import Foundation
import UIKit

class DetailRouter: PresenterToRouterDetailProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let presenter: ViewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = DetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
