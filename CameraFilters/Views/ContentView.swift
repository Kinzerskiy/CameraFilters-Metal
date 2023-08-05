//
//  ContentView.swift
//  CameraFilters
//
//  Created by Mac Pro on 07.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = ContentViewModel()
    
    var body: some View {
        ZStack {
            FrameView(image: model.frame)
                .edgesIgnoringSafeArea(.all)
            
            ErrorView(error: model.error)
            
            ControlView(
                comicSelected: $model.comicFilter,
                monoSelected: $model.monoFilter,
                crystalSelected: $model.crystalFilter,
                customSelected: $model.customFilter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
