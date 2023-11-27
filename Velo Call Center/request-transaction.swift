//
//  request-transaction.swift
//  Velo Call Center
//
//  Created by Nick Black on 11/7/23.
//

import Foundation
import CallKit

// Allow to request for actions
let callController = CXCallController()

// Request transaction
private func requestTransaction(with action: CXCallAction, completionHandler: ((Error?) -> Void)?) {
	let transaction = CXTransaction(action: action)
	callController.request(transaction) { error in
		completionHandler?(error as NSError?)
	}
}
