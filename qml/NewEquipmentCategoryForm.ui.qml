import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Page {
	property alias newEquipmentCategory: newEquipmentCategory
    Layout.fillWidth: true
    Layout.fillHeight: true

    title: qsTr("New equipment category")
	
	NewEquipmentCategory {
		id: newEquipmentCategory
	}
	
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
