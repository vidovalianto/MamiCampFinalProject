//
//  KosTVC.swift
//  FinalProject
//
//  Created by Vido Valianto on 3/26/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import UIKit

class KosTVC: UITableViewCell {

    
    @IBOutlet weak var kosImageView: UIImageView!
    @IBOutlet weak var namaKosLbl: UILabel!
    @IBOutlet weak var detailKosLbl: UILabel!
    @IBOutlet weak var categoryKosLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
