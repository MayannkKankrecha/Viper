//
//  DetailViewController.swift
//  Viper
//
//  Created by Mayank Kankrecha on 04/04/24.
//  
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterDetailProtocol?
    
}

extension DetailViewController: PresenterToViewDetailProtocol{
    // TODO: Implement View Output Methods
}
