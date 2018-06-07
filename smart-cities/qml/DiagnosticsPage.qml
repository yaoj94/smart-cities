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
                visible: true
                //width: parent.width
                //height: parent.height * .5
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: parent.height * .025
                font.family: "Eurostyle"
                font.pixelSize: parent.height * .2
                wrapMode: Text.WordWrap
                color: "black"
                text: "test"
                //text: diagnosticsPageInterface.rviInitialized ? "RVI initialized" : diagnosticsPageInterface.rviConnected ? "RVI connected" : "RVI failed to initialize"
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
                text: "GPS status: " + diagnosticsPageInterface.gpsError
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
        }*/


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
        }
    }

}
