//
//  ViewController.swift
//  GithubViewerScroll
//
//  Created by Kaue Ludovico on 23/02/23.
//

import UIKit
import Alamofire


class SearchViewController: UIViewController {
    
    var customView = SearchScreenView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.searchButton.addTarget(self, action: #selector(getUser), for: .touchUpInside)
    }
    
    @objc func getUser() {
        let stringUrl = "https://api.github.com/users/\(customView.searchField.text!)"
        
        AF.request(stringUrl).response { response in
            guard let data = response.data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let model = try? decoder.decode(User.self, from: data)
            if let model = model {
                self.navigateToProfile(user: model)
            }
        }
    }
    
    func navigateToProfile(user: User) {
        let profileViewController = ProfileViewController(user: user)
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}

