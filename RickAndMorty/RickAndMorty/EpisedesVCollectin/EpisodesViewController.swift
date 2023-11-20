//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Сергей Сырбу on 11.11.2023.
//

import UIKit

class EpisodesViewController: UIViewController {
   
//    var items: [EpisModel] = [
//        EpisModel(heroImage: "Morty", nameHero: "Rick Morty", typeHero: "Human"),
//        EpisModel(heroImage: "Morty", nameHero: "Rick Morty", typeHero: "Human"),
//        EpisModel(heroImage: "Morty", nameHero: "Rick Morty", typeHero: "Human"),
//        EpisModel(heroImage: "Morty", nameHero: "Rick Morty", typeHero: "Human")
//    ]
    
    var episodArray = [Episod]()
    var characterArray = [Characters]()
    
    var collection: UICollectionView!

    let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.logo
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
        button.setTitle("ADVANCED FILTERS", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = UIColor(red: 227/256, green: 242/256, blue: 253/256, alpha: 1)
        button.imageEdgeInsets.left = -120
        button.layer.cornerRadius = 4
        return button
    }()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        networkClient()
        setupLayout()
        setupSearchController()
        setupCollectionView()
       
     
    }
    //MARK: - setup setupSearchController
    func setupSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Name or episode (ex.S01E01)..."
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.layer.cornerRadius = 8
        searchController.searchBar.layer.borderWidth = 1
        searchController.searchBar.layer.borderColor = UIColor.systemGray.cgColor
    }
    //MARK: - setup collectionView
    func setupCollectionView() {
        collection = UICollectionView(frame: .zero, collectionViewLayout: setupLayoutCollection())
        collection.dataSource = self
        collection.delegate = self
        collection.register(EpisodesViewCell.self, forCellWithReuseIdentifier: "EpisodesViewCell")
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 10),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            collection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)

        ])
    }
    func setupLayoutCollection() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.width, height: 450)
        layout.scrollDirection = .vertical
        return layout
    }
  
    func networkClient() {
        NetworkService.shared.fetchDataEpisedes { result in
            switch result {
            case .success (let userData):
                for _ in userData.results! {
                    self.episodArray.append(userData)
                }
                DispatchQueue.main.async {
                    self.collection.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        NetworkService.shared.fetchDataCharacters { result in
            switch result {
            case .success (let userData):
                for _ in userData.results! {
                    self.characterArray.append(userData)
                }
                DispatchQueue.main.async {
                    self.collection.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            }
        
    }
    
//MARK: - setup layout
    func setupLayout() {
        let searchBar = searchController.searchBar
        
        [logoImage, searchBar, filterButton].forEach {view.addSubview($0)}
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            logoImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            logoImage.heightAnchor.constraint(equalToConstant: 104)
        ])
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 25),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22)
        ])
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            filterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            filterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            filterButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
}

//MARK: - SearchController
extension EpisodesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension EpisodesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        episodArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EpisodesViewCell", for: indexPath) as? EpisodesViewCell else {fatalError()}
        let epis = episodArray[indexPath.row]
        let charact = characterArray[indexPath.row]
        cell.configure(episodes: epis, indexPath: indexPath)
        cell.configureCharacters(characters: charact, indexPath: indexPath)
        return cell
    }
}

extension EpisodesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CharacterTableVC()
        navigationItem.backBarButtonItem?.tintColor = .black
        navigationItem.backButtonTitle = "GO BACK"
        navigationController?.pushViewController(vc, animated: true)
    }
}
