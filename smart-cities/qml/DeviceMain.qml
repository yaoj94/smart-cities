import QtQuick 2.0
import QtQuick.Window 2.2
import com.genivi.hmicontroller 1.0

Window {
    id: root
    property bool nightMode: false

    width: Screen.width
    height: Screen.height
    flags: Qt.FramelessWindowHint | Qt.Window
    visible: true
    color: "transparent"

    Colors {
        id: colors
        isNightMode: nightMode
    }



    HMIController {
        id: hmiController
    }

    Home {
        id: homeObject
        anchors.fill: parent

        /*transform: Rotation {
            angle: 180
            origin.x: root.width/2
            origin.y: root.height/2
        }*/

        // Wire up Home API to HMIController API
//        appIsDisplayed: hmiController.appIsDisplayed
        //TODO when apllications like radio and hvac arrive use the hmiController
        // for now we will mock out the home screen
//        homeApplicationsModel: HomeApplicationsModel {}
        //homeApplicationsModel: hmiController.homeApplicationsModel
//        trayApplicationsModel: hmiController.allApplicationsModel

//        onRequestOpenHomeApplication: { hmiController.openApp(id); hmiController.stackLauncherOnTop(false) }
//        onRequestOpenTrayApplication: hmiController.openApp(id)
//        onRequestOpenHomeScreen: hmiController.openHomeScreen()
//        onApplicationAreaChanged: hmiController.setApplicationArea(applicationArea)
//        onTrayAboutToSlideOut: hmiController.stackLauncherOnTop(true)
//        onTrayFinishedSlidingIn: hmiController.stackLauncherOnTop(false)
    }
}
