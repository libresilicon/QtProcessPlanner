import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtPositioning 5.4
import QtQuick.Layouts 1.11

Page {
    title: qsTr("Flows")

    ColumnLayout {
	anchors.fill: parent
        GroupBox {
            id: groupBox
            Layout.fillWidth: true
            height: 109
            title: qsTr("Filter")

            GridLayout {
                id: grid
                RowLayout {
                    id: row
            	    Layout.fillWidth: true
                    height: 27
                    spacing: 20

                    Label {
                        id: label
                        text: qsTr("Name:")
                        font.pointSize: 10
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: textInput
                        width: 160
                        height: 30
                        text: qsTr("")
                        clip: false
                        font.pixelSize: 10
                        background: Rectangle {
                            radius: 2
                            implicitWidth: 100
                            implicitHeight: 24
			    border.width: 2
                            border.color: "black"
                        }
                    }
                }
            }
        }

        Equipment {
            id: equipment
            Layout.fillWidth: true
        }

        Button {
            id: button
            text: qsTr("Add machine")
        }
    }
}
