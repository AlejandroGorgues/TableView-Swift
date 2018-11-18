//
//  ProvinciasTableViewController.swift
//  Practica5
//
//  Created by XCode on 6/11/18.
//  Copyright © 2018 XCode. All rights reserved.
//
import UIKit

class ProvinciasTableViewController: UITableViewController {
    
    var provincias = ["Albacete", "Alicante/Alacant", "Almería", "Araba/Álava", "Asturias", "Ávila", "Badajoz", "Balears, Illes", "Barcelona", "Bizkaia", "Burgos", "Cáceres", "Cádiz", "Cantabria", "Castellón/Castelló", "Ciudad Real", "Córdoba", "Coruña, A", "Cuenca", "Gipuzkoa", "Girona", "Granada", "Guadalajara", "Huelva", "Huesca", "Jaén", "León", "Lleida", "Lugo", "Madrid", "Málaga", "Murcia", "Navarra", "Ourense", "Palencia", "Palmas, Las", "Pontevedra", "Rioja, La", "Salamanca", "Santa Cruz de Tenerife", "Segovia", "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia/València", "Valladolid", "Zamora", "Zaragoza", "Ceuta", "Melilla"]

    override func viewDidLoad() {
        super.viewDidLoad()
        if((UserDefaults.standard.object(forKey: "provincias")) != nil){
            provincias = UserDefaults.standard.object(forKey: "provincias") as! [String]
        }else{
            UserDefaults.standard.set(provincias, forKey: "provincias")
        }
        
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provincias.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel!.text = provincias[indexPath.row]
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow?.row
        var datosProvincia: String = ""
        
        if((UserDefaults.standard.object(forKey: provincias[indexPath!])) != nil){
            datosProvincia = UserDefaults.standard.string(forKey: provincias[indexPath!])!
        }
        (segue.destination as! DatoProvinciaViewController).nProvincia = provincias[indexPath!]
        (segue.destination as! DatoProvinciaViewController).dProvincia = datosProvincia
    
    }

 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            provincias.remove(at: indexPath.row)
            UserDefaults.standard.set(self.provincias, forKey: "provincias")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedObject = self.provincias[fromIndexPath.row]
        provincias.remove(at: fromIndexPath.row)
        provincias.insert(movedObject, at: to.row)
        UserDefaults.standard.set(self.provincias, forKey: "provincias")
    }
 

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
 

    
    @IBAction func addProvincia(){
        
        let alert = UIAlertController(title: "Añadir provincia", message: "Escriba la nueva provincia", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (textoProvincia) -> Void in
            textoProvincia.placeholder = "Provincia"
        }
        alert.addAction(UIAlertAction(title: "Añadir", style: .default, handler: {UIAlertAction in
            self.provincias.append(alert.textFields![0].text!)
            UserDefaults.standard.set(self.provincias, forKey: "provincias")
            self.tableView.reloadData()
        }))  
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func toggleEdit (sender: UIBarButtonItem) {
        if isEditing {
            setEditing(false, animated: true)
            sender.title = "Edit"
        }
        else {
            setEditing(true, animated: true)
            sender.title = "Done" }
    }

}
