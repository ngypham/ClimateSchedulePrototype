//
//  ContentView.swift
//  ScheduleClimatePrototype
//
//  Created by Nguyen Pham on 6/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var preset1 = Preset()
    @StateObject var preset2 = Preset()
    @StateObject var preset3 = Preset()
    @StateObject var preset4 = Preset()
    @ObservedObject var scheduledPresetA = Preset()
    @ObservedObject var scheduledPresetB = Preset()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ScheduleView(preset1: preset1, preset2: preset2, preset3: preset3, preset4: preset4, scheduledPresetA: scheduledPresetA, scheduledPresetB: scheduledPresetB)) {
                    Text("Schedule Climate Start")
                }
                NavigationLink(destination: PresetView(preset: preset1)) {
                    Text("Preset 1 \(preset1.name)")
                }
                NavigationLink(destination: PresetView(preset: preset2)) {
                    Text("Preset 2 \(preset2.name)")
                }
                NavigationLink(destination: PresetView(preset: preset3)) {
                    Text("Preset 3 \(preset3.name)")
                }
                NavigationLink(destination: PresetView(preset: preset4)) {
                    Text("Preset 4 \(preset4.name)")
                }
            }
            .navigationTitle("Climate Start Presets")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scheduledPresetA: Preset(), scheduledPresetB: Preset())
    }
}
