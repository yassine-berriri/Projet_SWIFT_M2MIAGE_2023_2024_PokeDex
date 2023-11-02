import UIKit

class TableViewControllerPokemons: UITableViewController {
    var selectedType: PokemonType?
    var datasource = [Pokemon]()
    var selectedPokemon: Generation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedType = selectedType {
            print("selectedType = ",  selectedType.url )
            guard let url = URL(string: selectedType.url) else { return }
            let task = URLSession.shared.dataTask(with: url) { data, resp, err in
                if let err = err {
                    print("Une erreur est survenue : ", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let json = try JSONDecoder().decode(Pokedex2.self, from: data)
                    print("json = ", json)
                    self.datasource = json.pokemon
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let decodeErr {
                    print("Erreur de décodage :", decodeErr)
                }
            }
            task.resume()
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
        cell.textLabel?.text = datasource[indexPath.row].pokemon.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPokemon = datasource[indexPath.row].pokemon
        performSegue(withIdentifier: "showPokemonDetails", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPokemonDetails" {
            let dest = segue.destination as! ViewControllerPokemon
            dest.selectedPokemon = selectedPokemon
        }
    }
}
