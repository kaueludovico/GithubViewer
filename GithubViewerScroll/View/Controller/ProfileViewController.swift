//
//  ProfileViewController.swift
//  GithubViewerScroll
//
//  Created by Kaue Ludovico on 23/02/23.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    
//    var customView = ProfileTestView()
//    var customView = ProfileScreenView()
    var customView = ProfileTest1()
    
    var repositories: [Repository]?
    
    init(user: User) {
        super.init(nibName: "ProfileViewController", bundle: nil)
        setupViews(user: user)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        self.navigationItem.title = "Perfil"
    }
    
    override func viewDidLayoutSubviews() {
        print(customView.tableView.contentSize.height)
    }

    override func viewDidAppear(_ animated: Bool) {
        /*
         * Depois de obtido o tamanho do conteúdo presente na tabela (durante a aparição da tela),
         * esse valor é passado via didSet para dentro da customView.
         */
        customView.heightTableView = customView.tableView.contentSize.height
    }
    
    func setupDelegates() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    
    func setupViews(user: User) {
        
        // Container 1 -> Foto de perfil e nome
        customView.user = user
        
        // Container 2 -> WebView
        customView.dataView.load(URLRequest(url: URL(string: "https://github-readme-stats.vercel.app/api/top-langs/?username=\(user.login)&layout=compact&langs_count=7&theme=dracula")!))
        
        getUser(user: user)
        
    }
    
    func getUser(user: User) {
        let stringUrl = "https://api.github.com/users/\(user.login)/repos"
        
        AF.request(stringUrl).response { response in
            
            if let data = response.data {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let model = try? decoder.decode(Array<Repository>.self, from: data) else { return }
                
                    self.repositories = model
                
                self.customView.tableView.reloadData()
            }
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = repositories?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customView.cellId, for: indexPath) as! RepositoryTableViewCell
        
        if let item = repositories?[indexPath.item] {
            cell.repository = item
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
