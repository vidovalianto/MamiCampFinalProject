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
    @IBOutlet weak var notificationLbl: UILabel!
    
    let url = "https://esjeruks.com/api-mamicamp/public/api/room"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadingAlert(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func simpanBtnClicked(_ sender: Any) {
        if isValidated(){
            loadingAlert()
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
            dismiss(animated: false, completion: nil)
        }else {
            smallAlert()
        }
    }
    
    func isValidated() -> Bool{
        var isValid = true
        if namaKostET.text?.isEmpty == true || (namaKostET.text?.count)! < 3 {
            isValid = false
        }
        if deskripsiKostET.text?.isEmpty == true || (deskripsiKostET.text?.count)! < 3  {
            isValid = false
        }
        if hargaKostET.text?.isEmpty == true || (hargaKostET.text?.count)! < 3 {
            isValid = false
        }
        return isValid
    }
    
    
    func smallAlert(){
        notificationLbl.text = "FORM INCORRECT"
        notificationLbl.font = UIFont(name: "Avenir-Black", size: 15)
        notificationLbl.backgroundColor = UIColor.red
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            self.notificationLbl.backgroundColor = UIColor.white
        }
    }

}
