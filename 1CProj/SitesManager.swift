//
//  SitesManager.swift
//  1CProj
//
//  Created by Денис Дубовиков on 15.04.2020.
//  Copyright © 2020 Денис Дубовиков. All rights reserved.
//

import UIKit

var sitesMng: SitesManager = SitesManager()

struct site {
    var address = "No address"
    var name = "No name"
}

class SitesManager: NSObject {
    var sites = [site]()
    
    func addSite(address_: String, name_: String) {
        sites.append(site(address: address_, name: name_))
    }
}
