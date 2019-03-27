//
//  KosViewController+TableViewDelegate.swift
//  FinalProject
//
//  Created by Vido Valianto on 3/26/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! KosTVC
        
        if let controller =  self.storyboard?.instantiateViewController(withIdentifier: "DetailKosVC") as? DetailKosViewController {
            
            controller.kostModel = self.kosViewModel.listKos[indexPath.row]
            controller.title = self.kosViewModel.listKos[indexPath.row].name
            controller.roomID = self.kosViewModel.listKos[indexPath.row].id
            
            self.show(controller, sender: self)
        } else {
            print("something wrong on opening next page")
        }
    }
}
