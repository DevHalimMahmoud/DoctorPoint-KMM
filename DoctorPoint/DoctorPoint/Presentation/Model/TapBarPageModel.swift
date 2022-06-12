//
//  TapBarPageModel.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 12/06/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct TabBarPageModel: Identifiable {
    var id = UUID()
    var page: Any
    var icon: String
    var tag: String
    var color: Color
}
