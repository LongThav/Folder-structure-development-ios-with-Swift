import Foundation

class DateUtils {
    
    // Format a date into a readable string
    static func formatDateToString(_ date: Date, withFormat format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    // Convert a string into a Date object
    static func stringToDate(_ string: String, withFormat format: String = "yyyy-MM-dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: string)
    }
}
