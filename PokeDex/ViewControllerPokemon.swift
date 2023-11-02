import UIKit


class ViewControllerPokemon: UIViewController {
    var selectedPokemon: Generation?
    
    @IBOutlet weak var pokemonOrder: UILabel!
    @IBOutlet weak var pokemonBaseExp: UILabel!
    @IBOutlet weak var pokmonWeight: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: selectedPokemon!.url) else { return }
    
        let task = URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                print("Une erreur est survenue : ", err)
                return
            }
            guard let data = data else { return }
          
            do {
                let json = try JSONDecoder().decode(Pokedex3.self, from: data)
                let imgUrl = json.sprites.versions.generationViii.icons.frontDefault
                
                DispatchQueue.main.async {
                    self.pokemonNameLabel.text = json.name
                    self.pokemonBaseExp.text = String(json.baseExperience ?? 0) // Correction ici

                    self.pokmonWeight.text = "weight = " + String(json.weight)
                    self.pokemonOrder.text = "Order = " + String(json.order)
                    self.downloadImage(from: imgUrl) { image in
                        self.pokemonImage.image = image
                    }
                }
            } catch let decodeErr {
                print("Erreur de décodage :", decodeErr)
            }
        }
        task.resume()
    }

    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}
