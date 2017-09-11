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
  @IBOutlet var Progress: UIActivityIndicatorView!
    
  override func viewDidLoad() {
    if ApplicationUser.getInstance() != nil {
      if (ApplicationUser.isTokenExpired()){
        ApplicationUser.desctroyInstance()
      } else {
        self.navigationController?.popToRootViewController(animated: true);
        return;
      }
    } else {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.NextStepButton.isEnabled = false
      self.Progress.stopAnimating();
    }
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  func displayErroWarning(message: String){
    let alertController = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
    
    self.present(alertController, animated: true, completion: nil)
  }
  
  func displaySuccessAndContinue(){
    let alertController = UIAlertController(title: "Success", message: "You have successfully registered. Now you will proceed to the login screen.", preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction) in
      self.performSegue(withIdentifier: "RegistrationSuccessfull", sender: alert)
    }))
  
    self.present(alertController, animated: true, completion: nil)
  }


  func checkFieldValidity() -> Bool{
    return
      self.FirstNameField.hasText &&
      self.LastNameField.hasText &&
      self.UserNameField.hasText &&
      self.PasswordField.hasText
  }
  
  @IBAction func ValueChange(_ sender: UITextField) {
    self.NextStepButton.isEnabled = checkFieldValidity();
  }
  
  func enableDisableFields(value: Bool){
    self.FirstNameField.isEnabled = value
    self.LastNameField.isEnabled = value
    self.UserNameField.isEnabled = value
    self.PasswordField.isEnabled = value
    self.NextStepButton.isEnabled = value
  }
  
  func performRegistration() -> Bool {
    if (!checkFieldValidity()){
      self.displayErroWarning(message: "All of the fields are required");
      return false;
    }
    
    var headers: Dictionary<String, String> = Dictionary<String, String>()
    headers.updateValue("application/json", forKey: "Content-Type")
    
    let model = UserRegistrationModel(FirstName: self.FirstNameField.text!, LastName: self.LastNameField.text!, UserName: self.UserNameField.text!, Password: self.PasswordField.text!)
    
    BaseService.PostRequest(urlString: "\(BaseService.baseURL)api/account/register", headers: headers, bodyDictionary: model.toJSON(), completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in

      if (error != nil){
        DispatchQueue.main.async {
          self.displayErroWarning(message: "Something went wrong. The data is not saved. Try again!");
          self.enableDisableFields(value: true)
        }
        
        return
      }
      
      DispatchQueue.main.async {
        self.enableDisableFields(value: true)
      self.Progress.stopAnimating()
      }
      
      
      let httpresponse = response as? HTTPURLResponse
      if ((httpresponse?.statusCode)! >= 200 && (httpresponse?.statusCode)! <= 299 ){
        DispatchQueue.main.async {
           self.displaySuccessAndContinue()
        }
      }
      
      })
    return true
  }
  
  @IBAction func NextStepClick(_ sender: UIButton) {
    Progress.startAnimating()
    enableDisableFields(value: false);
    if (!performRegistration()){
      Progress.stopAnimating()
      enableDisableFields(value: true)
    }
  }
  
}

