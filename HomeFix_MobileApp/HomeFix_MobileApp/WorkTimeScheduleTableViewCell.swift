//
//  WorkTimeScheduleTableViewCell.swift
//  HomeFix_MobileApp
//
//  Created by Gjorche Cekovski on 9/10/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class WorkTimeScheduleTableViewCell: UITableViewCell {

  @IBOutlet weak var FromField: UILabel!
  @IBOutlet weak var UntillField: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
