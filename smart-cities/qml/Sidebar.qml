import QtQuick 2.0

Item {
    id: sidebarContainer

    property int commonAnimationDuration

    signal goHome ()
    signal toggleTrayState ()

    function openAppTray () {
        trayButtonObject.screenSideLeft = false;
        trayButtonObject.barTimer.restart();
    }

    function closeAppTray () {
        trayButtonObject.screenSideLeft = true;
        trayButtonObject.barTimer.restart();
    }

    GeniviLogo {
        id: geniviLogoObject
        height: parent.height * 0.225
        width: parent.width
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // Add diagnostics button to bottom of sidebar
    DiagnosticsButton {
        id: diagnosticsButton
        height: parent.height * 0.5
        width: parent.width
        anchors.top: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TrayButton {
        id: trayButtonObject
        anchors.fill: parent
//        barTimerInterval: commonAnimationDuration

//        onTrayPressed: toggleTrayState()
    }
}
