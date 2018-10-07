import QtQuick 2.3
import QtQml.Models 2.1
import QtQuick.Layouts 1.11

Rectangle {
    Layout.fillWidth: true
    Layout.fillHeight: true


	ListView {
		anchors.fill: parent
		model: equipmentModel
		delegate: equipmentDelegate
	}

	Component {
		id: equipmentDelegate

		Rectangle {
			id: content

			anchors { left: parent.left; right: parent.right }
			height: 40
			width: 40
			border.width: 2
			border.color: "black"
			radius: 2
			
			Row {
				spacing: 10
				Text {
					text: name
					width: 100
				}
				Text {
					text: category
					width: 100
				}
				Text {
					text: location 
					width: 100
				}
			}
		}
	}
}

