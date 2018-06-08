import QtQuick 2.0
import QtQml 2.2

Item {
    id: dateController

    readonly property string currentDateString: privates.dateString
    readonly property string currentTimeString: privates.time
    readonly property string currentWeekdayString: privates.weekdayString
    readonly property string currentMonthString: privates.monthString
    readonly property string currentDayString: privates.dayString

    /* Default to 24 hour time display */
    property bool show12HourClock: false


    QtObject {
        id: privates

        property date date: new Date()
        property string time: ""
        property string dateString: ""
        property string weekdayString: ""
        property string monthString: ""
        property string dayString: ""
        readonly property string timeFormat: show12HourClock ? "h:mm AP" : "hh:mm"
        readonly property string dateFormat: "dddd, MMM d"
        readonly property string weekdayFormat: "ddd"
        readonly property string monthFormat: "MMM"
        readonly property string dayFormat: "d"
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            var d = new Date()
            privates.date = new Date(d.getTime() - (3600000*7))
            privates.time = privates.date.toLocaleTimeString(Qt.locale(), privates.timeFormat)
            privates.dateString = privates.date.toLocaleDateString(Qt.locale(), privates.dateFormat)
            privates.weekdayString = privates.date.toLocaleDateString(Qt.locale(), privates.weekdayFormat)
            privates.monthString = privates.date.toLocaleDateString(Qt.locale(), privates.monthFormat)
            privates.dayString = privates.date.toLocaleDateString(Qt.locale(), privates.dayFormat)

        }
    }

}
