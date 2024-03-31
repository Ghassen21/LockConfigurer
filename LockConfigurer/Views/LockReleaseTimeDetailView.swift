//
//  LockReleaseTimeDetailView.swift
//  LockConfigurer
//
//  Created by Ghassen on 31.03.2024.
//

import SwiftUI

struct LockReleaseTimeDetailView: View {
    
    @ObservedObject var lockConfigurationViewModel : LockConfigurationViewModel
    @State private var timeValue: Double = 0.0
    
    var body: some View {
        
        if let thelockRelaseRangeTime = self.lockConfigurationViewModel.lockConfigurationData?.lockReleaseTime.range{
            NavigationView {
                // Display the lock release range time with minimum and maximum values.
                VStack(alignment:.leading, spacing: 15) {
                    Text("Please configure the release time value.")
                        .fontWeight(.medium)
                    HStack(){
                        Text("\(thelockRelaseRangeTime.min.formatted(.number.precision(.fractionLength(0...1))))s")
                        VStack {
                            Slider(value: $timeValue, in: 0.1...120.0){ editing  in
                                //Set the new default time value in the lockConfigurationViewModel observable object to update the parent view.
                                self.lockConfigurationViewModel.lockConfigurationData?.lockReleaseTime.defaultValue = self.timeValue
                            }.onAppear {
                                //Render the initial time  value in slider when the view appears by assigning the time default value property passed in the lockConfigurationData model from the parent view.
                               if let theTimeDefaultValue = self.lockConfigurationViewModel.lockConfigurationData?.lockReleaseTime.defaultValue{
                                    self.timeValue = theTimeDefaultValue
                                }
                            }
                            Text("\(timeValue.formatted(.number.precision(.fractionLength(0...1))))s")
                        }
                        Text("\(thelockRelaseRangeTime.max.formatted(.number.precision(.fractionLength(0...1))))s")
                    }
                    Spacer()
                }.padding(.top, 44)
            }
            .navigationTitle("Edit Realease time")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


