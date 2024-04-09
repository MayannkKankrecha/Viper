//
//  HomeRouter.swift
//  Viper
//
//  Created by Mayank Kankrecha on 05/04/24.
//  
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    var entry: UIViewController?
    
    init(entry: UIViewController? = nil) {
        self.entry = entry
    }
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter(entry: viewController)
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func nextScreen() {
        let detailScreen = DetailRouter.createModule()
        entry?.navigationController?.pushViewController(detailScreen, animated: true)
    }
    
}
