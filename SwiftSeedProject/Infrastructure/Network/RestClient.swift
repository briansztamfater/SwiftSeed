//
//  Api.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 4/4/17.
//  Copyright © 2017 Brian Sztamfater. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class RestClient {
    // MARK: - Private Properties
    private let manager: RestClientManagerProtocol
    
    // MARK: - Designated Initializer
    init(manager: RestClientManagerProtocol = RestClientConfiguration.manager) {
        self.manager = manager
    }

    // MARK: - Private Functions
    private func start<T: Any>(target: Target, parameters: [String : AnyObject]? = nil, completion: @escaping (DataResult<T>) -> Void, processResponse: @escaping (JSON) -> Any?) {
        let _ = manager.sendRequest(target: target, parameters: parameters).getResponse(errorSanitizer: target.errorSanitizer) { response in
            switch response.result {
            case .success(let json):
                let parsedObject = processResponse(json) as! T
                completion( DataResult { return parsedObject } )
            case .failure(let error):
                completion( DataResult { throw error })
            }
        }
    }

    // MARK: - Internal Functions
    internal func execute<T>(target: Target, parameters: [String : AnyObject]? = nil, completion: @escaping (DataResult<T>) -> Void, processResponse: @escaping (JSON) -> T?) {
        self.start(target: target, parameters: parameters, completion: completion, processResponse: processResponse)
    }
    
    internal func execute<T>(target: Target, parameters: [String : AnyObject]? = nil, completion: @escaping (DataResult<[T]>) -> Void, processResponse: @escaping (JSON) -> [T]?) {
        self.start(target: target, parameters: parameters, completion: completion, processResponse: processResponse)
    }
}