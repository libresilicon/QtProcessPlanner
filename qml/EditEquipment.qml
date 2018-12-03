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
		Button {
			height: 30
			text: qsTr("Save")
			onClicked: {
				var eq = getEquipmentFromKey(eqkey)
				var obj = dataFields.getData()
				obj["key"]=eqkey
				if(eq!==null) {
					for(var k in obj) {
						eq[k] = obj[k]
					}
				}
				stackView.pop()
			}
		}
	}
	Component.onCompleted: {
		var eq = getEquipmentFromKey(eqkey)
		if(eq!==null) dataFields.setData(eq)
	}
}
