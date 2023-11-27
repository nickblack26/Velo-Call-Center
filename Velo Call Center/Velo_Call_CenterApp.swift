//
//  Velo_Call_CenterApp.swift
//  Velo Call Center
//
//  Created by Nick Black on 11/7/23.
//

import SwiftUI

@main
struct Velo_Call_CenterApp: App {
	@State private var twilio = TwilioManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.environment(twilio)
    }
}
