import SwiftUI

struct CustomerDetailsView: View {
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			HStack {
				Button {
					
				} label: {
					Image(systemName: "person.crop.rectangle.stack")
					Text("Co-browse")
				}
				.buttonStyle(.plain)
				
				Button {
					
				} label: {
					Image(systemName: "video.badge.plus")
					Text("Video call")
				}
				.buttonStyle(.plain)
				
				Spacer()
				
				Menu {
					
				} label: {
					Text("All actions")
					Image(systemName: "chevron.down")
				}
				.tint(.primary)
				.menuStyle(.button)
				
				Button("Cart and favs", systemImage: "heart") {
					
				}
				.padding()
				.buttonStyle(.bordered)
				.tint(.white)
				.foregroundStyle(.primary)
			}
			
			HStack(spacing: 64) {
				VStack(alignment: .leading) {
					Text("Customer profile")
						.font(.largeTitle)
						.fontWeight(.bold)
					
					Label("Loyalty level", systemImage: "trophy")
					
					HStack {
						FormLabel(label: "Customer since", content: "May 13, 2022")
						FormLabel(label: "Birthday", content: "Jan 24, 2000")
					}
					
					FormLabel(label: "Address", content: "3530 Travis St. Apt 315, Dallas, TX 75204")
				}
				.frame(
					maxWidth: .infinity,
					maxHeight: .infinity, alignment: .leading
				)
				
				Divider()
					.frame(maxHeight: .infinity)
				
				VStack {
					Text("Latest orders")
						.font(.largeTitle)
						.fontWeight(.bold)
				}
				.frame(
					maxWidth: .infinity,
					maxHeight: .infinity, alignment: .leading
				)
			}
			.padding(.horizontal)
//			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
		}
    }
}

#Preview {
    CustomerDetailsView()
}
