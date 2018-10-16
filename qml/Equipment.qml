import QtQuick 2.3
import QtQml.Models 2.1
import QtQuick.Layouts 1.11

import "/extensions/ColumnHelper.js" as ColumnHelper

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
		property var columnWidths: ColumnHelper.calcColumnWidths(150, equipmentModel, listOfMachines)
		delegate: listOfMachinesContent
		header: listOfMachinesHeader
	}

	Component {
		id: listOfMachinesHeader
		Row {
			Layout.fillWidth: true
			Rectangle {
				id: nameHeader
				width: listOfMachines.columnWidths['name']
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					text: "Machine name" 
				}
			}
			Rectangle {
				id: categoryHeader
				width: listOfMachines.columnWidths['category']
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					text: "Machine category"
				}
			}
			Rectangle {
				id: locationHeader
				width: listOfMachines.columnWidths['location']
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					text: "Machine location"
				}
			}
		}
	}

	Component {
		id: listOfMachinesContent
		Row {
			Layout.fillWidth: true
			Rectangle {
				width: listOfMachines.columnWidths['name']
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					text: name
				}
			}
			Rectangle {
				width: listOfMachines.columnWidths['category']
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					text: category
				}
			}
			Rectangle {
				width: listOfMachines.columnWidths['location']
				height: 30
				border.width: 2
				border.color: "black"
				Text {
					text: location
				}
			}
		}
	}


}

