//
//  DetailKosViewModel.swift
//  FinalProject
//
//  Created by Vido Valianto on 3/27/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import Foundation

protocol DetailKosViewModelDelegate{
    func onDetailKosLoaded()
}

class DetailKosViewModel {
    
    var delegate: DetailKosViewModelDelegate?
    var kosDetail : KosModel?
    var url = "https://esjeruks.com/api-mamicamp/public/api/room"
    
    func loadKos(roomId : String) {
        NetworkFacade.callGetApi(url: url+roomId, parameters: [:]) {
            (json) in
            for object in json["data"].arrayValue {
                self.kosDetail = KosModel(object)
            }
            self.delegate?.onDetailKosLoaded()
        }
    }
    
    
}
