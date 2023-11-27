import SwiftUI

struct ContentView: View {
	@State private var selectedTask: TaskModel?
	@Environment(TwilioManager.self) var twilio

    var body: some View {
		NavigationSplitView {
			SidebarList($selectedTask)
		} detail: {
			if let selectedTask {
				
			}
		}
    }
}

#Preview {
	@State var manager = TwilioManager()
	return ContentView()
		.environment(manager)
}
