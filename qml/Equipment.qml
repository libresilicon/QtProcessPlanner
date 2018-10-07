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
			border.width: 2
			border.color: "black"
			
			Row {
				spacing: 10
				Text {
					text: name
				}
				Text {
					text: category
				}
				Text {
					text: location 
				}
			}
		}
	}
}

