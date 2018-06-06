import QtQuick 2.0

Item {
    id:diagnosticsPageInterface

    property bool showDiagnostics: false

    property string gpsActive: rviNotifications.gpsActive ? "active" : "inactive"
    property alias rviConnected: rviNotifications.rviConnected
    property alias rviInitialized: rviNotifications.rviInitialized
    property alias gpsError: rviNotifications.gpsError
    property alias satInUse: rviNotifications.satInUse
    property alias satInView: rviNotifications.satInView
    property alias longitude: rviNotifications.longitude
    property alias latitute: rviNotifications.latitude
    property alias gpsTimestamp: rviNotifications.gpsTimestamp
    property alias rviNodeId: rviNotifications.rviNodeId
    property alias rviConnectionError: rviNotifications.rviConnectionError

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

        RviNotificationLayer {
            id: rviNotifications
        }

/*
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
        }*/

/*
        Text {
            id: rviInitializedMessage
            text: diagnosticsPageInterface.rviInitialized ? "RVI initialized" : "RVI failed to initialize"
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }
        Text {
            id: rviConnectedMessage
            text: diagnosticsPageInterface.rviConnected ? "RVI connected" : "RVI not connected"
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: rviInitializedMessage.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }*/
        Text {
            id: rviConnection
            text: diagnosticsPageInterface.rviConnected ? "RVI connected" : diagnosticsPageInterface.rviInitialized ? "RVI initialized" : "RVI failed to initialize"
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

        Text {
            id: rviNodeMessage
            text: "RVI Node ID: " + diagnosticsPageInterface.rviNodeId
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: rviConnection.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }
        Text {
            id: rviErrors
            text: "RVI error: " + diagnosticsPageInterface.rviConnectionError
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: rviNodeMessage.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

        Text {
            id: gpsStatus
            text: "GPS status: " + diagnosticsPageInterface.gpsActive
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: rviErrors.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

        Text {
            id: gpsErrors
            text: "GPS errors: " + diagnosticsPageInterface.gpsError
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: gpsStatus.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

        Text {
            id: latitudeData
            text: "Latitude: " + diagnosticsPageInterface.latitute
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: gpsErrors.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

        Text {
            id: longitudeData
            text: "Longitude: " + diagnosticsPageInterface.longitude
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: latitudeData.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

        Text {
            id: timestamp
            text: "GPS Timestamp: " + diagnosticsPageInterface.gpsTimestamp
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: longitudeData.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }
    }

}
