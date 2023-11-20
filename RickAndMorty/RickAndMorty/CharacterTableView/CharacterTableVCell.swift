//
//  CharacterTableVCell.swift
//  RickAndMorty
//
//  Created by Сергей Сырбу on 19.11.2023.
//

import UIKit

class CharacterTableVCell: UITableViewCell {

    let persinImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Morty")
        image.layer.cornerRadius = 148/2
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let changePhoto: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rick Sanchez"
        label.font = .systemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()
    
    let informationLabel: UILabel = {
        let label = UILabel()
        label.text = "Information"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let genderLabel: LabelCustomView = {
        let label = LabelCustomView()
        label.configure(with: LabelStruct(descriptionText: "Gender", fillingText: "Male"))
        return label
    }()
    let statusLabel: LabelCustomView = {
        let label = LabelCustomView()
        label.configure(with: LabelStruct(descriptionText: "Status", fillingText: "Alive"))
        return label
    }()
    let specieLabel: LabelCustomView = {
        let label = LabelCustomView()
        label.configure(with: LabelStruct(descriptionText: "Specie", fillingText: "Human"))
        return label
    }()
    let originLabel: LabelCustomView = {
        let label = LabelCustomView()
        label.configure(with: LabelStruct(descriptionText: "Origin", fillingText: "Earth (C-137)"))
        return label
    }()
    let typeLabel: LabelCustomView = {
        let label = LabelCustomView()
        label.configure(with: LabelStruct(descriptionText: "Type", fillingText: "Unknown"))
        return label
    }()
    let locationLabel: LabelCustomView = {
        let label = LabelCustomView()
        label.configure(with: LabelStruct(descriptionText: "Location", fillingText: "Earth (Replacement Dimension)"))
        return label
    }()
    let infoStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    func setupLayout() {
        [genderLabel, statusLabel, specieLabel, originLabel, typeLabel, locationLabel].forEach {infoStackView.addArrangedSubview($0)}
        [persinImage, changePhoto, nameLabel, informationLabel, infoStackView].forEach {contentView.addSubview($0)}
        persinImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            persinImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            persinImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            persinImage.heightAnchor.constraint(equalToConstant: 148),
            persinImage.widthAnchor.constraint(equalToConstant: 148)
        ])
        changePhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            changePhoto.centerYAnchor.constraint(equalTo: persinImage.centerYAnchor),
            changePhoto.trailingAnchor.constraint(equalTo: persinImage.trailingAnchor, constant: 40)
        ])
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: persinImage.bottomAnchor, constant: 30)
        ])
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            informationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            informationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 18)
        ])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
            infoStackView.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 16)
        ])
        
        infoStackView.axis = .vertical
        
    }
    
    func configure() {
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


