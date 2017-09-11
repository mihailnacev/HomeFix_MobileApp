//
//  ContactNumberTableViewController.swift
//  HomeFix_MobileApp
//
//  Created by Gjorche Cekovski on 9/11/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class ContactNumberTableViewController: UITableViewController {
  
  var items: [Contacts] = []
  
  func displayErroWarning(message: String){
    let alertController = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
    
    self.present(alertController, animated: true, completion: nil)
  }
  
  func loadItems(){
    let appuser = ApplicationUser.getInstance()
    items.removeAll()
    
    var headers: Dictionary<String, String> = Dictionary<String, String>()
    headers.updateValue("application/json", forKey: "Content-Type")
    headers.updateValue("\(appuser?.TokenType ?? "") \(appuser?.AccessToken ?? "")", forKey: "Authorization")
    
    BaseService.GetRequest(urlString: "\(BaseService.baseURL)api/contact/number?userId=\(appuser?.TheUser?.Id ?? 0)", headers: headers, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
      
      if (error != nil){
        DispatchQueue.main.async {
          self.displayErroWarning(message: "Something went wrong")
        }
        return
      }
      
      let httpresponse = response as? HTTPURLResponse
      if ((httpresponse?.statusCode)! >= 200 && (httpresponse?.statusCode)! <= 299 ){
        
        do {
          let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
          
          for data in dataDictionary {
            let item = Contacts(data:data)
            self.items.append(item)
          }
        } catch {
          DispatchQueue.main.async {
            self.displayErroWarning(message: "Something went wrong. Not all data could be loaded.")
          }
          return;
        }
        
      }
      
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
      
    })
  }

    override func viewDidLoad() {
      if ApplicationUser.getInstance() != nil {
        if (ApplicationUser.isTokenExpired()){
          self.navigationController?.popToRootViewController(animated: true);
          return;
        }
      } else {
        self.navigationController?.popToRootViewController(animated: true);
        return;
      }
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      loadItems();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactNumberCell", for: indexPath)

        cell.textLabel?.text = "\(items[indexPath.row].PhoneNumber ?? "000")"

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
