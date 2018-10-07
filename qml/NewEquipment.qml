import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Rectangle {
    Layout.fillWidth: true
    Layout.fillHeight: true

    ColumnLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true

	anchors.fill: parent
                ColumnLayout {
                RowLayout {
            	    Layout.fillWidth: true
                    height: 27
                    spacing: 20

                    Label {
                        text: qsTr("Name:")
                        font.pointSize: 10
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: equipmentName 
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

                RowLayout {
            	    Layout.fillWidth: true
                    height: 27
                    spacing: 20

                    Label {
                        text: qsTr("Category:")
                        font.pointSize: 10
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: equipmentCategory
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
                RowLayout {
            	    Layout.fillWidth: true
                    height: 27
                    spacing: 20

                    Label {
                        text: qsTr("Location:")
                        font.pointSize: 10
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: equipmentLocation
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
        Button {
            id: button
            text: qsTr("Save")
            onClicked: {
			console.log(equipmentName.text)
			console.log(equipmentLocation.text)
			equipmentModel.append({
				"name": equipmentName.text,
				"location": equipmentLocation.text,
			})
			stackView.pop()
	    }

        }

            }
    }
}
