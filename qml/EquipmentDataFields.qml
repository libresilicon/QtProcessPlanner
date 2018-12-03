import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

ColumnLayout {
	RowLayout {
		Layout.fillWidth: true
		height: 27
		spacing: 20
		Label {
			text: qsTr("Short name:")
			font.pointSize: 10
			verticalAlignment: Text.AlignVCenter
		}
		TextField {
			id: equipmentShortName
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
		ActionButton {
			text : "Add categories"
			page : "qrc:/NewEquipmentCategoryForm.ui.qml"
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
		ComboBox {
			id: equipmentLocation
			width: 160
			height: 30
			clip: false
			font.pixelSize: 10
			model: equipmentLocationModel
			background: Rectangle {
				radius: 2
				implicitWidth: 100
				implicitHeight: 24
				border.width: 2
				border.color: "black"
			}
		}
		ActionButton {
			text : "Add locations"
			page : "qrc:/NewEquipmentLocationForm.ui.qml"
		}
	}
	function getData() {
		var ret = {
			shortname : equipmentShortName.text,
			name : equipmentName.text,
			category : equipmentCategory.currentText,
			location : equipmentLocation.currentText
		}
		return ret
	}
	function setData(eq) {
		equipmentShortName.text = qsTr(eq['shortname'])
		equipmentName.text = qsTr(eq['name'])
		equipmentCategory.currentIndex = equipmentCategory.find(eq["category"]);
		equipmentLocation.currentIndex = equipmentLocation.find(eq["location"]);
	}
}
