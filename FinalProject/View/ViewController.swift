//
//  ViewController.swift
//  FinalProject
//
//  Created by Vido Valianto on 3/26/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var kosViewModel = KosViewModel()
    var kosTV : UITableView!
    private var roundButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "List Kos"
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        kosTV = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        kosTV.register(UINib.init(nibName: "KosTableViewCell", bundle: nil), forCellReuseIdentifier: "KosTableViewCell")
        kosTV.dataSource = self
        kosTV.delegate = self
        self.view.addSubview(kosTV)
        
        kosViewModel.delegate = self
        kosViewModel.loadKos()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createFloatingButton() {
        roundButton = UIButton(type: .custom)
        roundButton.translatesAutoresizingMaskIntoConstraints = false
        roundButton.backgroundColor = UIColor.red
        // Make sure you replace the name of the image:
        roundButton.setTitle("+", for: .normal)
        roundButton.titleLabel?.font = .systemFont(ofSize: 30)
        // Make sure to create a function and replace DOTHISONTAP with your own function:
        roundButton.addTarget(self, action: #selector(newKos), for: UIControl.Event.touchUpInside)
        // We're manipulating the UI, must be on the main thread:
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(self.roundButton)
                NSLayoutConstraint.activate([
                    keyWindow.trailingAnchor.constraint(equalTo: self.roundButton.trailingAnchor, constant: 30),
                    keyWindow.bottomAnchor.constraint(equalTo: self.roundButton.bottomAnchor, constant: 30),
                    self.roundButton.widthAnchor.constraint(equalToConstant: 75),
                    self.roundButton.heightAnchor.constraint(equalToConstant: 75)])
            }
            // Make the button round:
            self.roundButton.layer.cornerRadius = 37.5
            // Add a black shadow:
            self.roundButton.layer.shadowColor = UIColor.black.cgColor
            self.roundButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            self.roundButton.layer.masksToBounds = false
            self.roundButton.layer.shadowRadius = 2.0
            self.roundButton.layer.shadowOpacity = 0.5
            
        }
    }
    
    @objc func newKos(){
        if let controller =  self.storyboard?.instantiateViewController(withIdentifier: "NewKosVC") as? NewKostViewController {
            
            //            print(self.kosViewModel.listKos[indexPath.row].name)
            
            //            controller.namaKosLbl.text = self.kosViewModel.listKos[indexPath.row].name
            //            controller.detailKosLbl.text = self.kosViewModel.listKos[indexPath.row].type + "-" + self.kosViewModel.listKos[indexPath.row].price
            //            controller.categoryKosLbl.text = self.kosViewModel.listKos[indexPath.row].category
            //            controller.kosImageView.loadImageUrl(url: self.kosViewModel.listKos[indexPath.row].image_url)
            
            self.show(controller, sender: self)
        } else {
            print("something wrong on opening next page")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if roundButton.superview != nil {
            DispatchQueue.main.async {
                self.roundButton.removeFromSuperview()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createFloatingButton()
        kosViewModel.loadKos()
    }


}
