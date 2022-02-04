//
//  LocationView.swift
//  Location
//
//  Created by Etienne Vautherin on 03/02/2022.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject var model: ViewModel
    @State var isSsettingsActive = false
    
    let animationDuration = 1.0
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                ZStack {
                        Map(coordinateRegion: $model.userCoordinateRegion)
                    
                        if (isSsettingsActive) {
                            ZStack {
                                Circle()
                                    .strokeBorder(Color.white, lineWidth: 3)
                                    .frame(width: 22.0, height: 22.0)
                                Rectangle()
                                    .frame(width: 22, height: 2, alignment: .center)
                                Rectangle()
                                    .frame(width: 2, height: 22, alignment: .center)
                            }
                            .transition(
                                AnyTransition.opacity.animation(.linear(duration: animationDuration))
                            )
                        } else {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 20.0, height: 20.0)
                                .transition(
                                    AnyTransition.opacity.animation(.linear(duration: animationDuration))
                                )
                        }
                        
                    }
                    .onAppear(perform: {
                        LocationService.shared.start(model: model)
                    })
                    .onDisappear(perform: {
                        LocationService.shared.stop()
                    })
                
                Button {
                    print("Geofencing")
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        isSsettingsActive.toggle()
                    }
                } label: {
                    if (isSsettingsActive) {
                        Image(systemName: "xmark.circle")
                    } else {
                        Image(systemName: "circle.dashed")
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()

            }

            if (isSsettingsActive) {
                SettingsView()
                    .transition(
                        AnyTransition.opacity.animation(.linear(duration: animationDuration))
                    )
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().environmentObject(ViewModel())
    }
}
