import QtQuick 2.11
import QtQuick.Controls 2.4
//import QtQuick.Window 2.11
import QtLocation 5.11
import QtPositioning 5.11
import QtStudio3D 2.2

import QtGraphicalEffects 1.0

Item {
    id: root

    property bool inMenu: false
//    width: 1024
//    height: 800
//    visible: true

//    Map {
//        id: map
//        property MapCircle circle
//        property real naviTilt: 0
//        property real zoom: 12

//        function tiltIn() {
//            if (naviTilt < 60) {
//                naviTilt += 0.05
//            }
//        }
//        function zoomIn() {
//            if (zoom < 18) {
//                zoom += 0.001
//            }
//        }

//        anchors.fill: parent
//        plugin: Navi {}
//        center: QtPositioning.coordinate(65.101032, 25.417404) // Oslo
//        zoomLevel: zoom
//        tilt: naviTilt

//        Timer {
//            id: routeTimer
//            interval: 10
//            repeat: true
//            running: true
//            triggeredOnStart: true
//            onTriggered: {
//                map.tiltIn();
//                map.zoomIn();
//            }
//        }

//        onCenterChanged: {
//            console.log(center);
//            //circle.center = map.center
//        }

//        MapCircle {
//            id: circle
//            center: map.center
//            radius: 2
//            color: 'green'
//            border.width: 4
//            opacity: 0.2

//            Component.onCompleted: {
//                center = center
//            }
//        }

//        Component.onCompleted:  {
////            circle = Qt.createQmlObject('import QtLocation 5.11; MapCircle{}', map)
////            circle.center = map.center
////            circle.radius = 2
////            circle.color = 'green'
////            circle.border.width = 4
////            circle.opacity = 0.2
//            map.addMapItem(circle)
//        }
//    }

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "blue" }
        }
    }

    states: [
        State {
            name: "menu"
            when: root.inMenu
            PropertyChanges {
                target: qmlContainer
                scale: 1
            }
        },
        State {
            name: "noMenu"
            when: !root.inMenu
            PropertyChanges {
                target: qmlContainer
                scale: 0
            }
        }
    ]

    transitions: Transition {
        NumberAnimation { properties: "scale"; duration: 500; easing.type: Easing.InOutQuad }
    }


    Item {
        id: qmlContainer
        width: 450
        height: 300
        anchors.centerIn: parent
        z: 6
        visible: true
        scale: 0

        Column {
            id: buttonColumn
            Repeater {
                id: repeater
                model: 5
                Rectangle {
                    width: qmlContainer.width
                    height: qmlContainer.height/5
                    border.width: 1
                    border.color: "black"
                    radius: 3
                    Button {
                        id: testButton
                        width: parent.width-2
                        height: parent.height-2
                        anchors.centerIn: parent
                        property int ind: index
                        Text {
                            id: name
                            anchors.centerIn: parent
                            text: parent.selectText(parent.ind)
                            color: "red"
                            font.pointSize: 12
                        }

                        function selectText(index) {
                            var string;
                            switch (index) {
                            case 0:
                                string = "Tilt gauges";
                                break;
                            case 1:
                                string = "Select drive mode";
                                break;
                            case 2:
                                string = "Navigation";
                                break;
                            case 3:
                                string = "Entertainment";
                                break;
                            case 4:
                                string = "Settings";
                                break;
                            default:
                                string = "";
                                break;
                            }
                            return string;
                        }

                        //flat: true
                        //highlighted: true
                        background: Rectangle {
//                            implicitWidth: 100
//                            implicitHeight: 40
                            //opacity: enabled ? 1 : 0.3
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: testButton.pressed ? "blue" : "green" }
                                GradientStop { position: 1.0; color: testButton.pressed ? "green" : "blue" }
                            }
                            //color: testButton.down ? "green" : "red"
                        }

                        onClicked: {
                            console.log("******** CLICK" + index);
                            if(index == 2) {
                                root.inMenu = false;
                                s3dpres.goToSlide("Scene","Angle");
                                //s3dpres.fireEvent("Scene","onPressureDown");
                            }
                            if(index == 1) {
                                root.inMenu = false;
                                s3dpres.goToSlide("Scene","Front");
                            }

                        }

//                        onReleased: {
//                            console.log("******** RELEASE");
//                            anchors.centerIn = parent
//                        }

//                        states: State {
//                            name: "press"
//                            when: testButton.pressed
//                            PropertyChanges {
//                                target: testButton
//                                x: +1
//                                y: +1
//                            }
//                        }
//                        transitions: Transition {
//                                NumberAnimation { properties: "x,y"; duration: 100; easing.type: Easing.InOutQuad }
//                            }
                    }
                }
            }
        }
    }

    Rectangle {
        width: parent.width/2.5
        height: 2
        anchors.bottom: safetyCritical.top
        anchors.horizontalCenter: safetyCritical.horizontalCenter
        layer.enabled: true
        layer.effect: LinearGradient {
            start: Qt.point(0, 0)
            end: Qt.point(width, 0)
//            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 0.0; color: "black" }
//            GradientStop { position: 0.8; color: "black" }
            GradientStop { position: 0.8; color: "white" }
//            GradientStop { position: 1.0; color: "white" }
        }

    }

    Item {
        id: safetyCritical
        width: parent.width/4
        height: 50
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        z: 6

        Rectangle {
            width: parent.width
            height: parent.height
            border.width: 1
            border.color: "black"
            radius: 3
            Button {
                id: menuButton
                width: parent.width-2
                height: parent.height-2
                anchors.centerIn: parent
                Text {
                    id: buttonText
                    anchors.centerIn: parent
                    text: "Menu"
                    color: "red"
                    font.pointSize: 12
                }
                //flat: true
                //highlighted: true
                background: Rectangle {
//                            implicitWidth: 100
//                            implicitHeight: 40
                    //opacity: enabled ? 1 : 0.3
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: menuButton.pressed ? "blue" : "green" }
                        GradientStop { position: 1.0; color: menuButton.pressed ? "green" : "blue" }
                    }
                }

                onClicked: {
                    console.log("******** MENU CLICK");
                    root.inMenu = !root.inMenu;
                }
            }
        }
    }

    Text {
        id: opa
        text: "opacity: " + s3d.mapOp
    }

    Studio3D {
        id: s3d
        focus: true
        anchors.margins: 0
        anchors.fill: parent

        property real speedy: 0
        property double mapOp: 0.0

        ViewerSettings {
            showRenderStats: true
            scaleMode: ViewerSettings.ScaleModeFit
        }

        NumberAnimation {
            id: up
            target: s3d
            property: "speedy"
            duration: 2500
            from: 0
            to: 260
//            loops: Animation.Infinite
            running: true
            easing.type: Easing.InOutQuad

            onStopped: {
                down.start();
            }
        }

        NumberAnimation {
            id: down
            target: s3d
            property: "speedy"
            duration: 2500
            from: 260
            to: 0
//            loops: Animation.Infinite
            running: false
            easing.type: Easing.InOutQuad

            onStopped: {
                up.start();
            }
        }

        NumberAnimation {
            id: show
            target: s3d
            property: "mapOp"
            duration: 1000
            from: 0.0
            to: 100.0
            running: false
//                    easing.type: Easing.InOutQuad
            onStarted: {
                console.log("********** Showing map STARTED");
            }
            onStopped: {
                console.log("********** Showing map STOPPED");
            }
        }

        NumberAnimation {
            id: hide
            target: s3d
            property: "mapOp"
            duration: 1000
            from: 100.0
            to: 0.0
            running: false
//                    easing.type: Easing.InOutQuad
        }

        Presentation {
            id: s3dpres
            source: "qrc:../Cluster/SampleProject.uia"

            SceneElement {
                id: scene
                elementPath: "Scene"
                currentSlideIndex: 2

                onCurrentSlideNameChanged: {
                    if(currentSlideName === "Angle") {
                        show.start();
                        console.log("****************** current slide changed to ANGLE");
                    }
                    else {
                        hide.start();
                    }
                }
            }
            Element {
                id: texti
                elementPath: "Scene.Layer.Text"
            }

            SubPresentationSettings {
                qmlStreams: [
                    QmlStream {
                        presentationId: "testing"
                        //lisätty "testing" uia:han ja uip:hen
                        Item {
                            z: 9
                            Rectangle {
                                width: 127
                                height: 100
                                color: "red"
                                border.color: "black"
                                border.width: 5
                                radius: 10
                            }
                        }
                    }
                ]
            }

            DataInput {
                name: "speed"
                value: s3d.speedy
            }
            DataInput {
                name: "rpm"
                value: 0
            }
            DataInput {
                name: "mapOpa"
                value: s3d.mapOp
            }

            onSlideEntered: {
            }
        }

        onRunningChanged: {
            console.log("Presentation ready!");
        }
    }

}
