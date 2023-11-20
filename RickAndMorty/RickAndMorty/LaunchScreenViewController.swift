//
//  LaunchScreenViewController.swift
//  RickAndMorty
//
//  Created by Сергей Сырбу on 11.11.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    let nameImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Loading")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
            self.animate()
        })
        
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        nameImage.frame = CGRect(x: 45, y: 109, width: 303, height: 212)
        logoImage.frame = CGRect(x: 45, y: 329, width: 300, height: 300)
        [nameImage, logoImage].forEach {view.addSubview($0)}
    }
    
    private func animate() {
        for _ in 0...2 {
            UIView.animate(withDuration: 4, delay: 0.0, options: .curveLinear, animations: {
                self.logoImage.transform = self.logoImage.transform.rotated(by: .pi)
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            let vc = TabBarController()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        })
        
    }
}

