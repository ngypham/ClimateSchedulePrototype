//
//  ScheduleView.swift
//  ScheduleClimatePrototype
//
//  Created by Nguyen Pham on 6/13/23.
//

import SwiftUI

struct ScheduleView: View {
    let quickCopy = ["Preset 1", "Preset 2", "Preset 3", "Preset 4"]
    @ObservedObject var preset1: Preset
    @ObservedObject var preset2: Preset
    @ObservedObject var preset3: Preset
    @ObservedObject var preset4: Preset
    @StateObject var scheduledPreset = Preset()
    @State private var selectCopy = "Preset 1"
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Toggle("Schedule Climate Start", isOn: $scheduledPreset.enabled)
                    DatePicker("Departure Time", selection: $scheduledPreset.time, displayedComponents: .hourAndMinute)

                }
                
                Section {
                    Picker("Quick Copy from:", selection: $selectCopy) {
                        ForEach(quickCopy, id: \.self) {
                            Text($0)
                        }
                    }
                    Button {
                        switch selectCopy {
                        case "Preset 1":
                            scheduledPreset.enabledTemp = preset1.enabledTemp
                            scheduledPreset.temp = preset1.temp
                            scheduledPreset.frontDefrost = preset1.frontDefrost
                            scheduledPreset.rearDefrost = preset1.rearDefrost
                            scheduledPreset.steeringWheel = preset1.steeringWheel
                        case "Preset 2":
                            scheduledPreset.enabledTemp = preset2.enabledTemp
                            scheduledPreset.temp = preset2.temp
                            scheduledPreset.frontDefrost = preset2.frontDefrost
                            scheduledPreset.rearDefrost = preset2.rearDefrost
                            scheduledPreset.steeringWheel = preset2.steeringWheel
                        case "Preset 3":
                            scheduledPreset.enabledTemp = preset3.enabledTemp
                            scheduledPreset.temp = preset3.temp
                            scheduledPreset.frontDefrost = preset3.frontDefrost
                            scheduledPreset.rearDefrost = preset3.rearDefrost
                            scheduledPreset.steeringWheel = preset3.steeringWheel
                        case "Preset 4":
                            scheduledPreset.enabledTemp = preset4.enabledTemp
                            scheduledPreset.temp = preset4.temp
                            scheduledPreset.frontDefrost = preset4.frontDefrost
                            scheduledPreset.rearDefrost = preset4.rearDefrost
                            scheduledPreset.steeringWheel = preset4.steeringWheel
                        default:
                            break
                        }
                    } label: {
                        Text("Copy")
                    }
                }
                
                Section {
                    HStack{
                        Picker("Temp", selection: $scheduledPreset.temp) {
                            ForEach(62 ..< 83) {
                                Text("\($0)° F")
                            }
                        }
                        Toggle("", isOn: $scheduledPreset.enabledTemp)

                    }
                }
                
                Section {
                    Text("Accessories Settings")
                    Toggle("Front Defroster", isOn: $scheduledPreset.frontDefrost)
                    Toggle("Rear Window and Side Mirror Defrosters", isOn: $scheduledPreset.rearDefrost)
                    Toggle("Steering Wheel Heater", isOn: $scheduledPreset.steeringWheel)
                }
            }
            .navigationTitle("Schedule Climate Start")
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(preset1: Preset(), preset2: Preset(), preset3: Preset(), preset4: Preset())
    }
}
