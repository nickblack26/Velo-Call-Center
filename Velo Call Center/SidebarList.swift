//
//  SidebarList.swift
//  Velo Call Center
//
//  Created by Nick Black on 11/24/23.
//

import SwiftUI

struct SidebarList: View {
	@State private var totalConversations: Int = 0
	@State private var searchText: String = ""
	@State private var message: String = ""
	@State private var tasks: [TaskModel] = [] {
		didSet {
			totalConversations = tasks.count
		}
	}
	@Binding var selectedTask: TaskModel?
	
	var sectionedTasks: [String:[TaskModel]] {
		let data = Dictionary(grouping: tasks, by: { task in
			task.channel_type
		})
		if searchText.isEmpty {
			return data
		} else {
			return data.filter { key, value in
				key.localizedCaseInsensitiveContains(searchText)
			}
		}
	}
	
	init(_ selectedTask: Binding<TaskModel?>) {
		self._selectedTask = selectedTask
	}
	
    var body: some View {
		List(selection: $selectedTask) {
			Section {
				HStack {
					Button("Assigned to you") {
						
					}
					.foregroundStyle(.secondary)
					
					Button("Inbox") {
						
					}
					.foregroundStyle(.secondary)
				}
				
				Divider()
				
				HStack {
					Text("^[\(totalConversations) Conversation](inflect: true)")
						.foregroundStyle(.secondary)
					
					Spacer()
					
					Image(systemName: "list.bullet")
					Image(systemName: "rectangle.on.rectangle")
					Image(systemName: "line.3.horizontal.decrease")
				}
			}
			
			ForEach(sectionedTasks.keys.sorted(), id: \.self) { key in
				if let tasks = sectionedTasks[key] {
					Section {
						ForEach(tasks) { task in
							HStack(alignment: .top, spacing: 16) {
								AsyncImage(
									url: URL(string: "https://assets-global.website-files.com/61d87d426829a9bac65eeb9e/654d2b113b66e71152acc84c_Nick_Headshot_Fall2023-p-500.jpg"
											)
								) { image in
									image
										.resizable()
										.frame(maxWidth: 40, maxHeight: 40)
										.clipShape(Circle())
								} placeholder: {
									Circle()
										.fill(.green)
										.frame(maxWidth: 40, maxHeight: 40)
								}
								
								VStack(alignment: .leading) {
									if let name = task.attributes["fullName"] {
										Text(name)
											.font(.headline)
											.fontWeight(.bold)
									}
									
									if let phoneNumber = task.attributes["from"] {
										Text(phoneNumber)
											.font(.subheadline)
											.foregroundStyle(.secondary)
									}
								}
								
								Spacer()
								
								Text(task.virtual_start_time.formatted(date: .omitted, time: .shortened))
									.font(.subheadline)
									.fontWeight(.thin)
							}
							.headerProminence(.increased)
							.tag(task)
						}
					} header: {
						Text(key)
							.foregroundStyle(.primary)
					}
				}
			}
		}
		.searchable(text: $searchText, prompt: Text("Search tasks"))
		.toolbar(removing: .sidebarToggle)
		.toolbar {
			ToolbarItem(placement: .topBarLeading) {
				Text("Conversations")
					.font(.title)
					.fontWeight(.bold)
			}
		}
		.onAppear {
			tasks = TaskModel.testTasks()
		}
    }
}

#Preview {
	NavigationSplitView {
		SidebarList(.constant(TaskModel.testTasks()[0]))
	} detail: {
		EmptyView()
	}
}
