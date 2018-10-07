import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11

Page {
    Layout.fillWidth: true
    Layout.fillHeight: true

    title: qsTr("New equipment")

    NewEquipment {
        id: newEquipment
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
