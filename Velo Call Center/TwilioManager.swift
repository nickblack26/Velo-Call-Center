//
//  TwilioManager.swift
//  Velo Call Center
//
//  Created by Nick Black on 11/7/23.
//

import Foundation
import Observation

let accessToken = "PASTE_YOUR_ACCESS_TOKEN_HERE"
let twimlParamTo = "to"

let kCachedDeviceToken = "CachedDeviceToken"

@Observable
class TwilioManager {
	var messages = [String]()
	
	private var webSocketTask: URLSessionWebSocketTask?
	
	init() {
		self.connect()
	}
	
	private func connect() {
		guard let url = URL(string: "http://localhost:1337") else { return }
		let request = URLRequest(url: url)
		webSocketTask = URLSession.shared.webSocketTask(with: request)
		webSocketTask?.resume()
//		receiveMessage()
	}
	
	private func receiveMessage() {
		webSocketTask?.receive { result in
			switch result {
				case .failure(let error):
					print(error.localizedDescription)
				case .success(let message):
					switch message {
						case .string(let text):
							self.messages.append(text)
						case .data(let data):
							// Handle binary data
							break
						@unknown default:
							break
					}
			}
		}
	}
	
	func sendMessage(_ message: String) {
		guard let _ = message.data(using: .utf8) else { return }
		webSocketTask?.send(.string(message)) { error in
			if let error = error {
				print(error.localizedDescription)
			}
		}
	}
}
