//
//  ControlView.swift
//  CameraFilters
//
//  Created by Mac Pro on 07.07.2023.
//

import SwiftUI

struct ControlView: View {
    @Binding var comicSelected: Bool
    @Binding var monoSelected: Bool
    @Binding var crystalSelected: Bool
    @Binding var customSelected: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 12) {
                ToggleButton(selected: $comicSelected, label: "Comic")
                ToggleButton(selected: $monoSelected, label: "Mono")
                ToggleButton(selected: $crystalSelected, label: "Crystal")
                ToggleButton(selected: $customSelected, label: "Custom")
            }
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ControlView(
                comicSelected: .constant(false),
                monoSelected: .constant(false),
                crystalSelected: .constant(false),
                customSelected: .constant(true))
        }
    }
}
