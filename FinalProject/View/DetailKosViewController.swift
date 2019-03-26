//
//  DetailKosViewController.swift
//  FinalProject
//
//  Created by Vido Valianto on 3/26/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import UIKit



class DetailKosViewController: UIViewController {
    
    
    

    @IBOutlet weak var kosImageView: UIImageView!
    @IBOutlet weak var namaKosLbl: UILabel!
    @IBOutlet weak var detailKosLbl: UILabel!
    @IBOutlet weak var categoryKosLbl: UILabel!
    @IBOutlet weak var descriptionKosLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    var kostModel : KosModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLbl()
        // Do any additional setup after loading the view.
    }
    
    func updateLbl(){
        namaKosLbl.text = kostModel.name
        detailKosLbl.text = kostModel.type
        categoryKosLbl.text = kostModel.category
        kosImageView.loadImageUrl(url: kostModel.image_url)
        descriptionKosLbl.text = kostModel.description
        detailKosLbl.colorCode()
        priceLbl.text = " - " + kostModel.price
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
