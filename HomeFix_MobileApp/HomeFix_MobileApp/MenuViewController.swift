//
//  MenuViewController.swift
//  HomeFix_MobileApp
//
//  Created by Gjorche Cekovski on 9/10/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class MenuViewController : UIViewController {
  
  @IBOutlet weak var SearchButton: UIButton!
  
  @IBOutlet var NonLoggedUserActions: [UIButton]!
  
  @IBOutlet var LoggedUserActions: [UIButton]!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if ApplicationUser.getInstance() != nil {
      if (ApplicationUser.isTokenExpired()){
        ApplicationUser.desctroyInstance()
        changeDisplay(value: false)
      } else {
        changeDisplay(value: true)
      }
    } else {
      changeDisplay(value: false)
    }

    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  private func changeDisplay(value: Bool){
    for button in NonLoggedUserActions {
      button.isHidden = value
    }
    
    for button in LoggedUserActions {
      button.isHidden = !value
    }
  }
}
