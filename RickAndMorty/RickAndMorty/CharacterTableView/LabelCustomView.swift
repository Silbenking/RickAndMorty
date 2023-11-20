//
//  LabelCustomView.swift
//  RickAndMorty
//
//  Created by Сергей Сырбу on 19.11.2023.
//

import UIKit

struct LabelStruct {
    let descriptionText: String
    let fillingText: String
}

final class LabelCustomView: UIView {

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    } ()
    
    private let fillingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let lineUIView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.systemGray
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [descriptionLabel, fillingLabel, lineUIView].forEach { addSubview($0)}
        
//        addSubview(descriptionLabel)
//        addSubview(fillingLabel)
//        lineUIView
    
        self.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 64),
            self.widthAnchor.constraint(equalToConstant: 312)
        ])
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 9)
        ])
        fillingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fillingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            fillingLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5)
        ])
        lineUIView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineUIView.widthAnchor.constraint(equalTo: self.widthAnchor),
            lineUIView.heightAnchor.constraint(equalToConstant: 1),
            lineUIView.topAnchor.constraint(equalTo: fillingLabel.bottomAnchor, constant: 12)
        ])


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with descriptionModel: LabelStruct) {
        descriptionLabel.text = descriptionModel.descriptionText
        fillingLabel.text = descriptionModel.fillingText
    }

}
