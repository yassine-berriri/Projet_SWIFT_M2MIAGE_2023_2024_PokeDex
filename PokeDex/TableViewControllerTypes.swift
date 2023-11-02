//
//  TableViewControllerTypesTableViewController.swift
//  PokeDex
//
//  Created by user246016 on 10/31/23.
//

import UIKit


class TableViewControllerTypes: UITableViewController {

    var datasource = [PokemonType]()
    var selectedType: PokemonType?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "https://pokeapi.co/api/v2/type") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                print("Une erreur est survenue : ", err)
                return
            }
            
            guard let data = data else { return }
            
            guard let json = try? JSONDecoder().decode(Pokedex.self, from: data) else { return }
            print("json = ",json)
            self.datasource = json.results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath)
        cell.largeContentTitle = datasource[indexPath.row].name
        cell.textLabel?.text = datasource[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedType = datasource[indexPath.row]
        performSegue(withIdentifier: "showPokemons", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPokemons" {
            let dest = segue.destination as! TableViewControllerPokemons
            dest.selectedType = selectedType
        }
    }

}
