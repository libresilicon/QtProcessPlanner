import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQml.Models 2.1
import Qt.labs.settings 1.0
import extensions 1.0
import QtQuick.Layouts 1.11

import "qrc:/extensions/ColumnHelper.js" as ColumnHelper

Rectangle {
	Layout.fillWidth: true
	Layout.fillHeight: true
	border.width: 2
	border.color: "black"

	ListView {
		id: listOfMachines
		Layout.fillWidth: true
		Layout.fillHeight: true
		anchors.fill: parent
		model: equipmentModel
		property int minColumnWidth: 200
		property var columnWidths: ColumnHelper.calcColumnWidths(listOfMachines.minColumnWidth, equipmentModel, listOfMachines)
		delegate: listOfMachinesContent
		header: listOfMachinesHeader
	}

	Component {
		id: listOfMachinesHeader
		RowLayout {
			Layout.fillWidth: true
			spacing: 1
			/*Rectangle {
				width: listOfMachines.columnWidths['key']?listOfMachines.columnWidths['key']:listOfMachines.minColumnWidth
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: "Machine ID" 
					font.bold: true
					font.pixelSize: 14
				}
			}*/
			Rectangle {
				width: listOfMachines.columnWidths['shortname']?listOfMachines.columnWidths['shortname']:listOfMachines.minColumnWidth
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: "Machine short name" 
					font.bold: true
					font.pixelSize: 14
				}
			}
			Rectangle {
				width: listOfMachines.columnWidths['name']?listOfMachines.columnWidths['name']:listOfMachines.minColumnWidth
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: "Machine name" 
					font.bold: true
					font.pixelSize: 14
				}
			}
			Rectangle {
				width: listOfMachines.columnWidths['category']?listOfMachines.columnWidths['category']:listOfMachines.minColumnWidth
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: "Machine category"
					font.bold: true
					font.pixelSize: 14
				}
			}
			Rectangle {
				width: listOfMachines.columnWidths['location']?listOfMachines.columnWidths['location']:listOfMachines.minColumnWidth
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: "Machine location"
					font.bold: true
					font.pixelSize: 14
				}
			}
		}
	}
	Component {
		id: listOfMachinesContent
		RowLayout {
			Layout.fillWidth: true
			spacing: 1
			/*Rectangle {
				width: listOfMachines.columnWidths['key']
				height: 40
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: key 
				}
			}*/
			Rectangle {
				width: listOfMachines.columnWidths['shortname']
				height: 40
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: shortname
				}
			}
			Rectangle {
				width: listOfMachines.columnWidths['name']
				height: 40
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: name
				}
			}
			Rectangle {
				width: listOfMachines.columnWidths['category']
				height: 40
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: category
				}
			}
			Rectangle {
				width: listOfMachines.columnWidths['location']
				height: 40
				border.width: 2
				border.color: "black"
				Text {
					x: 5
					y: 5
					text: location
				}
			}
			Rectangle {
				width: 60 
				height: 40
				border.width: 2
				border.color: "black"
				Button {
					x: 5 
					y: 5
					width: 50 
					height: 25
					text: qsTr("Edit")
					onClicked: {
						var component = Qt.createComponent("qrc:/EditEquipmentForm.ui.qml");
						if (component.status===Component.Ready) {
							component.key = key
							stackView.push(component)
						}
					}
				}
			}
		}
	}
}

