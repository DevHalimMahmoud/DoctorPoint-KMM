package com.abdelHalim.doctorpoint.presintation.utils

import com.russhwolf.settings.Settings


fun firstLaunch(): Boolean {
    val settings = Settings()
    return if (settings.getBoolean("isFirstTime", true)) {
        settings.putBoolean("isFirstTime", false)
        true
    } else {
        false
    }
}
