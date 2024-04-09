//
//  HomeInteractor.swift
//  Viper
//
//  Created by Mayank Kankrecha on 05/04/24.
//  
//

import Foundation
import Alamofire

class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    var article: [Articles]?
    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
    
    func tableViewCellForRowAt(indexPath: IndexPath) -> Articles? {
        return article?[indexPath.row]
    }
    
    func apiCall() {
        let apiKey = "32d99f2c93834d0caac30dfc8335c301"
        let url = "https://newsapi.org/v2/top-headlines"
        let parameters: [String: Any] = [
            "country": "in",
            "apiKey": apiKey
        ]
        print("Api Call")
        AF.request(url,parameters: parameters).response { responce in
            switch responce.result{
            case.success(_):
                if let data = responce.data{
                    do {
                        let userResponce = try JSONDecoder().decode(GetAllNews.self, from: data)
                        print("________")
                        self.article = userResponce.articles
                        self.presenter?.sucess(value: userResponce.articles)
                    } catch let err {
                        print(err.localizedDescription)
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
                self.presenter?.failure(error: err.localizedDescription)
            }
        }
    }
}
