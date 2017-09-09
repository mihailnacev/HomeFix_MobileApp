//
//  ViewController.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 8/22/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class RegistrationOne: UIViewController {

  @IBOutlet weak var FirstNameField: UITextField!
  @IBOutlet weak var LastNameField: UITextField!
  @IBOutlet weak var UserNameField: UITextField!
  @IBOutlet weak var PasswordField: UITextField!
  @IBOutlet weak var NextStepButton: UIButton!
  
  var semaphore = DispatchSemaphore( value: 0 )
  var success = false
    
  override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


  func checkFielValidity() -> Bool{
    return
      !(self.FirstNameField.text?.isEmpty)! &&
      !(self.LastNameField.text?.isEmpty)! &&
      !(self.UserNameField.text?.isEmpty)! &&
      !(self.PasswordField.text?.isEmpty)!
  }
  
  func clearFields(){
    self.FirstNameField.text = ""
    self.LastNameField.text = ""
    self.UserNameField.text = ""
    self.PasswordField.text = ""
  }
  
  func enableDisableFields(value: Bool){
    self.FirstNameField.isUserInteractionEnabled = value
    self.LastNameField.isUserInteractionEnabled = value
    self.UserNameField.isUserInteractionEnabled = value
    self.PasswordField.isUserInteractionEnabled = value
    self.NextStepButton.isUserInteractionEnabled = value
  }
  
  func performRegistration() -> Bool {
    if (!checkFielValidity()){
      print("The fields are required");
      self.success = false
      self.semaphore.signal()
      return false;
    }
    
    var headers: Dictionary<String, String> = Dictionary<String, String>()
    headers.updateValue("application/json", forKey: "Content-Type")
    
    let model = UserRegistrationModel(FirstName: self.FirstNameField.text!, LastName: self.LastNameField.text!, UserName: self.UserNameField.text!, Password: self.PasswordField.text!)
    
    BaseService.PostRequest(urlString: "\(BaseService.baseURL)account/register", headers: headers, bodyDictionary: model.toJSON(), completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in

      if (error != nil){
        print("Error has occured. The data are not saved");
        self.success = false
        self.semaphore.signal()
        return
      }
      
      let JSONData = String(data: data!, encoding: String.Encoding.utf8) ?? "{}"
      var users: Users;
      do {
        let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions())
        users = Users(data: dataDictionary as! [String : AnyObject])
      } catch {
        print("Error deserializing")
        self.success = false
        self.semaphore.signal()
        return;
      }
      
      self.success = true
      self.semaphore.signal()
      
      print("Id: \(users.Id ?? -1)");
      print("Data: \(JSONData)");
      
            })
    return true
  }
  
  @IBAction func NextStepClick(_ sender: UIButton) {
    enableDisableFields(value: false);
    if (!performRegistration()){
      enableDisableFields(value: true)
      print("Unsuccessfull attempt")
    }
  }

  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    semaphore.wait()
    enableDisableFields(value: true)
    let check = checkFielValidity() && success
    if (check){
            clearFields()
    }
    
    return check
  }
  
}

