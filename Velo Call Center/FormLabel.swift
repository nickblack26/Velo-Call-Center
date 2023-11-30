//
//  FormLabel.swift
//  Velo Call Center
//
//  Created by Nick on 11/27/23.
//

import SwiftUI

struct FormLabel: View {
	var label: String
	var content: String
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(label)
				.font(.subheadline)
				.foregroundStyle(.secondary)
			
			Text(content)
				.font(.headline)
		}
		.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
	FormLabel(label: "Customer since", content: "May 13, 2022")
}
