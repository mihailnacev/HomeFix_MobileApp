//
//  MainViewController.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 8/23/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
 
  //LoginSuccessOrAlreadyLogged
  
  @IBOutlet weak var UsernameField: UITextField!
  @IBOutlet weak var PasswordField: UITextField!
  @IBOutlet weak var LoginButton: UIButton!
  @IBOutlet weak var Progress: UIActivityIndicatorView!
  
  @IBAction func LoginClicked(_ sender: UIButton) {
    Progress.startAnimating()
    enableDisableFields(value: false);
    if (!performLogin()){
      Progress.stopAnimating()
      enableDisableFields(value: true)
    }
  }
  
  @IBAction func TextChange(_ sender: UITextField) {
    self.LoginButton.isEnabled = checkFieldValidity();
  }
  
  func displayErroWarning(message: String){
    let alertController = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
    
    self.present(alertController, animated: true, completion: nil)
  }
  
  func displaySuccessAndContinue(){
    self.navigationController?.popToRootViewController(animated: true);
  }
  
    override func viewDidLoad() {
      if ApplicationUser.getInstance() != nil {
        if (ApplicationUser.isTokenExpired()){
          ApplicationUser.desctroyInstance()
        } else {
          self.displaySuccessAndContinue()
          return;
        }
      }
      
      super.viewDidLoad()
        // Do any additional setup after loading the view.
      LoginButton.isEnabled = false
      self.Progress.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func checkFieldValidity() -> Bool{
    return
        self.UsernameField.hasText &&
        self.PasswordField.hasText
  }
  
  func enableDisableFields(value: Bool){
    self.UsernameField.isEnabled = value
    self.PasswordField.isEnabled = value
    self.LoginButton.isEnabled = value
  }
  
  func performLogin() -> Bool {
    if (!checkFieldValidity()){
      self.displayErroWarning(message: "All of the fields are required");
      return false;
    }
    
    guard let url = URL(string: "\(BaseService.baseURL)token") else {
      print("Error creating URL")
      self.displayErroWarning(message: "Something went wrong");
      return false;
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    
    var headers: Dictionary<String, String> = Dictionary<String, String>()
    headers.updateValue("application/x-www-form-urlencoded", forKey: "Content-Type")
    
    for header in headers{
      urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
    }
    
    let model = LoginModel(UserName: UsernameField.text!, Password: PasswordField.text!)
    urlRequest.httpBody = model.toURLEncoded().data(using: String.Encoding.utf8);
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    
    let task = session.dataTask(with: urlRequest,completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
      
      if (error != nil){
        self.displayErroWarning(message: "Something went wrong");
        self.enableDisableFields(value: true)
        return
      }
      
      let httpresponse = response as? HTTPURLResponse
      if ((httpresponse?.statusCode)! >= 200 && (httpresponse?.statusCode)! <= 299 ){
        
          var dataDictionary:[String : Any];
          do {
            dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as! [String : Any]
            ApplicationUser.newInstance(jsonDictionary: dataDictionary)
            self.displaySuccessAndContinue()
          } catch {
             self.displayErroWarning(message: "Something went wrong");
          }
        
      } else {
        self.displayErroWarning(message: "Invalid username or password! Please try again.");
      }
      
      self.enableDisableFields(value: true)
      
      self.Progress.stopAnimating()
      
    })
    task.resume()
    return true
  }

  
  

}
