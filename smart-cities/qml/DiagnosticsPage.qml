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
        Rectangle {
            id: rviMessageArea
            width: parent.width
            height: parent.height * .3
            opacity: 0
            anchors.horizontalCenter : parent.horizontalCenter
            anchors.top : parent.top

            Text {
                id: rviMessage
                width: parent.width
                height: parent.height * .5
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: parent.height * .025
                font.family: "Eurostyle"
                font.pixelSize: parent.height * .2
                wrapMode: Text.WordWrap
                color: "black"
                text: RviNotificationLayer.rviInitialized ? "RVI initialized" : RviNotificationLayer.rviConnected ? "RVI connected" : "RVI failed to initialize"
            }
        }

        // GPS info
        Rectangle {
            id: gpsMessageArea
            width: parent.width
            height: parent.height * .3
            opacity: 0
            anchors.horizontalCenter : parent.horizontalCenter
            anchors.top : rviMessageArea.bottom

            Text {
                id: gpsMessage
                width: parent.width
                height: parent.height * .5
                anchors.top: parent.top
                anchors.topMargin: parent.height * .025
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Eurostyle"
                font.pixelSize: parent.height * .2
                wrapMode: Text.WordWrap
                color: "black"
                text: "GPS status: " + RviNotificationLayer.gpsError
            }
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
