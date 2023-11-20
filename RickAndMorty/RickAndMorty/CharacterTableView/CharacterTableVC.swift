//
//  CharacterTableVC.swift
//  RickAndMorty
//
//  Created by Сергей Сырбу on 19.11.2023.
//

import UIKit

class CharacterTableVC: UIViewController {

    var charactTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupNavigationItem()
    }

 
    
    func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "logoNav"), style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.backBarButtonItem?.title = "GO BACK"
        navigationItem.backButtonTitle = "GO BACK"
    }
    
    func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(CharacterTableVCell.self, forCellReuseIdentifier: "CharacterTableVCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}

extension CharacterTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableVCell", for: indexPath) as? CharacterTableVCell else {fatalError()}
        cell.persinImage.image = UIImage(named: "Morty")
        return cell
    }
    
    
}
