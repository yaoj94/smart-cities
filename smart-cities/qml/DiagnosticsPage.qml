import QtQuick 2.0

Item {
    id:diagnosticsPageInterface

    property bool showDiagnostics: false

    Item {
        id: diagnoticsPageArea
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        visible: showDiagnostics

        Rectangle {
            id: background
            width: parent.width
            height: parent.height
            anchors.centerIn: parent

            color: "darkgrey"
        }

        // RVI info
        Text {
            x: 89
            y: 76
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            // displays whether or not the RVI was initialized or connected
            text: RviNotificationLayer.rviInitialized ? "RVI initialized" : RviNotificationLayer.rviConnected ? "RVI connected" : "RVI failed to initialize"
            color: "black"

        }

        // GPS info
        Text {
            x: 89
            y: 170
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            text: "GPS status: " + RviNotificationLayer.gpsError
            color: "black"
        }

        // Satellite info


        /*
        Text {
            text: "Diagnostics"
            color: "black"
            font.pixelSize: parent.height * 0.15
            font.family: "Eurostyle"
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.025
            anchors.horizontalCenter: parent.horizontalCenter
        } */
    }
}
