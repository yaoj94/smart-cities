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

            color: colors.darkGray
        }
    }
}
