//
//  LockVoltageParameterDetailView.swift
//  LockConfigurer
//
//  Created by Ghassen on 30.03.2024.
//

import SwiftUI

//The enum VoltageOptionValues represents the voltage values in order to manage them more easily.
enum VoltageOptionValues: String, Identifiable, CaseIterable{
    case defaultValue = "No Lock"
    case firstValue = "12V"
    case secondValue = "24V"
    var id: String { self.rawValue }
}

struct LockVoltageParameterDetailView: View {
    
    @ObservedObject var lockConfigurationViewModel : LockConfigurationViewModel
    @State  private var selectedVoltageValue: VoltageOptionValues?
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading, spacing: 15) {
                Text("Select the voltage that is needed once the lock is installed.")
                    .fontWeight(.medium)
                Text("The default value is: \(self.lockConfigurationViewModel.lockConfigurationData!.lockVoltage.defaultValue).")
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                //Utilize the ForEach loop to create checkbox selection buttons for each voltage value.
                ForEach(VoltageOptionValues.allCases) { optionValue in
                    setupVoltageSelectionButton(title: optionValue.rawValue, value: optionValue)
                }
                .onAppear {
                    // Display the default voltage value when the view is being initialized with the object passed by the parent view.
                    self.selectedVoltageValue = VoltageOptionValues(rawValue: lockConfigurationViewModel.lockConfigurationData!.lockVoltage.defaultValue)
                }
                Spacer()
            }
        }
        .navigationTitle("Edit Voltage")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    //This function is responsible for creating the button that represents a voltage option value and handles the selection when it is tapped.
    private func setupVoltageSelectionButton(title: String, value: VoltageOptionValues ) -> some View {
        Button(action: {
            self.selectedVoltageValue = value
            //Update voltage value through the lockConfigurationViewModel observable object after the new value selection.
            self.lockConfigurationViewModel.lockConfigurationData?.lockVoltage.defaultValue = value.rawValue
        })
        {
            HStack {
                Image(systemName: selectedVoltageValue == value ? "checkmark.square" : "square")
                    .tint(.black)
                Text(title)
                    .foregroundColor(.black)
            }
        }
    }
}


