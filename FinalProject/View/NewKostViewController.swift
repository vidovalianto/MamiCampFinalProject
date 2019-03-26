//
//  NewKostViewController.swift
//  FinalProject
//
//  Created by Vido Valianto on 3/26/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import UIKit

class NewKostViewController: UIViewController {

    @IBOutlet weak var namaKostET: UITextField!
    @IBOutlet weak var simpanBtn: UIButton!
    @IBOutlet weak var deskripsiKostET: UITextField!
    @IBOutlet weak var hargaKostET: UITextField!
    @IBOutlet weak var categoryKostET: UITextField!
    @IBOutlet weak var tipeKostET: UISegmentedControl!
    
    let url = "https://esjeruks.com/api-mamicamp/public/api/room"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func simpanBtnClicked(_ sender: Any) {
        let parameter = [
            "name" : namaKostET.text,
            "description" : deskripsiKostET.text,
            "type" : tipeKostET.titleForSegment(at: tipeKostET.selectedSegmentIndex),
            "price" : hargaKostET.text,
            "category" : categoryKostET.text
        ]
        NetworkFacade.callPostApi(url: url, parameters: parameter) { json in
            print(json)
        }
    }
    
    func isValidated() -> Bool{
        var isValid = false
        if namaKostET.text?.isEmpty != true || (namaKostET.text?.count)! > 3 {
            isValid = true
        }
        if deskripsiKostET.text?.isEmpty != true || (deskripsiKostET.text?.count)! > 3  {
            isValid = true
        }
        if hargaKostET.text?.isEmpty != true || (hargaKostET.text?.count)! > 3 {
            isValid = true
        }
        return isValid
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
