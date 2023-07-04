//
//  CalendarController.swift
//  Calendar
//
//  Created by sathish-pt6686 on 03/07/23.
//

import Foundation
import AppKit

public class CalendarController{
    
    weak var collectionViewManager: CollectionViewManager!
    
    static var date : Date = Date()
    
    static var thisMonthDates : [Date] = []
    
    public var previousbutton : NSButton = {
        let button = NSButton()
        button.title = "<<"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.action = #selector(previousButtonClick)
        return button
    }()
    
    public var nextbutton : NSButton = {
        let button = NSButton()
        button.title = ">>"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.action = #selector(nextButtonClick)
        return button
    }()
    
    public var todaybutton : NSButton = {
        let button = NSButton()
        button.title = "Today"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.action = #selector(todayButtonClick)
        return button
    }()
    
    public var currentMonth : NSTextField = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, YYYY"
        let textField = NSTextField(labelWithString: "\(dateFormatter.string(from: date))")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    public func updateCurrentMonth(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, YYYY"
        currentMonth.stringValue = dateFormatter.string(from: CalendarController.date)
        generateDates()
        collectionViewManager.collectionView.reloadData()
    }
    
    @objc
    public func nextButtonClick(){
        let newDate = Calendar(identifier: .iso8601).date(byAdding: .month, value: 1, to: CalendarController.date)!
        CalendarController.date = newDate
        updateCurrentMonth()
    }
    
    @objc
    public func todayButtonClick(){
        CalendarController.date = Date()
        updateCurrentMonth()
    }
    
    @objc
    public func previousButtonClick(){
        let newDate = Calendar(identifier: .iso8601).date(byAdding: .month, value: -1, to: CalendarController.date)!
        CalendarController.date = newDate
        updateCurrentMonth()
    }
    
    public func generateDates(){
        let numberOfDaysInCurrentMonth = Calendar.current.range(of: .day, in: .month, for: CalendarController.date)!.count
        let dateComponents = Calendar.current.dateComponents([.month, .year], from: CalendarController.date)
        var firstDateOfMonth = Calendar.current.date(from: dateComponents)!
        var currentDateOfMonth = firstDateOfMonth

        CalendarController.thisMonthDates = []
        
        CalendarController.thisMonthDates += addLeftPadding(date: firstDateOfMonth)
        
        var count = 0
        
        while(count < numberOfDaysInCurrentMonth){
            CalendarController.thisMonthDates.append(currentDateOfMonth)
            currentDateOfMonth = Calendar.current.date(byAdding: .day, value: 1, to: currentDateOfMonth)!
            count = count + 1
        }
        
        let lastDateOfMonth = Calendar.current.date(byAdding: .day, value: -1, to: currentDateOfMonth)!
        
        CalendarController.thisMonthDates += addRightPadding(date: lastDateOfMonth)

    }
    
    public func addLeftPadding(date: Date) -> [Date]{
        var date = date
        var day = Calendar.current.dateComponents([.weekday], from: date).weekday!
        var leftPadding : [Date] = []
        
        var previousMonthBalance = day - 1
        while previousMonthBalance != 0{
            date = Calendar.current.date(byAdding: .day, value: -1, to: date)!
            leftPadding.insert(date, at: 0)
            previousMonthBalance = previousMonthBalance - 1
        }
        return leftPadding
    }
    
    public func addRightPadding(date: Date) -> [Date]{
        var date = date
        var rightPadding : [Date] = []
        
        var nextMonthBalance = 42 - CalendarController.thisMonthDates.count
        while nextMonthBalance != 0{
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
            rightPadding.append(date)
            nextMonthBalance = nextMonthBalance - 1
        }
        return rightPadding
    }

}
