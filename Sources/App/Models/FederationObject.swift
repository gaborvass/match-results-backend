//
//  OrganizationObject.swift
//  Adatbank
//
//  Created by Vass Gábor on 29/01/16.
//  Copyright © 2016 Gabor, Vass. All rights reserved.
//

import Foundation
import Vapor

struct FederationObject : Codable {

	let federationId: String
	let federationName: String
    
}

extension FederationObject : Content {
}
