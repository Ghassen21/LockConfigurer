//
//  LockParametersConfigView.swift
//  LockConfigurer
//
//  Created by Ghassen on 28.03.2024.
//

import SwiftUI

struct LockParametersConfigView: View {
    
    @ObservedObject var lockConfigurationViewModel = LockConfigurationViewModel()
    
    var body: some View {
        
        ZStack {
            if lockConfigurationViewModel.isLoading {
                // Display activity indicator while fetching/loading lock data
                HStack(spacing:15) {
                    ProgressView()
                    Text("Loading…")
                        .fontWeight(.bold)
                }
                .onAppear {
                    self.lockConfigurationViewModel.fetchLockConfigurationData()
                }
            } else {
                // When the lock data arrives from the view model, and the state of isLoading is no longer true, display the lock data.
                if let lockConfigurationData = lockConfigurationViewModel.lockConfigurationData {
                    VStack(alignment: .leading) {
                        HStack(){
                            Image("icons-power-kw")
                                .resizable()
                                .frame(width:30,height:30)
                            VStack(alignment: .leading,spacing: 5){
                                Text("Lock Voltage")
                                    .fontWeight(.heavy)
                                Text("\(lockConfigurationData.lockVoltage.defaultValue)")
                                    .fontWeight(.semibold)
                            }
                        }
                        Divider()
                        HStack(){
                            Image("lock-type-icon")
                                .resizable()
                                .frame(width:30,height:30)
                            VStack(alignment: .leading,spacing: 5){
                                Text("Lock Type")
                                    .fontWeight(.heavy)
                                Text("None")
                                    .fontWeight(.semibold)
                            }
                        }
                        Divider()
                        HStack(){
                            Image("lock-release-icon")
                                .resizable()
                                .frame(width:30,height:30)
                            VStack(alignment: .leading,spacing: 5){
                                Text("Lock Release")
                                    .fontWeight(.heavy)
                                Text("On")
                                    .fontWeight(.semibold)
                            }
                        }
                        Divider()
                        HStack(){
                            Image("time-icon")
                                .resizable()
                                .frame(width:30,height:30)
                            VStack(alignment: .leading,spacing: 5){
                                Text("Lock Release Time")
                                    .fontWeight(.heavy)
                                Text("\(lockConfigurationData.lockReleaseTime.range.min)")                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .padding()
                } else {
                    Text("No data available")
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
    }
}
