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

    DiagnosticsButton {
        id: diagnosticsButton
        width: parent.width
        height: parent.height * 0.2
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TrayButton {
        id: trayButtonObject
        anchors.fill: parent
//        barTimerInterval: commonAnimationDuration

//        onTrayPressed: toggleTrayState()
    }
}
