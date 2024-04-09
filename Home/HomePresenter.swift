//
//  HomePresenter.swift
//  Viper
//
//  Created by Mayank Kankrecha on 05/04/24.
//  
//

import Foundation
import UIKit

class HomePresenter: ViewToPresenterHomeProtocol {

    // MARK: Properties
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    func updateView() {
        interactor?.apiCall()
        print("View Update")
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {

    
    func sucess(value: [Articles]?) {
        interactor?.article = value
        view?.sucessCallBack()
        print(interactor?.article)
        
    }
    
    func failure(error: String?) {
        view?.failureCallBack()
        print("Alert in Failure")
    }
    
}
