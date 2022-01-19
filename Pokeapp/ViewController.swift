//
//  ViewController.swift
//  Pokeapp
//
//  Created by etudiant on 19/01/2022.
//

import UIKit
import Alamofire
import SwiftUI
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var buttonGeneratePokemon: UIButton!
    private var pokemons: [Pokemon] = []
    @IBOutlet weak var tableView: UITableView!
    
    let group = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func onClickGeneratePokemons(_ sender: Any) {
        self.getPokemons()
    
        
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    private func getPokemons() {
        for _ in 1...10 {
            self.group.enter()
            let id = Int.random(in: 1...898)
            
            AF.request("https://pokeapi.co/api/v2/pokemon/\(id)", method: .get)
                .validate(statusCode: [200])
                .responseDecodable(of: PokemonResponse.self) {[weak self] resp in
                    switch resp.result {
                    case .success(let pokemonresponse):
                        
                        // Concatener les types
                        var typesConcat: [String] = []
                        for type in pokemonresponse.types {
                            typesConcat.append(type.type?.name ?? "Aucun type")
                        }
                        
                        let tempPokemon = Pokemon(id: pokemonresponse.id, name: pokemonresponse.name, sprite: pokemonresponse.sprites?.front_default, types: typesConcat.joined(separator: ", "), sprite_shiny: pokemonresponse.sprites?.front_shiny, height: pokemonresponse.height, weight: pokemonresponse.weight)
                    
                        self?.pokemons.append(tempPokemon)
                        self?.group.leave()
                        
                    case .failure(let error):
                        print("Erreur : \(error)")
                        self?.group.leave()
                    }
                }
        }
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pokemonSelected = pokemons[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InfoPokemon") as? InfoPokemonViewController
        vc?.pokemonInfo = pokemonSelected
        
        if let vc = vc {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return the datasource
        return pokemons.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCellId", for: indexPath) as? PokemonTableViewCell
        
        // Get the image
        
        let url = URL(string: pokemon.sprite ?? "https://pngimg.com/uploads/pokeball/pokeball_PNG8.png")
        if let url = url {
            cell?.pokemonImageView.kf.setImage(with: url)
        }
        
        cell?.pokemonNameLabel.text = "Name: \(pokemon.name!)"
        cell?.pokemonTypeLabel.text = "Type(s):  \(pokemon.types!)"

        if let cell = cell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

