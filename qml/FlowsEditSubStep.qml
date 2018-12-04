import QtQuick 2.9
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2

Page {
	id: root
	property var flow
	padding: 20
	Component.onCompleted: {
		dataFields.setData({
			"name": root.flow.data(1),
			"equipment": root.flow.data(2),
			"description": root.flow.data(3),
		})
	}
	ColumnLayout {
		Layout.fillWidth: true
		Layout.fillHeight: true
		anchors.fill: parent
		spacing: 10
		FlowSubStepDataField {
			id: dataFields
		}
		Button {
			height: 30
			text: qsTr("Save")
			onClicked: {
				var newdata=dataFields.getData()
				flow.setData(1, newdata["name"])
				flow.setData(2, newdata["equipment"])
				flow.setData(3, newdata["description"])
				stackView.pop()
			}
		}
	}
}
