import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Page {
	Layout.fillWidth: true
	Layout.fillHeight: true
	title: qsTr("Edit equipment")
	ColumnLayout {
		EquipmentDataFields {
			id: equipmentDataFields
		}
		EditEquipment {
			id: editEquipment
			property var eqkey: key
			property var dataFields: equipmentDataFields
		}
	}
}

