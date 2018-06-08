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
    property alias speed: rviNotifications.speed
    property alias direction: rviNotifications.direction
    property alias rviServiceName: rviNotifications.rviServiceName
    property alias gpsParams: rviNotifications.gpsParams

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

        Text {
            id: rviStatus
            text: diagnosticsPageInterface.rviConnected ? "RVI connected" : diagnosticsPageInterface.rviInitialized ? "RVI initialized" : "RVI failed to initialize"
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }
/*
        Text {
            id: serviceName
            text: "Service Name: " + diagnosticsPageInterface.rviServiceName
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: rviStatus.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }*/

        Text {
            id: gpsMessage
            text: "GPS status: " + diagnosticsPageInterface.gpsActive
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: rviStatus.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

        Text {
            id: gpsParamsMessage
            text: diagnosticsPageInterface.gpsParams
            fontSizeMode: Text.VerticalFit
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            width: parent.width
            wrapMode: Text.WordWrap
            anchors.top: gpsMessage.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

       /* Text {
            id: latitudeData
            text: "Latitude: " + diagnosticsPageInterface.latitute
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: gpsMessage.bottom
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
            id: gpsSpeed
            text: "Speed: " + diagnosticsPageInterface.speed
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: longitudeData.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

        Text {
            id: gpsDirection
            text: "Heading: " + diagnosticsPageInterface.direction
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: gpsSpeed.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        }

        Text {
            id: timestamp
            text: "Timestamp: " + diagnosticsPageInterface.gpsTimestamp
            color: "black"
            font.pixelSize: parent.height * 0.05
            font.family: "Eurostyle"
            anchors.top: gpsDirection.bottom
            anchors.topMargin: parent.height * 0.025
            anchors.left: parent.left
        } */
    }

}
