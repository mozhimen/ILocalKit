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

public extension Date{
    func date2strDateLocalized(dateStyle:DateFormatter.Style,timeStyle:DateFormatter.Style,locale:Locale,timeZone:TimeZone?=nil)->String{
        return LocalKDateFormatter.date2strDateLocalized(date: self, dateStyle: dateStyle, timeStyle: timeStyle, locale: locale, timeZone: timeZone)
    }
}

public final class LocalKDateFormatter{
    public static func date2strDateLocalized(date:Date,dateStyle:DateFormatter.Style,timeStyle:DateFormatter.Style,locale:Locale,timeZone:TimeZone?=nil)->String{
        return UtilKDateFormatterWrapper.get_localized(dateStyle: dateStyle, timeStyle: timeStyle, locale: locale, timeZone: timeZone).string(from: date)
    }
}

//struct MyView:View {
//    var body: some View {
//    Text("1")
//    }
//}
//
//#Preview {
//    MyView()
//}
