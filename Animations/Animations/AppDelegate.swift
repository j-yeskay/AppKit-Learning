//
//  AppDelegate.swift
//  Animations
//
//  Created by sathish-pt6686 on 30/05/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    public var windowController : WindowController!
    public var viewController: ViewController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowController = WindowController()
        viewController = ViewController()
        windowController.contentViewController = viewController

//        func printCalendar(forYear year: Int, month: Int) {
//        let year = 2023
//        let month = 6
//        var calendar = Calendar(identifier: .iso8601)
//        calendar.timeZone = .autoupdatingCurrent
//        calendar.timeZone = NSTimeZone.system
//        print(calendar.timeZone)
        //        print(calendar.monthSymbols)
            
            // Create a date components object with the desired year and month
//            var dateComponents = DateComponents()
//            dateComponents.year = year
//            dateComponents.month = month
//        dateComponents.timeZone = NSTimeZone.system
//            print(dateComponents)
        
//        calendar.timeZone = TimeZone(identifier: "")
    
            // Create a date from the date components
//            guard let date = calendar.date(from: dateComponents) else {
//                print("Invalid date")
//                return
//            }
//        print(date)
            // Set the desired date format
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd EEEE"
            
            // Get the range of days in the month
//        let range = calendar.range(of: .day, in: .month, for: date)!
//            print(range)
            // Print the calendar header
//            print("\(dateFormatter.string(from: date))")
//        let year = 2023
//        let month = 6
//        var calendar = Calendar(identifier: .iso8601)

        // Create a date components object with the desired year, month, and day
//        var dateComponents = DateComponents()
//        dateComponents.year = year
//        dateComponents.month = month
//        dateComponents.day = 1
        
//        dateComponents.hour = 12
//        dateComponents.minute = 0
//        dateComponents.second = 0
        
//        calendar.date(from: Date)
        
        // Create a date from the date components with the system's time zone
//        var systemTimeZone = TimeZone.current
//        calendar.timeZone = systemTimeZone
//        guard let date = calendar.date(from: dateComponents) else {
//            print("Invalid date")
//            return
//        }
//        print(date)
//            print("Sun Mon Tue Wed Thu Fri Sat")
            
            // Get the first day of the month
//            var firstWeekday = calendar.component(.weekday, from: date)
            
            // Print the empty spaces for the days before the first day of the month
//            for _ in 1..<firstWeekday {
//                print("    ", terminator: "")
//            }
            
            // Print the days of the month
//            var day = 1
//            for _ in 1...range.count {
//                print(String(format: "%2d  ", day), terminator: "")
                
                // Move to the next line after Saturday
//                if firstWeekday == 7 {
//                    print("")
//                }
                
                // Increment the day and weekday
//                day += 1
//                firstWeekday = (firstWeekday % 7) + 1
//            }
            
             // Add a newline at the end

        // Example usage

        
        windowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

