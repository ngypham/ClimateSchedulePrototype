//
//  PresetView.swift
//  ScheduleClimatePrototype
//
//  Created by Nguyen Pham on 6/10/23.
//

import SwiftUI

class Preset: ObservableObject {
// Data based off of HAC Prod Ioniq 6
    // defaultToggle doesn't actually work by disabling other instances where it's true
    @Published var defaultToggle = false
    @Published var name = ""
    @Published var enabledTemp = false
    @Published var temp = 62
    @Published var frontDefrost = false
    @Published var rearDefrost = false
    @Published var steeringWheel = false
    // Next two are properties that are used to control scheduled presets. They should be in their own subclass, but I was too lazy to program it
    @Published var enabled = false
    @Published var time = Date.now
}

struct PresetView: View {
    // Should create a separate copied instance to store settings changes before hitting the save button. Currently will write over original preset automatically. Maybe will add later along with save button
    @ObservedObject var preset = Preset()
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Preset Name")
                    TextField("Preset Name", text: $preset.name)
                }
                Toggle("Set As Default Preset", isOn: $preset.defaultToggle)
            }
            Section {
                // Slightly different format than how the app formats temperature, since I'm bad at formatting
                HStack{
                    Picker("Temp", selection: $preset.temp) {
                        ForEach(62 ..< 83) {
                            Text("\($0)° F")
                        }
                    }
                    Toggle("", isOn: $preset.enabledTemp)

                }
            }
            
            Section {
                Text("Accessories Settings")
                Toggle("Front Defroster", isOn: $preset.frontDefrost)
                Toggle("Rear Window and Side Mirror Defrosters", isOn: $preset.rearDefrost)
                Toggle("Steering Wheel Heater", isOn: $preset.steeringWheel)
            }
        }
        .navigationTitle("Preset Settings")
    }
}

struct PresetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PresetView()
        }
    }
}
