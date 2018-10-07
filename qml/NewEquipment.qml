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

                    ComboBox {
                        id: equipmentCategory
                        width: 160
                        height: 30
                        clip: false
                        font.pixelSize: 10
			model: equipmentCategoryModel
                        background: Rectangle {
                            radius: 2
                            implicitWidth: 100
                            implicitHeight: 24
			    border.width: 2
                            border.color: "black"
                        }
                    }
		Button {
                    height: 30
		    text: qsTr("Add categories")
		    onClicked: {
				stackView.push("NewEquipmentCategoryForm.ui.qml")
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
            height: 30
            text: qsTr("Save")
            onClicked: {
			console.log(equipmentName.text)
			console.log(equipmentLocation.text)
			equipmentModel.append({
				"name": equipmentName.text,
				"category": equipmentCategory.currentText,
				"location": equipmentLocation.text,
			})
			stackView.pop()
	    }

        }

            }
    }
}
