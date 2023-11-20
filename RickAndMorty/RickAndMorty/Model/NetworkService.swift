//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Сергей Сырбу on 14.11.2023.
//

import Foundation
class NetworkService {
    
   static let shared = NetworkService()
    private init() {}
    
    private func createURLEpis() -> URL? {
        let urlSTREpisodes = "https://rickandmortyapi.com/api/episode"
        let urlEpised = URL(string: urlSTREpisodes)
        return urlEpised
    }
    private func createURLCharacters() -> URL? {
        let urlSTRCharacters = "https://rickandmortyapi.com/api/character"
        let urlCharacters = URL(string: urlSTRCharacters)
        return urlCharacters
    }
    
    func fetchDataEpisedes(complition: @escaping (Swift.Result<Episod, Error>) -> ()) {
        guard let url = createURLEpis() else {
            complition(.failure(NetworkError.badURL))
            print("badURL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error{
                    complition(.failure(error))
                    print("no data")
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let userData = try decoder.decode(Episod.self, from: data)
                complition(.success(userData))
            } catch {
                complition(.failure(NetworkError.invalidData))
                print("invalodData")
            }
            
        }.resume()
    }
    func fetchDataCharacters(complition: @escaping (Swift.Result<Characters, Error>) -> ()) {
        guard let url = createURLCharacters() else {
            complition(.failure(NetworkError.badURL))
            print("badURL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error{
                    complition(.failure(error))
                    print("no data")
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let userData = try decoder.decode(Characters.self, from: data)
                complition(.success(userData))
            } catch {
                complition(.failure(NetworkError.invalidData))
                print("invalodData")
            }
            
        }.resume()
    }
}

enum NetworkError: Error {
    case badURL
    case invalidData
}
