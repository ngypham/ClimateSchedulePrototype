//
//  PresetView.swift
//  ScheduleClimatePrototype
//
//  Created by Nguyen Pham on 6/10/23.
//

import SwiftUI

class Preset: ObservableObject {
    @Published var enabled = false
    @Published var name = ""
    @Published var defaultToggle = false
    @Published var enabledTemp = false
    @Published var temp = 62
    @Published var frontDefrost = false
    @Published var rearDefrost = false
    @Published var steeringWheel = false
    @Published var time = Date.now
}

struct PresetView: View {
    @ObservedObject var preset = Preset()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Preset Name")
                        TextField("Preset Name", text: $preset.name)
                    }
                    Toggle("Set As Default Preset", isOn: $preset.defaultToggle)
                }
                Section {
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
}

struct PresetView_Previews: PreviewProvider {
    static var previews: some View {
        PresetView()
    }
}
