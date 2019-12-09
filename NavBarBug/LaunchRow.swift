//
//  LaunchRow.swift
//  SwiftUICloudKitDemo
//
//  Created by James Hillhouse IV on 11/18/19.
//

import SwiftUI

struct LaunchRow: View {

        var launch: LaunchEvent

        @Binding var currentDate: Date


        var body: some View {
            HStack {

                Text(launch.launchName)
                    .frame(alignment: .trailing)
                    .font(.system(.body, design: .monospaced))

                Spacer()

                Text(stringFromTimeInterval())
                    .frame(width: 160, alignment: .trailing)
                    .font(.system(.body, design: .monospaced))
            }
        }




        func getDate(from dateString: String) -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            return dateFormatter.date(from: dateString) // replace Date String
        }




        /// Calculates the individual time elements for a countdown and then sets the string elements.
        func stringFromTimeInterval() -> String
        {
            let date            = getDate(from: launch.launchDate)
            var timeInterval    = Int(currentDate.timeIntervalSince(date!))

            let signFlag: String

            if timeInterval < 0
            {
                signFlag = "-"
                timeInterval    = -timeInterval
            }
            else
            {
                signFlag = "+"
            }

            let days            = ( timeInterval / 86400 )
            let remainingTime   = ( timeInterval - ( days * 86400 ) )
            //let ms              = Int(( timeInterval % 1 ) * 1000 )
            let seconds         = remainingTime % 60
            let minutes         = ( remainingTime / 60 ) % 60
            let hours           = remainingTime / 3600

            let secondsString       = NSString(format: "%0.2d", seconds) as String
            let minutesString       = NSString(format: "%0.2d", minutes) as String
            let hoursString         = NSString(format: "%0.2d", hours) as String
            let daysString          = NSString(format: "%0.2d", days) as String
            let plusMinusString     = NSString(format: "%@", signFlag) as String

            let countdownString = String(plusMinusString + daysString + " " + hoursString + ":" + minutesString + ":" + secondsString)

            return countdownString
        }



        func plusMinusSign(_ launchDate: Date) -> String {
            var timeInterval        = Int(currentDate.timeIntervalSince(launchDate))

            let signFlag: String

            if timeInterval < 0
            {
                signFlag = "-"
                timeInterval    = -timeInterval
            }
            else
            {
                signFlag = "+"
            }

            return  NSString(format: "%@", signFlag) as String

        }



        func countdownDays(_ launchDate: Date) -> String {
            var timeInterval    = Int(currentDate.timeIntervalSince(launchDate))

            if timeInterval < 0
            {
                timeInterval    = -timeInterval
            }

            let days: Int       = ( timeInterval / 86400 )

            return String(format: "%0.2d", days)
        }


        func countdownHours(_ launchDate: Date) -> String {
            var timeInterval    = Int(currentDate.timeIntervalSince(launchDate))

            if timeInterval < 0
            {
                timeInterval    = -timeInterval
            }

            let days            = ( timeInterval / 86400 )
            let remainingTime   = ( timeInterval - ( days * 86400 ) )
            //let ms              = Int(( timeInterval % 1 ) * 1000 )
            _                   = remainingTime % 60
            _                   = ( remainingTime / 60 ) % 60
            let hours           = remainingTime / 3600

            return String(format: "%0.2d", hours)
        }



        func countdownMinutes(_ launchDate: Date) -> String {
            var timeInterval    = Int(currentDate.timeIntervalSince(launchDate))

            if timeInterval < 0
            {
                timeInterval    = -timeInterval
            }

            let days            = ( timeInterval / 86400 )
            let remainingTime   = ( timeInterval - ( days * 86400 ) )
            //let ms              = Int(( timeInterval % 1 ) * 1000 )
            _                   = remainingTime % 60
            let minutes         = ( remainingTime / 60 ) % 60

            return String(format: "%0.2d", minutes)
        }



       func countdownSeconds(_ launchDate: Date) -> String {
            var timeInterval    = Int(currentDate.timeIntervalSince(launchDate))

            if timeInterval < 0
            {
                timeInterval    = -timeInterval
            }

            let days            = ( timeInterval / 86400 )
            let remainingTime   = ( timeInterval - ( days * 86400 ) )
            //let ms              = Int(( timeInterval % 1 ) * 1000 )
            let seconds         = remainingTime % 60
            print("seconds: \(seconds)")

            return String(format: "%0.2d", seconds)
        }

    }


    /*
    struct LaunchRow_Previews: PreviewProvider {
        static var previews: some View {
            LaunchRow(launch: launch)
        }
    }
    */
