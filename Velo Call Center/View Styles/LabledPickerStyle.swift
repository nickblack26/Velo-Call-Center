//
//  LabledPickerStyle.swift
//  Velo Call Center
//
//  Created by Nick on 11/27/23.
//

import SwiftUI

struct LabledPickerStyle: PickerStyle {
	static func _makeView<SelectionValue>(
		value: _GraphValue<_PickerValue<LabledPickerStyle, SelectionValue>>,
		inputs: _ViewInputs
	) -> _ViewOutputs where SelectionValue : Hashable {
		<#code#>
	}
	
	static func _makeViewList<SelectionValue>(
		value: _GraphValue<_PickerValue<LabledPickerStyle, SelectionValue>>,
		inputs: _ViewListInputs
	) -> _ViewListOutputs where SelectionValue : Hashable {
		<#code#>
	}
}

struct iOSCheckboxToggleStyle: ToggleStyle {
	func makeBody(configuration: Configuration) -> some View {
		
	}
}
