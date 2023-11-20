//
//  EpisodesViewCell.swift
//  RickAndMorty
//
//  Created by Сергей Сырбу on 12.11.2023.
//

import UIKit

class EpisodesViewCell: UICollectionViewCell {
    
    let characterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Character"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "type"
        return label
    }()
    
    let seriesView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 249/256, green: 249/256, blue: 249/256, alpha: 1)
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        view.layer.shadowRadius = 4.0
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    let seriesImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "play.tv")
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        return image
    }()
    
    let seriesLabel: UILabel = {
        let label = UILabel()
        label.text = "SERIES / number 1"
        return label
    }()
    
    let likeSeriesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "suit.heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .light, scale: .medium)), for: .normal)
        button.tintColor = UIColor(red: 17/256, green: 176/256, blue: 200/256, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setuplikeSeriesButton()
        likeSeriesButton.addTarget(self, action: #selector(setuplikeSeriesButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(episodes: Episod, indexPath: IndexPath){ //
   
        self.seriesLabel.text = episodes.results?[indexPath.row].episode
    }
    func configureCharacters(characters: Characters, indexPath: IndexPath){ //

        guard let url = URL(string: characters.results?[indexPath.row].image ?? "nil") else {return}
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: data!)
            }
        }
        self.nameLabel.text = characters.results![indexPath.row].name
        self.typeLabel.text = characters.results![indexPath.row].species
    }
    
    @objc func setuplikeSeriesButton(){
        if likeSeriesButton.isSelected {
            likeSeriesButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .light, scale: .medium)), for: .normal)
            likeSeriesButton.tintColor = .red
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                for _ in 0...1 {
                    self.likeSeriesButton.transform = self.likeSeriesButton.transform.rotated(by: .pi)
                }
            })
            likeSeriesButton.isSelected = false
        } else {
            likeSeriesButton.tintColor = UIColor(red: 17/256, green: 176/256, blue: 200/256, alpha: 1)
            likeSeriesButton.setImage(UIImage(systemName: "suit.heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .light, scale: .medium)), for: .normal)
            likeSeriesButton.isSelected = true
        }
    }
}

extension EpisodesViewCell {
    func setupLayout() {
        [seriesImage, seriesLabel, likeSeriesButton].forEach {seriesView.addSubview($0)}
        [characterImage, nameLabel, typeLabel, seriesView].forEach {contentView.addSubview($0)}
        
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            characterImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -22),
//            characterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -22),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            typeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -22),
            typeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        seriesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seriesView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            seriesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            seriesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            seriesView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -22),
            seriesView.heightAnchor.constraint(equalToConstant: 71)
        ])
        seriesImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seriesImage.leadingAnchor.constraint(equalTo: seriesView.leadingAnchor, constant: 22),
            seriesImage.centerYAnchor.constraint(equalTo: seriesView.centerYAnchor),
            seriesImage.heightAnchor.constraint(equalToConstant: 35),
            seriesImage.widthAnchor.constraint(equalToConstant: 35)
        ])
        seriesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seriesLabel.leadingAnchor.constraint(equalTo: seriesImage.trailingAnchor, constant: 10),
            seriesLabel.centerYAnchor.constraint(equalTo: seriesView.centerYAnchor)
        ])
        likeSeriesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeSeriesButton.trailingAnchor.constraint(equalTo: seriesView.trailingAnchor, constant: -18),
            likeSeriesButton.centerYAnchor.constraint(equalTo: seriesView.centerYAnchor)
        ])
        
    }
}
