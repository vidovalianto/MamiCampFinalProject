//
//  KosViewModel.swift
//  FinalProject
//
//  Created by Vido Valianto on 3/26/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import Foundation


protocol KosViewModelDelegate{
    func onKosLoaded()
}

class KosViewModel {
    
    var delegate: KosViewModelDelegate?
    var listKos = [KosModel]()
    
    func loadKos() {
        NetworkFacade.callGetApi(url: "https://esjeruks.com/api-mamicamp/public/api/room", parameters: [:]) {
            (json) in
            for object in json["data"].arrayValue {
                let kos = KosModel(object)
                self.listKos.append(kos)
            }
            print(self.listKos)
            self.delegate?.onKosLoaded()
        }
    }
    
    
}
