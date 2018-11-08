import QtQuick 2.11
import QtLocation 5.11
import QtPositioning 5.11


//Rectangle {
//    id: root

    Plugin {
        id: mapboxglPlugin
        name: "mapbox"

        PluginParameter {
            name: "mapbox.access_token"
            value: "pk.eyJ1IjoibWlzZTEwNjAiLCJhIjoiY2puZThsNm5hMGV1eDNwbzQ3Y3BxejU3NyJ9.Mg0VRsGsOx-EgJEsfvN5Lg"
        }
    }
//}
