//
//  KosViewController+TableViewDataSource.swift
//  FinalProject
//
//  Created by Vido Valianto on 3/26/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.kosViewModel.listKos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KosTableViewCell", for: indexPath) as! KosTVC
        cell.namaKosLbl.text = self.kosViewModel.listKos[indexPath.row].name
        cell.detailKosLbl.text = self.kosViewModel.listKos[indexPath.row].type
        cell.detailKosLbl.colorCode()
        cell.priceLbl.text = " - " + self.kosViewModel.listKos[indexPath.row].price
        cell.categoryKosLbl.text = self.kosViewModel.listKos[indexPath.row].category
        cell.kosImageView.loadImageUrl(url: self.kosViewModel.listKos[indexPath.row].image_url)
        return cell
    }
}



extension ViewController: KosViewModelDelegate {
    func onKosLoaded() {
        self.kosTV.reloadData()
    }
}
