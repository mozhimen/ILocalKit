// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI
import SUtilKit_SwiftUI

///
///样式类型说明
///
///DateStyle
///样式    英文示例    中文示例
///.none    不显示日期    不显示日期
///.short    "11/23/23"    "2023/11/23"
///.medium    "Nov 23, 2023"    "2023年11月23日"
///.long    "November 23, 2023"    "2023年11月23日"
///.full    "Thursday, November 23, 2023"    "2023年11月23日 星期四"
///
///TimeStyle
///样式    英文示例    中文示例
///.none    不显示时间    不显示时间
///.short    "3:30 PM"    "下午3:30"
///.medium    "3:30:00 PM"    "下午3:30:00"
///.long    "3:30:00 PM GMT+8"    "GMT+8 下午3:30:00"
///.full    同 .long    同 .long
import Foundation

public final class UtilKDateFormatterWrapper2{
    nonisolated(unsafe) private static var _dateFormatters: [String: DateFormatter] = [:]
    private static let _queue = DispatchQueue(label: "com.mozhimen.localk.date.cache", attributes: .concurrent)
    
    public static func get(dateStyle:DateFormatter.Style,timeZone:TimeZone? = nil) -> DateFormatter {
        let key = timeZone != nil ? "\(pattern)\(timeZone!)" : pattern
        // 读操作（并发）
        if let formatter = _queue.sync(execute: { _dateFormatters[key] }) {
            return formatte
        }
        // 写操作（屏障保护）
        return _queue.sync(flags: .barrier) {
            if let formatter = _dateFormatters[key] {
                return formatter
            }
            
            let formatter = UtilKDateFormatter.get()
            formatter.dateFormat = pattern
            formatter.dateStyle = dateStyle
            formatter.timeZone = timeZone ?? UtilKTimeZone.get(secondsFromGMT: 0)
            _dateFormatters[key] = formatter
            return formatter
        }
    }
}

struct MyView:View {
    var body: some View {
    Text("1")
    }
}

#Preview {
    MyView()
}
