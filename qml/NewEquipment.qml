import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Rectangle {
	Layout.fillWidth: true
	Layout.fillHeight: true
	property var dataFields

	ColumnLayout {
		Layout.fillWidth: true
		Layout.fillHeight: true
		anchors.fill: parent
		Button {
			height: 30
			text: qsTr("Save")
			onClicked: {
				var newkey=1;
				while(equipmentKeyExists(newkey)===true) { newkey=newkey+1; }
				var obj = dataFields.getData()
				obj["key"] = newkey
				equipmentModel.append(obj)
				stackView.pop()
			}
		}
	}
}
