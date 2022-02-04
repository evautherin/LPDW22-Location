//
//  GeofencingViewModel.swift
//  Location
//
//  Created by Etienne Vautherin on 04/02/2022.
//

import Foundation
import SwiftUI
import Combine


class GeofencingViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var meter = 5000.0
    @Published var geofencing = false
}
