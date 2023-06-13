//
//  ScheduleView.swift
//  ScheduleClimatePrototype
//
//  Created by Nguyen Pham on 6/13/23.
//

import SwiftUI

struct ScheduleView: View {
    let quickCopy = ["Preset 1", "Preset 2", "Preset 3", "Preset 4"]
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var preset1: Preset
    @ObservedObject var preset2: Preset
    @ObservedObject var preset3: Preset
    @ObservedObject var preset4: Preset
    @StateObject var scheduledPresetA = Preset()
    @StateObject var scheduledPresetB = Preset()
    @State private var selectCopyA = "Preset 1"
    @State private var selectCopyB = "Preset 1"
    
    var body: some View {
        Form {
            Section {
                Toggle("Climate Schedule A", isOn: $scheduledPresetA.enabled)
                DatePicker("Set Climate Start Time", selection: $scheduledPresetA.time, displayedComponents: .hourAndMinute)
                HStack {
                    Text("Set Days")
                    Spacer()
                    Text("S M T W T F S")
                }
                Picker("Quick Copy from:", selection: $selectCopyA) {
                    ForEach(quickCopy, id: \.self) {
                        Text($0)
                    }
                }
                Button {
                    switch selectCopyA {
                    case "Preset 1":
                        scheduledPresetA.enabledTemp = preset1.enabledTemp
                        scheduledPresetA.temp = preset1.temp
                        scheduledPresetA.frontDefrost = preset1.frontDefrost
                        scheduledPresetA.rearDefrost = preset1.rearDefrost
                        scheduledPresetA.steeringWheel = preset1.steeringWheel
                    case "Preset 2":
                        scheduledPresetA.enabledTemp = preset2.enabledTemp
                        scheduledPresetA.temp = preset2.temp
                        scheduledPresetA.frontDefrost = preset2.frontDefrost
                        scheduledPresetA.rearDefrost = preset2.rearDefrost
                        scheduledPresetA.steeringWheel = preset2.steeringWheel
                    case "Preset 3":
                        scheduledPresetA.enabledTemp = preset3.enabledTemp
                        scheduledPresetA.temp = preset3.temp
                        scheduledPresetA.frontDefrost = preset3.frontDefrost
                        scheduledPresetA.rearDefrost = preset3.rearDefrost
                        scheduledPresetA.steeringWheel = preset3.steeringWheel
                    case "Preset 4":
                        scheduledPresetA.enabledTemp = preset4.enabledTemp
                        scheduledPresetA.temp = preset4.temp
                        scheduledPresetA.frontDefrost = preset4.frontDefrost
                        scheduledPresetA.rearDefrost = preset4.rearDefrost
                        scheduledPresetA.steeringWheel = preset4.steeringWheel
                    default:
                        break
                    }
                } label: {
                    Text("Copy")
                }
                HStack{
                    Picker("Temp", selection: $scheduledPresetA.temp) {
                        ForEach(62 ..< 83) {
                            Text("\($0)° F")
                        }
                    }
                    Toggle("", isOn: $scheduledPresetA.enabledTemp)
                }
                Text("Accessories Settings")
                Toggle("Front Defroster", isOn: $scheduledPresetA.frontDefrost)
                Toggle("Rear Window and Side Mirror Defrosters", isOn: $scheduledPresetA.rearDefrost)
                Toggle("Steering Wheel Heater", isOn: $scheduledPresetA.steeringWheel)
            }
            Section {
                Toggle("Climate Schedule B", isOn: $scheduledPresetB.enabled)
                DatePicker("Set Climate Start Time", selection: $scheduledPresetB.time, displayedComponents: .hourAndMinute)
                HStack {
                    Text("Set Days")
                    Spacer()
                    Text("S M T W T F S")
                }
                Picker("Quick Copy from:", selection: $selectCopyB) {
                    ForEach(quickCopy, id: \.self) {
                        Text($0)
                    }
                }
                Button {
                    switch selectCopyB {
                    case "Preset 1":
                        scheduledPresetB.enabledTemp = preset1.enabledTemp
                        scheduledPresetB.temp = preset1.temp
                        scheduledPresetB.frontDefrost = preset1.frontDefrost
                        scheduledPresetB.rearDefrost = preset1.rearDefrost
                        scheduledPresetB.steeringWheel = preset1.steeringWheel
                    case "Preset 2":
                        scheduledPresetB.enabledTemp = preset2.enabledTemp
                        scheduledPresetB.temp = preset2.temp
                        scheduledPresetB.frontDefrost = preset2.frontDefrost
                        scheduledPresetB.rearDefrost = preset2.rearDefrost
                        scheduledPresetB.steeringWheel = preset2.steeringWheel
                    case "Preset 3":
                        scheduledPresetB.enabledTemp = preset3.enabledTemp
                        scheduledPresetB.temp = preset3.temp
                        scheduledPresetB.frontDefrost = preset3.frontDefrost
                        scheduledPresetB.rearDefrost = preset3.rearDefrost
                        scheduledPresetB.steeringWheel = preset3.steeringWheel
                    case "Preset 4":
                        scheduledPresetB.enabledTemp = preset4.enabledTemp
                        scheduledPresetB.temp = preset4.temp
                        scheduledPresetB.frontDefrost = preset4.frontDefrost
                        scheduledPresetB.rearDefrost = preset4.rearDefrost
                        scheduledPresetB.steeringWheel = preset4.steeringWheel
                    default:
                        break
                    }
                } label: {
                    Text("Copy")
                }
                HStack{
                    Picker("Temp", selection: $scheduledPresetB.temp) {
                        ForEach(62 ..< 83) {
                            Text("\($0)° F")
                        }
                    }
                    Toggle("", isOn: $scheduledPresetB.enabledTemp)
                }
                Text("Accessories Settings")
                Toggle("Front Defroster", isOn: $scheduledPresetB.frontDefrost)
                Toggle("Rear Window and Side Mirror Defrosters", isOn: $scheduledPresetB.rearDefrost)
                Toggle("Steering Wheel Heater", isOn: $scheduledPresetB.steeringWheel)
            }
        }
        .navigationTitle("Schedule Climate Start")
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScheduleView(preset1: Preset(), preset2: Preset(), preset3: Preset(), preset4: Preset())
        }
    }
}
