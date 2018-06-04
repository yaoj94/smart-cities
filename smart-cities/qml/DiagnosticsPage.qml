import QtQuick 2.0

Item {
    id:diagnosticsPageInterface

    property bool showDiagnostics: false

    property alias gpsActive: rviNotifications.gpsActive
    property alias rviConnected: rviNotifications.rviConnected
    property alias rviInitialized: rviNotifications.rviInitialized
    property alias gpsError: rviNotifications.gpsError
    property alias satInUse: rviNotifications.satInUse
    property alias satInView: rviNotifications.satInView

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

                text: diagnosticsPageInterface.rviInitialized ? "RVI initialized" : diagnosticsPageInterface.rviConnected ? "RVI connected" : "RVI failed to initialize"
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
                text: "GPS status: " + diagnosticsPageInterface.psError
            }
        }

        // Satellite info
        Rectangle {
            id: satelliteInfoArea
            width: parent.width
            height: parent.height * .3
            opacity: 0
            anchors.horizontalCenter : parent.horizontalCenter
            anchors.top : gpsMessageArea.bottom

            Text {
                id: satelliteInfo
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
                text: "Satellites in view: " + diagnosticsPageInterface.satInView + "  Satellites in use: " + diagnosticsPageInterface.satInUse
            }
        }

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

    RviNotificationLayer {
        id: rviNotifications
    }
}
