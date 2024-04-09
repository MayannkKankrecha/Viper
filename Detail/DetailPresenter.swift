//
//  DetailPresenter.swift
//  Viper
//
//  Created by Mayank Kankrecha on 04/04/24.
//  
//

import Foundation

class DetailPresenter: ViewToPresenterDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    
}
