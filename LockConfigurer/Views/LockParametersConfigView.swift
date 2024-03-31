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
                if let thelockConfigurationData = lockConfigurationViewModel.lockConfigurationData {
                    NavigationView {
                        VStack(alignment: .leading) {
                            NavigationLink{
                                // Pass the data observable object to the child view.
                                LockVoltageParameterDetailView(lockConfigurationViewModel: lockConfigurationViewModel)
                            }
                        label: {
                            HStack(){
                                Image("icons-power-kw")
                                    .resizable()
                                    .frame(width:30,height:30)
                                VStack(alignment: .leading,spacing: 5){
                                    Text("Lock Voltage")
                                        .fontWeight(.heavy)
                                    Text("\(thelockConfigurationData.lockVoltage.defaultValue)")
                                        .fontWeight(.semibold)
                                }
                                Image(systemName: "chevron.forward")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }.tint(.black)
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
                                Image("lock-kick-icon")
                                    .resizable()
                                    .frame(width:30,height:30)
                                VStack(alignment: .leading,spacing: 5){
                                    Text("Lock Kick")
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
                                    Text("None")
                                        .fontWeight(.semibold)
                                }
                            }
                            Divider()
                            NavigationLink{
                                //Pass the data observable object to the LockReleaseTimeDetailView child view.
                                LockReleaseTimeDetailView(lockConfigurationViewModel: lockConfigurationViewModel)
                            }
                        label: {
                            HStack(){
                                Image("time-icon")
                                    .resizable()
                                    .frame(width:30,height:30)
                                VStack(alignment: .leading,spacing: 5){
                                    Text("Lock Release Time")
                                        .fontWeight(.heavy)
                                    Text("\(thelockConfigurationData.lockReleaseTime.defaultValue                            .formatted(.number.precision(.fractionLength(0...2))))s")                                    .fontWeight(.semibold)
                                }
                                Image(systemName: "chevron.forward")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }.tint(.black)
                        }
                            
                        }
                        .navigationTitle("Lock parameters")
                        .navigationBarTitleDisplayMode(.inline)
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

