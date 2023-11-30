import SwiftUI

enum CallDetailTab: String, CaseIterable {
	case Hold
	case Mute
	case Stop = "Stop Rec"
	case Keypad
	case Add = "Add Guest"
	
	var icon: String {
		switch self {
			case .Hold:
				"pause"
			case .Mute:
				"mic.slash"
			case .Stop:
				"circle.circle"
			case .Keypad:
				"circle.grid.3x3"
			case .Add:
				"person.badge.plus"
		}
	}
}

struct CallDetail: View {
	@State private var timeFormatter = ElapsedTimeFormatter()
	@State private var selectedTab: CallDetailTab?
	@State private var tabProgess: CGFloat = 0.5
	@State private var animationAmount = 1.0
	@State private var isRecording = true
	var task: TaskModel
	
	init(_ task: TaskModel) {
		self.task = task
	}
	
    var body: some View {
		List {
			Section {
				HStack(spacing: 24) {
					AsyncImage(
						url: URL(string: "https://assets-global.website-files.com/61d87d426829a9bac65eeb9e/654d2b113b66e71152acc84c_Nick_Headshot_Fall2023-p-500.jpg"
								)
					) { image in
						image
							.resizable()
							.frame(width: 150, height: 200)
							.scaledToFill()
					} placeholder: {
						Rectangle()
							.fill(.green)
							.frame(width: 150, height: 200)
					}
					
					VStack(alignment: .leading) {
						HStack {
							Image(systemName: "phone.connection")
								.imageScale(.large)
							
							Text("Talking – \(Text(NSNumber(value: task.age), formatter: timeFormatter).fontWeight(.black)) via Virtual Agent Transfer")
							
							Button {
								
							} label: {
								Image(systemName: "circle.fill")
									.resizable()
									.frame(width: 8, height: 8)
								Text("Rec")
							}
							.buttonStyle(.bordered)
							.tint(.red)
							.disabled(!isRecording)
						}
						
						Text(task.attributes["fullName"] ?? "Unknown Number")
							.font(.largeTitle)
							.fontWeight(.bold)
						
						Text(task.attributes["from"] ?? "Unknown Number")
					}
				}
			}
			.listRowSeparator(.hidden)
			
			Section {
				HStack {
					HStack(spacing: 0) {
						ForEach(CallDetailTab.allCases, id: \.self) { tab in
							let isSelectedTab = tab == selectedTab
							Button {
								withAnimation(.spring) {
									if isSelectedTab {
										selectedTab = nil
									} else {
										selectedTab = tab
									}
								}
							} label: {
								HStack {
									Image(systemName: tab.icon)
									Text(tab.rawValue)
								}
								.padding(12)
							}
							.buttonStyle(.borderedProminent)
							.tint(isSelectedTab ? .white : .clear)
							.foregroundStyle(.primary)
						}
					}
					
					Spacer()
					
					Button {
						
					} label: {
						HStack {
							Image(systemName: "phone.down.fill")
							Text("End Call")
						}
						.padding(12)
					}
					.buttonStyle(.borderedProminent)
					.tint(.red)
				}
				.padding(8)
				.frame(maxWidth: .infinity)
				.background(
					Color(uiColor: .systemGray6),
					in: .rect(cornerRadius: 12)
				)
			}
			.listRowSeparator(.hidden)
			
			Section {
				TabView(selection: .constant("Details")) {
					
				}
			}
		}
		.listStyle(.plain)
    }
}

#Preview {
	CallDetail(TaskModel.testTasks()[0])
}
