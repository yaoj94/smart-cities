import QtQuick 2.0
import QtQml 2.2

Item {
    id: dateController

    readonly property string currentDateString: privates.dateString
    readonly property string currentTimeString: privates.time

    /* Default to 24 hour time display */
    property bool show12HourClock: false

    QtObject {
        id: privates

        property date date: new Date()
        //date.setSeconds: date.getUTCSeconds() - 28800
        property string time: ""
        property string dateString: ""
        readonly property string timeFormat: show12HourClock ? "h:mm AP" : "hh:mm"
        readonly property string dateFormat: "dddd, MMM d"
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            privates.date = new Date()
            var timezone = -privates.date.getTimezoneOffset()/60
            privates.date.setHours(privates.date.getHours() + timezone)

            //privates.date.setOffsetFromUtc(-8)
            privates.time = privates.date.toLocaleTimeString(Qt.locale(), privates.timeFormat)
            privates.dateString = privates.date.toLocaleDateString(Qt.locale(), privates.dateFormat)
        }
    }


}
