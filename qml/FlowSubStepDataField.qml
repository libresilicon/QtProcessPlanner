import QtQuick 2.9
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2

ColumnLayout {
	id: root
	Layout.fillWidth: true
	Layout.fillHeight: true
	spacing: 10

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
			id: flowStepName 
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
			text: qsTr("Equipment:")
			font.pointSize: 10
			verticalAlignment: Text.AlignVCenter
		}
		ComboBox {
			id: equipmentName
			width: 160
			height: 30
			clip: false
			font.pixelSize: 10
			model: equipmentModel
			textRole : "name" 
			background: Rectangle {
				radius: 2
				implicitWidth: 100
				implicitHeight: 24
				border.width: 2
				border.color: "black"
			}
		}
		ActionButton {
			text : "Add equipment"
			page : "qrc:/NewEquipmentForm.ui.qml"
		}
	}

	RowLayout {
		Layout.fillWidth: true
		height: 27
		spacing: 20
		Label {
			text: qsTr("Description:")
			font.pointSize: 10
			verticalAlignment: Text.AlignVCenter
		}
		Rectangle{
			id: flowStepDescriptionFrame
			width: 200
			height: 100
			border.width: 2
			border.color: "black"
			TextArea {
				id: flowStepDescription
				width: flowStepDescriptionFrame.width
				height: flowStepDescriptionFrame.height
				text: qsTr("")
				clip: false
				font.pixelSize: 10
			}
		}
	}


	function getData() {
		return {
			"name": flowStepName.text,
			"equipment": equipmentName.currentText,
			"description": flowStepDescription.text,
		}
	}
	function setData(ar) {
		flowStepName.text=ar.name
		equipmentName.currentIndex = equipmentName.find(ar.equipment);
		flowStepDescription.text=ar.description
	}
}
