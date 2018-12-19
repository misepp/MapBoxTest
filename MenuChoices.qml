import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    id: root

    property alias buttonCount: repeater.model
    property var texts: []
    signal buttonClicked(int index)

    Column {
        id: buttonColumn
        Repeater {
            id: repeater
            Rectangle {
                width: root.width
                height: root.height/5
                border.width: 1
                border.color: "black"
                radius: 3
                Button {
                    id: btn
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
                        return root.texts[index];
                    }

                    background: Rectangle {
//                            implicitWidth: 100
//                            implicitHeight: 40
                        //opacity: enabled ? 1 : 0.3
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: btn.pressed ? "blue" : "green" }
                            GradientStop { position: 1.0; color: btn.pressed ? "green" : "blue" }
                        }
                        //color: btn.down ? "green" : "red"
                    }

                    onClicked: {
                        console.log("******** CLICK" + index);
                        root.buttonClicked(index);
                    }
                }
            }
         }
    }
}
