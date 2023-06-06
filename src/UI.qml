import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Window{
    //Initializing and setting up the app's main window
    visible: true
    title: "Poly Rot"
    maximumWidth: 750
    minimumWidth: 750
    maximumHeight: 550
    minimumHeight: 550
    id: app
    color: "#00000000"
    flags: Qt.Window | Qt.FramelessWindowHint

    // Global Variables
    FontLoader{ source: "font.ttf"; id: cusfont }
    property bool is_intro_page_visible: false
    property bool is_cipher_page_visible: false
    // Global Variables


    // Global Animations

        // Opening Animation{
            NumberAnimation{
                running: true
                target: win
                properties: "scale"
                from: 0 
                to: 1 
                duration: 2000
                easing.type: Easing.OutExpo
                onFinished: {is_intro_page_visible=true; page_one.z=1}
            }


        // Going to Cipher Page Animation
        ParallelAnimation{
            id: go_to_cipher_page
            NumberAnimation{
                target: page_one
                properties: "opacity"
                from: 1
                to: 0
                duration: 1500
                easing.type: Easing.OutExpo
            }
            NumberAnimation{
                target: page_two
                properties: "opacity"
                from: 0
                to: 1 
                duration: 1500
                easing.type: Easing.OutExpo
            }
            onFinished: { is_cipher_page_visible=true; is_intro_page_visible=false; page_one.z=0; page_two.z=1 }
        }

        // Going to Cipher Page Animation
        ParallelAnimation{
            id: go_to_intro_page
            NumberAnimation{
                target: page_one
                properties: "opacity"
                from: 0
                to: 1
                duration: 1500
                easing.type: Easing.OutExpo
            }
            NumberAnimation{
                target: page_two
                properties: "opacity"
                from: 1
                to: 0
                duration: 1500
                easing.type: Easing.OutExpo
            }
            onFinished: { is_cipher_page_visible=false; is_intro_page_visible=true; page_one.z=1; page_two.z=0 }
        }


    // Global Animations

    //The Main window of the app
    Rectangle{
        z: 0
        scale: 0
        width: 700
        height: 500
        color: "#181A1F"
        radius: 30
        id: win
        anchors.centerIn: parent
        border.width: 1
        border.color: Qt.rgba(221,221,221,0.2)

    // Title Bar Buttons

        // Close Button
        Image{
            z: 2
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 18
            anchors.leftMargin: 661
            source: "one/close.svg"
            scale: close_btn_mouse.containsMouse===true ? 1.2 : 1
            Behavior on scale { NumberAnimation { duration: 50 } }

            MouseArea{
                id: close_btn_mouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: app.close()
                cursorShape: Qt.PointingHandCursor
            }
        }

        // Minimise Button
        Image{
            z: 2
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 18
            anchors.leftMargin: 630
            source: "one/minimise.svg"
            scale: minimise_btn_mouse.containsMouse == true ? 1.2 : 1.0
            Behavior on scale { NumberAnimation { duration: 50 } }

            MouseArea{
                id: minimise_btn_mouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: app.showMinimized()
                cursorShape: Qt.PointingHandCursor
            }
        }

        // Information Button
        Image{
            z: 2
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 18
            anchors.leftMargin: 599
            source: "one/info.svg"
            scale: info_btn_mouse.containsMouse == true ? 1.2 : 1.0
            Behavior on scale { NumberAnimation { duration: 50 } }

            MouseArea{
                id: info_btn_mouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: app.showMinimized()
                cursorShape: Qt.PointingHandCursor
            }
        }

        // Back Button
        Image{
            z: 2
            opacity: is_cipher_page_visible==true ? 1 : 0
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 18
            anchors.leftMargin: 19
            source: "two/back_btn.svg"
            scale: back_cipher_btn_mouse.containsMouse===true ? 1.2 : 1
            Behavior on scale { NumberAnimation { duration: 50 } }
            Behavior on opacity { NumberAnimation { duration: 200 }}

            MouseArea{
                id: back_cipher_btn_mouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: go_to_intro_page.running=true
                cursorShape: Qt.PointingHandCursor
            }
        }

    // Title Bar Buttons

        // Custom Title Bar
        Rectangle{
            z: 1
            anchors.top: parent.top
            anchors.left: parent.left
            width: 700
            height: 60
            radius: 30
            color: "#00000000"
            MouseArea{
                id: title_bar_mouse
                anchors.fill: parent
                hoverEnabled: true 
            }

            DragHandler{
                onActiveChanged: if(active==true) {app.startSystemMove()}
            }
        }

        // Opening Page
        Rectangle{
            z: 1
            opacity: 1
            id: page_one
            width: 700
            height: 500
            anchors.centerIn: parent
            radius: 30
            color: "#00000000"

            // Background Image
            Image{
                anchors.fill: parent
                source: "one/background.png"
            }

            // Title
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 7
                anchors.leftMargin: 310
                source: "one/title.png"
            }

            // Tagline
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 168
                anchors.leftMargin: 99
                source: "one/tagline.png"
            }

            // Tagline 2
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 245
                anchors.leftMargin: 210
                source: "one/tagline2.png"
            }

            // Go to Cipher Page Button
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 378
                anchors.leftMargin: 99
                source: "one/go_to_cipher_page_btn.svg"
                scale: go_to_cipher_page_btn.containsMouse==true ? 1.1 : 1
                Behavior on scale { NumberAnimation { duration: 100 } }

                MouseArea{
                    id: go_to_cipher_page_btn
                    enabled: is_intro_page_visible==true ? true : false
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: is_intro_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
                    onClicked: go_to_cipher_page.running=true
                }
            }

            //Go to DeChiper Page Button
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 378
                anchors.leftMargin: 438
                source: "one/go_to_decipher_page_btn.svg"
                scale: go_to_decipher_page_btn.containsMouse==true ? 1.1 : 1
                Behavior on scale { NumberAnimation { duration: 100 } }

                MouseArea{
                    anchors.fill: parent
                    id: go_to_decipher_page_btn
                    enabled: is_intro_page_visible==true ? true : false
                    hoverEnabled: true
                    cursorShape: is_intro_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
                }
            }

        }

        // Cipher Page
        Rectangle{
            z: 0
            opacity: 0
            id: page_two
            width: 700
            height: 500
            anchors.centerIn: parent
            radius: 30
            color: "#00000000"

            //Background Image
            Image{
                source: "two/background.png"
                anchors.fill: parent
            }

            // Title
            Image{
                source: "two/title.png"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 7
                anchors.leftMargin: 271
            }

            // Text Box
            Image{
                source: "two/text_box.png"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 70
                anchors.leftMargin: 99
            }

             // Rot Picker Box
            Image{
                source: "two/rot_picker_box.png"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 410
                anchors.leftMargin: 99
            }


            // Cipher Button
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 404
                anchors.leftMargin: 438
                source: "two/cipher_button.svg"
                scale: cipher_button.containsMouse==true ? 1.1 : 1
                Behavior on scale { NumberAnimation { duration: 100 } }

                MouseArea{
                    id: cipher_button
                    enabled: is_cipher_page_visible==true ? true : false
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: is_cipher_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
                }
            }

            // Rot Picker textinput
            Rectangle{
                width: 330
                height: 39
                radius: 10
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 410
                anchors.leftMargin: 99
                clip: true
                color: "#00000000"

                TextInput{
                    enabled: is_cipher_page_visible==true ? true : false
                    anchors.fill: parent
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    font { family: cusfont.name; pixelSize: 20; bold: true }
                    color: Qt.rgba(221,221,221,0.7)
                    padding: 2
                    validator: IntValidator{bottom: 1; top: 99}
                }
            }

            // Matter box
            Rectangle{
                width: 491
                height: 297
                radius: 20
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 70
                anchors.leftMargin: 99
                clip: true
                color: "#00000000"

                ScrollView{
                    anchors.fill: parent
                    ScrollBar.vertical.visible: false
                    ScrollBar.horizontal.visible: false
                    TextArea{
                        enabled: is_cipher_page_visible==true ? true : false
                        font{ family: cusfont.name; pixelSize: 20; bold: true }
                        color: Qt.rgba(221,221,221,0.7)
                    }
                }
            }
        }

        // App Shadow
        RectangularGlow{
            z: -1
            anchors.fill: win
            glowRadius: 20
            spread: 0.2
            color: "#80000000"
            cornerRadius: 30
        }

    }
}
