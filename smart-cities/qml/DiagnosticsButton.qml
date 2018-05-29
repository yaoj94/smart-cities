import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    id: button
    onClicked:
        diagnosticsPage.showDiagnostics = !diagnosticsPage.showDiagnostics
    style: ButtonStyle {
        background: Rectangle {
            height: parent.height
            width: parent.width
            color: colors.primaryRed
        }
    }
}
