//
//  EpisModel.swift
//  RickAndMorty
//
//  Created by Сергей Сырбу on 14.11.2023.
//

import Foundation
import UIKit


 //MARK: - Episod
struct Episod: Codable {
    var results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let episode: String?
    let characters: [String]?
    let url: String?
    let created: String?
}

// MARK: - Chsracters
struct Characters: Codable {
    let results: [ResultCharacter]?
}

// MARK: - Result
struct ResultCharacter: Codable {
    let episode: [String]?
    let id: Int?
    let name: String?
    let type: String?
    let image: String?
    let url: String?
    let created: String?
    let species: String?
}

