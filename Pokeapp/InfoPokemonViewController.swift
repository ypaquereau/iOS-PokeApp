//
//  InfoPokemonViewController.swift
//  Pokeapp
//
//  Created by etudiant on 19/01/2022.
//

import UIKit
import Kingfisher

class InfoPokemonViewController: UIViewController {

    @IBOutlet weak var normalSprite: UIImageView!
    @IBOutlet weak var shinySprite: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonTypes: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    public var pokemonInfo: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weightKg = Double(pokemonInfo?.weight ?? 0) * 0.1
        let heightCM = Double(pokemonInfo?.height ?? 0) * 10
        
        pokemonName.text = pokemonInfo?.name
        
        // image
        
        let urlNormal = URL(string: pokemonInfo?.sprite ?? "https://pngimg.com/uploads/pokeball/pokeball_PNG8.png")
        if let urlNormal = urlNormal {
            normalSprite.kf.setImage(with: urlNormal)
        }
        
        let urlShiny = URL(string: pokemonInfo?.sprite_shiny ?? "https://pngimg.com/uploads/pokeball/pokeball_PNG8.png")
        if let urlShiny = urlShiny {
            shinySprite.kf.setImage(with: urlShiny)
        }
        
        pokemonTypes.text = "Type(s): \(pokemonInfo?.types ?? "No type")"
        pokemonHeight.text = "Height: \(heightCM) cm"
        pokemonWeight.text = "Weight: \(weightKg) KG"
        
        
        
    }
    


}
