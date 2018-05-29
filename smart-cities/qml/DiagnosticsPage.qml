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
            visible: true

            Text {
                id: text1
                color: "#000000"
                font.pixelSize: 50
                font.family: "Courier"
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Diagnostics"
                anchors.top: parent.top
                anchors.topMargin: 12
                visible: true
            }
        }


    }
}
