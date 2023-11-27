import SwiftUI

struct CallDetail: View {
	var task: TaskModel
	
	init(_ task: TaskModel) {
		self.task = task
	}
	
    var body: some View {
		List {
			Section {
				HStack {
					AsyncImage(
						url: URL(string: "https://assets-global.website-files.com/61d87d426829a9bac65eeb9e/654d2b113b66e71152acc84c_Nick_Headshot_Fall2023-p-500.jpg"
								)
					) { image in
						image
							.resizable()
							.scaledToFill()
							.frame(width: 150, height: 200)
					} placeholder: {
						Rectangle()
							.fill(.green)
							.frame(width: 150, height: 200)
					}
					
					VStack(alignment: .leading) {
						HStack {
							Image(systemName: "phone.connection")
								.imageScale(.large)
							
							Text("Talking – 01:58 via Virtual Agent Transfer")
							
							Button {
								
							} label: {
								Image(systemName: "circle.fill")
									.resizable()
									.frame(width: 8, height: 8)
								Text("Rec")
							}
							.buttonStyle(.bordered)
							.tint(.red)
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
					Button {
						
					} label: {
						HStack {
							Image(systemName: "pause")
							Text("Hold")
						}
						.padding(12)
					}
					
					Button {
						
					} label: {
						HStack {
							Image(systemName: "mic.slash")
							Text("Mute")
						}
						.padding(12)
					}
					
					Button {
						
					} label: {
						HStack {
							Image(systemName: "circle.circle")
							Text("Stop Rec")
						}
						.padding(12)
					}
					.buttonStyle(.borderedProminent)
					.foregroundStyle(.primary)
					.tint(.white)
					
					Button {
						
					} label: {
						HStack {
							Image(systemName: "circle.grid.3x3")
							Text("Keypad")
						}
						.padding(12)
					}
					
					Button {
						
					} label: {
						HStack {
							Image(systemName: "person.badge.plus")
							Text("Add Guest")
						}
						.padding(12)
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
		}
		.listStyle(.plain)
    }
}

#Preview {
	CallDetail(TaskModel.testTasks()[0])
}
