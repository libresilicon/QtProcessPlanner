import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Page {
	Layout.fillWidth: true
	Layout.fillHeight: true
	title: qsTr("New equipment")
	ColumnLayout {
		EquipmentDataFields {
			id: equipmentDataFields
		}
		NewEquipment {
			id: newEquipment
			dataFields: equipmentDataFields
		}
	}
}

