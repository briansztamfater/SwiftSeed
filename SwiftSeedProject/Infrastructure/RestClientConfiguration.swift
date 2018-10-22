//
//  RestClientConfiguration.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 20/4/17.
//  Copyright © 2017 Brian Sztamfater. All rights reserved.
//

import Foundation
import Alamofire

struct RestClientConfiguration {
    static var manager: RestClientManagerProtocol {
        return SessionManager.default
    }
}
