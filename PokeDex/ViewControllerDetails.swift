//
//  ViewControllerDetails.swift
//  PokeDex
//
//  Created by user246016 on 10/31/23.
//

import UIKit

class ViewControllerDetails: UIViewController {

    @IBOutlet weak var pokimonImg: UIImageView!
    @IBOutlet weak var miageImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloadImage(from: "https://univ-cotedazur.fr/medias/photo/logo-miage_1623768047265-jpg") { image in
            self.miageImg.image = image
        }
        
        self.downloadImage(from: "https://www.pokepedia.fr/images/7/76/Pikachu-DEPS.png") { image in
            self.pokimonImg.image = image
        }

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
