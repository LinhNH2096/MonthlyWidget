//
//  SwiftUI.swift
//  Monthly
//
//  Created by LinhNguyen DGWA on 19/02/2024.
//

import SwiftUI

struct MonthConfig {
    let backgroundColor: Color
    let emojiText: String
    let weekdayTextColor: Color
    let dayTextColor: Color

    static func determineConfig(from date: Date) -> MonthConfig {
        let monthInt: Int = Calendar.current.component(.month, from: date)
        switch monthInt {
        case 1: return MonthConfig(backgroundColor: .gray, emojiText: "⛄️",
                                   weekdayTextColor: .black.opacity(0.6),
                                   dayTextColor: .white.opacity(0.8))
        case 2: return MonthConfig(backgroundColor: .pink, emojiText: "❤️",
                                   weekdayTextColor: .black.opacity(0.5),
                                   dayTextColor: .white.opacity(0.8))
        case 3: return MonthConfig(backgroundColor: .green, emojiText: "☘️",
                                   weekdayTextColor: .black.opacity(0.5),
                                   dayTextColor: .white.opacity(0.8))
        case 4: return MonthConfig(backgroundColor: .blue, emojiText: "☔️",
                                   weekdayTextColor: .black.opacity(0.5),
                                   dayTextColor: .purple.opacity(0.8))
        case 5: return MonthConfig(backgroundColor: .yellow, emojiText: "🌺",
                                   weekdayTextColor: .black.opacity(0.5),
                                   dayTextColor: .pink.opacity(0.8))
        case 6: return MonthConfig(backgroundColor: .blue, emojiText: "🌤️",
                                   weekdayTextColor: .black.opacity(0.5),
                                   dayTextColor: .yellow.opacity(0.8))
        case 7: return MonthConfig(backgroundColor: .blue, emojiText: "🏖️",
                                   weekdayTextColor: .black.opacity(0.5),
                                   dayTextColor: .white.opacity(0.8))
        case 8: return MonthConfig(backgroundColor: .orange, emojiText: "☀️",
                                   weekdayTextColor: .black.opacity(0.5),
                                   dayTextColor: .white.opacity(0.8))
        case 9: return MonthConfig(backgroundColor: .red, emojiText: "🍁",
                                   weekdayTextColor: .black.opacity(0.5),
                                   dayTextColor: .yellow.opacity(0.8))
        case 10: return MonthConfig(backgroundColor: .black, emojiText: "👻",
                                   weekdayTextColor: .white.opacity(0.6),
                                   dayTextColor: .orange.opacity(0.8))
        case 11: return MonthConfig(backgroundColor: .brown, emojiText: "🐳",
                                   weekdayTextColor: .black.opacity(0.6),
                                   dayTextColor: .black.opacity(0.6))
        case 12: return MonthConfig(backgroundColor: .red, emojiText: "🎄",
                                   weekdayTextColor: .white.opacity(0.9),
                                   dayTextColor: .green.opacity(0.7))
        default: return MonthConfig(backgroundColor: .gray, emojiText: "📅",
                                    weekdayTextColor: .black.opacity(0.6),
                                    dayTextColor: .white.opacity(0.8))
        }
    }
}

