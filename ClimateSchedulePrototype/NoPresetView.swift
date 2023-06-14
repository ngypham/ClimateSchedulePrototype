//
//  NoPresetView.swift
//  ClimateSchedulePrototype
//
//  Created by Nguyen Pham on 6/13/23.
//

import SwiftUI

struct NoPresetView: View {
    @StateObject private var preset = Preset()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
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
            
            Button {
                dismiss()
            } label: {
                Text("Start Vehicle Now")
            }
        }
        // Too lazy to adjust title style to make "Climate Start Without Presets" fit
        .navigationTitle("Start Without Presets")
    }
}

struct NoPresetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoPresetView()
        }
    }
}
