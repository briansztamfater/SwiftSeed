//
//  InfoUtils.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 21/4/17.
//  Copyright © 2017 Brian Sztamfater. All rights reserved.
//

import Foundation

class InfoUtils {
    
    static func bundleNameKey() -> String {
        guard let info = Bundle.main.infoDictionary,
              let domain = info[kCFBundleNameKey as String] as? String else {
                fatalError("Cannot get bundle name key from Info.plist")
        }
        return domain;
    }
}
