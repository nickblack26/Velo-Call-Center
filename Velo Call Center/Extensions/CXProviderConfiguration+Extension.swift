//
//  CXProviderConfiguration+Extension.swift
//  Velo Call Center
//
//  Created by Nick Black on 11/7/23.
//

import Foundation
import CallKit
import UIKit

extension CXProviderConfiguration {
	static var custom: CXProviderConfiguration {
		// 1
		let configuration = CXProviderConfiguration(localizedName: "Homing Pigeon")
		
		// 2
		// Native call log shows video icon if it was video call.
		configuration.supportsVideo = true
		
		// Support generic type to handle *User ID*
		configuration.supportedHandleTypes = [.generic]
		
		// Icon image forwarding to app in CallKit View
		if let iconImage = UIImage(named: "App Icon") {
			configuration.iconTemplateImageData = iconImage.pngData()
		}
		return configuration
	}
}
