import QtQuick 2.12
import QtQuick.Controls 2.5
import "qrc:/utils.js" as Utils

ApplicationWindow {
    visible: true
    width: 300
    height: 200
    title: "Simple Hello App"

    Column {
        anchors.centerIn: parent
        spacing: 12

        Text {
            id: message
            text: "Hello, World!"
            font.pixelSize: 20
        }
        TextField {
            id: nameField
            placeholderText: "Enter your name"
            width: 200

        }
        Button {
            text: "Show Time for me"
            onClicked: {
                var name = nameField.text
                if (name ===""){
                    name = "world"
                }
                message.text = " Hello, " + name + " Time: " + Utils.currentTime()
            }
        }
        Button {
            text: "Go Back"
            onClicked: {
                nameField.text = ""
                message.text = "Hello World!"
            }
        }
    }
}
