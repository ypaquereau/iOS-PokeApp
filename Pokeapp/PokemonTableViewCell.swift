//
//  PokemonTableViewCell.swift
//  Pokeapp
//
//  Created by etudiant on 19/01/2022.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .systemYellow
        pokemonNameLabel.numberOfLines = 0
        pokemonNameLabel.textColor = .white
        pokemonNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        
        pokemonTypeLabel.numberOfLines = 0
        pokemonTypeLabel.textColor = .white
        pokemonTypeLabel.font = .systemFont(ofSize: 17, weight: .bold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
