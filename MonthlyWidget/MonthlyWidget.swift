//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by LinhNguyen DGWA on 16/02/2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (DayEntry) -> ()) {
        let entry = DayEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [DayEntry] = []
        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
            if let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate) {
                let startOfDate = Calendar.current.startOfDay(for: entryDate)
                let entry = DayEntry(date: startOfDate)
                entries.append(entry)
            }
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct DayEntry: TimelineEntry {
    let date: Date
    var monthConfig: MonthConfig {
        return MonthConfig.determineConfig(from: date)
    }
}

struct MonthlyWidgetEntryView : View {
    var entry: DayEntry

    var body: some View {
        if #available(iOSApplicationExtension 17.0, *) {
            MonthlyWidgetView(entry: entry)
                .containerBackground(for: .widget, alignment: .center) {
                ContainerRelativeShape().fill(entry.monthConfig.backgroundColor.gradient)
            }
        } else {
            ZStack {
                ContainerRelativeShape().fill(entry.monthConfig.backgroundColor)
                MonthlyWidgetView(entry: entry)
            }
        }
    }
}

struct MonthlyWidgetView : View {
    var entry: DayEntry

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(entry.monthConfig.emojiText).font(.title2)
                    Text(entry.date.weekdayDisplayFormat).font(.title3)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.6)
                        .foregroundColor(entry.monthConfig.weekdayTextColor.opacity(0.6))
                    Spacer()
                }.padding(.horizontal)
                Text(entry.date
                    .dayDisplayFormat)
                .font(.system(size: 80, weight: .heavy))
                .foregroundColor(entry.monthConfig.dayTextColor.opacity(0.8))
            }
        }
    }
}

struct MonthlyWidget: Widget {
    let kind: String = "MonthlyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MonthlyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Monthly Style Widget")
        .description("The theme of the widget changes based on month.")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    MonthlyWidget()
} timeline: {
    DayEntry(date: Date())
    DayEntry(date: Date())
}

extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday()).uppercased()
    }

    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}
