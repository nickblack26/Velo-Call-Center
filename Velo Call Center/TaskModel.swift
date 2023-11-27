import Foundation

struct TaskModel: Identifiable, Hashable {
	var id: String {
		account_sid
	}
	var account_sid: String
	var age: Int
	var assignment_status: AssignmentStatus
	var attributes: [String: String]
	var date_created: Date
	var date_updated: Date
	var task_queue_entered_date: Date?
	var virtual_start_time: Date
	var priority: Int
	var reason: String
	var channel_type: String
	var sid: String
	var task_queue_sid: String
	var task_channel_sid: String
	var task_channel_unique_name: String
	var timeout: Int
	var url: String
	var workspace_sid: String
	var workflow_sid: String
	var workflow_friendly_name: String
	var task_queue_friendly_name: String
	var links: [String: String]
	
	static func testTasks() -> [TaskModel] {
		[
			.init(
				account_sid: "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
				age: 25200,
				assignment_status: .pending,
				attributes: ["fullName":"Nick Black", "from":"+19015988651", "channelType":"Voice"],
				date_created: try! Date("2014-05-14T18:50:02Z", strategy: .iso8601),
				date_updated: try! Date("2014-05-15T07:26:06Z", strategy: .iso8601),
				virtual_start_time:  try! Date("2014-05-14T18:50:02Z", strategy: .iso8601),
				priority: 1,
				reason: "Test Reason",
				channel_type: "Voice", 
				sid: "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
				task_queue_sid: "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
				task_channel_sid: "TCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
				task_channel_unique_name: "unique",
				timeout: 60,
				url: "https://taskrouter.twilio.com/v1/Workspaces/WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Tasks/WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
				workspace_sid: "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
				workflow_sid: "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
				workflow_friendly_name: "Example Workflow",
				task_queue_friendly_name: "Example Task Queue",
				links: ["task_queue":"https://taskrouter.twilio.com/v1/Workspaces/WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/TaskQueues/WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"]
			)
		]
	}
}


enum AssignmentStatus: Codable {
	case pending
	case reserved
	case assigned
	case canceled
	case wrapping
	case completed
}


extension Dictionary where Value: Equatable {
	func someKey(forValue val: Value) -> Key? {
		return first(where: { $1 == val })?.key
	}
}
