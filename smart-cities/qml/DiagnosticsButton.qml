import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id: diagnosticsButtonInterface
    visible: true

    Button {
        onClicked:
            diagnosticsPage.showDiagnostics = !diagnosticsPage.showDiagnostics

        style: Rectangle {
            implicitHeight: parent.height
            implicitWidth: parent.width
            color: colors.primaryRed
        }
    }
}
