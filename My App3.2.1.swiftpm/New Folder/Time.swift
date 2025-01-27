import SwiftUI

import SwiftUI

import Foundation

func getDayOfYearAndTime() -> (dayOfYear: Int, minutes: Int, seconds: Int) {
    let now = Date()
    let calendar = Calendar.current
    
    // Calculate the day of the year
    let dayOfYear = calendar.ordinality(of: .day, in: .year, for: now) ?? 0
    
    // Extract hours, minutes, and seconds
    let components = calendar.dateComponents([.hour, .minute, .second], from: now)
    let minutes = (components.hour ?? 0) * 60 + (components.minute ?? 0)
    let seconds = components.second ?? 0
    
    return (dayOfYear, minutes, seconds)
}

// Example usage

