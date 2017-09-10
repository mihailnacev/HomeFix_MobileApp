//
//  Profile Controller.swift
//  HomeFix_MobileApp
//
//  Created by Gjorche Cekovski on 9/10/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class ProfileController : UIViewController {
  
  @IBOutlet weak var NameField: UILabel!
  @IBOutlet weak var LastNameField: UILabel!
  @IBOutlet weak var RatingField: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if ApplicationUser.getInstance() != nil {
      if (ApplicationUser.isTokenExpired()){
        ApplicationUser.desctroyInstance()
        self.navigationController?.popToRootViewController(animated: true);
        return;
      } else {
        setFields()
      }
    }else {
      self.navigationController?.popToRootViewController(animated: true);
      return;
    }
    
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func setFields(){
    
    let appuser = ApplicationUser.getInstance()
    
    NameField.text = appuser?.TheUser?.UserFirstName
    LastNameField.text = appuser?.TheUser?.UserLastName
    
    var rating:Double = 0.0
    if (appuser?.TheUser?.RatingCount != 0){
    rating = Double((appuser?.TheUser?.RatingSum)!) / Double((appuser?.TheUser?.RatingCount)!)
    }
    RatingField.text = "\(rating) points";
  }
}
