//
//  HomeViewController.swift
//  Viper
//
//  Created by Mayank Kankrecha on 05/04/24.
//  
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?
    
    // MARK: - @IBOutlet
    @IBOutlet weak var tblList: UITableView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        registerXib()
        self.navigationController?.title = "News"
    }
    
    func registerXib() {
        tblList.dataSource = self
        tblList.delegate = self
        tblList.register(UINib(nibName: "NewsListViewCell", bundle: nil), forCellReuseIdentifier: "NewsListViewCell")
    }
}

extension HomeViewController: PresenterToViewHomeProtocol{

    // TODO: Implement View Output Methods
    func sucessCallBack() {
        tblList.reloadData()
    }
    
    func failureCallBack() {
        print("APi Call Fail")
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.interactor?.article?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListViewCell", for: indexPath) as? NewsListViewCell {
            cell.setUpUi(news: presenter?.interactor?.tableViewCellForRowAt(indexPath: indexPath))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.router?.nextScreen()
    }
}
