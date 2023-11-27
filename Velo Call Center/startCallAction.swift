//
//  startCallAction.swift
//  Velo Call Center
//
//  Created by Nick Black on 11/7/23.
//

import Foundation
import CallKit

func startCall(with uuid: UUID, calleeID: String, hasVideo: Bool, completionHandler: ((NSError?) -> Void)? = nil) {
	// 1
	let handle = CXHandle(type: .generic, value: calleeID)
	let startCallAction = CXStartCallAction(call: uuid, handle: handle)
	
	// 2
	startCallAction.isVideo = hasVideo
	
	// 3
	requestTransaction(with: startCallAction, completionHandler: completionHandler)
}
