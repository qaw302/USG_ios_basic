//
//  FlowerTableViewController.swift
//  AirCnCa1
//
//  Created by 박미정 on 2022/03/04.
//

import UIKit

let mj = User(name: "박미정", image: "박미정")
let kiki = User(name: "키키", image: "키키")
let white = User(name: "흰둥이", image: "흰둥이")
let bbangsik = User(name: "빵식이", image: "빵식이")

class CoffeeTableViewController: UITableViewController {
    
    var coffees = [Coffee(name:"아메리카노", tumbnail: "아메리카노1", detailImage: ["아메리카노1", "아메리카노2"], price: 1500, size: Size(w: 10, t: "ice / hot", h: 20), user: mj), Coffee(name:"카페라떼", tumbnail: "카페라떼1", detailImage: ["카페라떼1", "카페라떼2"], price: 2000, size: Size(w: 10, t: "ice / hot", h: 20), user: kiki), Coffee(name:"카푸치노", tumbnail: "카푸치노1", detailImage: ["카푸치노1", "카푸치노2"], price: 1800, size: Size(w: 10, t: "ice / hot", h: 20), user: white), Coffee(name:"카페모카", tumbnail: "카페모카1", detailImage: ["카페모카1","카페모카2"], price: 2500, size: Size(w: 10, t: "ice / hot", h: 20), user: bbangsik)]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coffees.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeCell", for: indexPath)

        // Configure the cell...
        let coffee = coffees[indexPath.row]
        
        cell.textLabel?.text = coffee.name
        cell.detailTextLabel?.text = coffee.user.name
        cell.imageView?.image = UIImage(named: coffee.tumbnail)
        
        return cell
    }
    
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell
           , let indexPath = tableView.indexPath(for: cell)
           , let detailVC = segue.destination as? ViewControllerZ
           }
    }
*/

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? ViewController,
           let cell = sender as? UITableViewCell,
           let index = self.tableView.indexPath(for: cell) {
        
            let coffeedata = coffees[index.row]
            detailVC.coffeedata = coffeedata
            
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
