//
//  HomeContract.swift
//  Viper
//
//  Created by Mayank Kankrecha on 05/04/24.
//  
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
    func sucessCallBack()
    func failureCallBack()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    
    func updateView()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    var article: [Articles]? { get set }
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    func apiCall()
    func tableViewCellForRowAt(indexPath: IndexPath) -> Articles?
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    func sucess(value: [Articles]?)
    func failure(error: String?)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    var entry: UIViewController? { get set }
    func nextScreen()
}
