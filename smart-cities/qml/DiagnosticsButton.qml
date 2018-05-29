import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id: diagnosticsButtonInterface

    Button {
        onClicked:
            diagnosticsPage.showDiagnostics = !diagnosticsPage.showDiagnostics
    }
}
