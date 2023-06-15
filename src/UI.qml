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
    property bool is_decipher_page_visible: false
    property bool is_about_visible: false
    // Global Variables


    // Global Animations

        // Opening Animation{
            NumberAnimation{
                running: true
                target: win
                properties: "scale"
                from: 0 
                to: 1 
                duration: 1000
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
                    duration: 1000
                    easing.type: Easing.OutExpo 
                }
                NumberAnimation{
                    target: page_two
                    properties: "opacity"
                    from: 0
                    to: 1
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
                onFinished: { is_intro_page_visible=false; is_cipher_page_visible=true; page_one.z=0; page_two.z=1 }
            }

        // Going to Intro Page Animation 1
            ParallelAnimation{
                id: go_to_intro_page
                NumberAnimation{
                    target: page_one
                    properties: "opacity"
                    from: 0
                    to: 1
                    duration: 1000
                    easing.type: Easing.OutExpo 
                }
                NumberAnimation{
                    target: page_two
                    properties: "opacity"
                    from: 1
                    to: 0
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
                onFinished: { is_intro_page_visible=true; is_cipher_page_visible=false; page_one.z=1; page_two.z=0 }
            }


        // Going to DeCipher Page Animation
            ParallelAnimation{
                id: go_to_decipher_page
                NumberAnimation{
                    target: page_one
                    properties: "opacity"
                    from: 1
                    to: 0
                    duration: 1000
                    easing.type: Easing.OutExpo 
                }
                NumberAnimation{
                    target: page_three
                    properties: "opacity"
                    from: 0
                    to: 1
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
                onFinished: { is_intro_page_visible=false; is_decipher_page_visible=true; page_one.z=0; page_three.z=1 }
            }

        // Going to Intro Page Animation 2
            ParallelAnimation{
                id: go_to_intro_page_two
                NumberAnimation{
                    target: page_one
                    properties: "opacity"
                    from: 0
                    to: 1
                    duration: 1000
                    easing.type: Easing.OutExpo 
                }
                NumberAnimation{
                    target: page_three
                    properties: "opacity"
                    from: 1
                    to: 0
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
                onFinished: { is_intro_page_visible=true; is_decipher_page_visible=false; page_one.z=1; page_three.z=0 }
            }
    // Global Animations

    // About Animation
    ParallelAnimation{
        id: show_about
        running: false
        onStarted: is_about_visible=true
        NumberAnimation{
            target: about
            properties: "height"
            from: 0
            to: 452
            duration: 1000
            easing.type: Easing.OutExpo
        }

        NumberAnimation{
            target: about
            properties: "opacity"
            from: 0
            to: 1
            duration: 500
            easing.type: Easing.OutExpo
        }
    }

    ParallelAnimation{
        id: hide_about
        running: false
        onFinished: is_about_visible=false
        NumberAnimation{
            target: about
            properties: "height"
            from: 452
            to: 0
            duration: 1000
            easing.type: Easing.OutExpo
        }

        NumberAnimation{
            target: about
            properties: "opacity"
            from: 1
            to: 0
            duration: 500
            easing.type: Easing.OutExpo
        }
    }
    // About Animation

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
                cursorShape: Qt.PointingHandCursor
                onClicked: is_about_visible==false ? show_about.running=true : hide_about.running=true
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
                enabled: is_cipher_page_visible==true ? true : false
                anchors.fill: parent
                hoverEnabled: true
                onClicked: go_to_intro_page.running=true
                cursorShape: is_cipher_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
            }
        }

        // Back Button two
        Image{
            z: 2
            opacity: is_decipher_page_visible==true ? 1 : 0
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 18
            anchors.leftMargin: 19
            source: "three/back_btn.svg"
            scale: back_decipher_btn_mouse.containsMouse===true ? 1.2 : 1
            Behavior on scale { NumberAnimation { duration: 50 } }
            Behavior on opacity { NumberAnimation { duration: 200 }}

            MouseArea{
                id: back_decipher_btn_mouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: go_to_intro_page_two.running=true
                cursorShape: is_decipher_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
                enabled: is_decipher_page_visible==true ? true : 0
            }
        }

    // Title Bar Buttons

        // About Page
        Image{
            id: about
            anchors.centerIn: parent
            z: 4
            source: "about.png"
            width: 502
            height: 0

            MouseArea{
                anchors.fill: parent
                id: about_mouse
                hoverEnabled: parent.height==452 ? true : false
                cursorShape: parent.height==452 ? Qt.PointingHandCursor : Qt.Arrow
                onClicked: hide_about.running=true
            }
        }
        // About Page

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
                    onClicked: go_to_decipher_page.running=true
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
                anchors.topMargin: 402
                anchors.leftMargin: 202
            }

            // Rot Picker Box
            Image{
                source: "two/rottxt.png"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 409
                anchors.leftMargin: 99
            }


            // Cipher Button
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 396
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
                    onClicked: {
                        input_box_for_cipher.text = brain.cipher(input_box_for_cipher.text, rot_num_cipher.text)
                        input_box_for_cipher.moveCursorSelection(0, )
                    }
                }
            }

            //Copy Button
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 141
                anchors.leftMargin: 617
                source: "two/copy_btn.svg"
                scale: copy_button.containsMouse==true ? 1.1 : 1
                Behavior on scale { NumberAnimation { duration: 100 } }

                MouseArea{
                    id: copy_button
                    enabled: is_cipher_page_visible==true ? true : false
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: is_cipher_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
                    onClicked: {input_box_for_cipher.selectAll(); input_box_for_cipher.copy(); input_box_for_cipher.text="Copied!!"}
                }
            }

            //Delete Button
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 261
                anchors.leftMargin: 617
                source: "two/delete_btn.svg"
                scale: delete_button.containsMouse==true ? 1.1 : 1
                Behavior on scale { NumberAnimation { duration: 100 } }

                MouseArea{
                    id: delete_button
                    enabled: is_cipher_page_visible==true ? true : false
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: is_cipher_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
                    onClicked: input_box_for_cipher.remove(0, input_box_for_cipher.length)
                }
            }

            // Rot Picker textinput
            Rectangle{
                width: 100
                height: 39
                radius: 10
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 402
                anchors.leftMargin: 202
                clip: true
                color: "#00000000"

                TextInput{
                    id: rot_num_cipher
                    text: "4"
                    enabled: is_cipher_page_visible==true ? true : false
                    anchors.fill: parent
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    font { family: cusfont.name; pixelSize: 20; bold: true }
                    color: focus == true ? Qt.rgba(221,221,221,0.7) : Qt.rgba(221,221,221,0.5) 
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
                anchors.topMargin: 75
                anchors.leftMargin: 99
                clip: true
                color: "#00000000"

                ScrollView{
                    anchors.fill: parent
                    ScrollBar.vertical.visible: false
                    ScrollBar.horizontal.visible: false

                    TextArea{
                        id: input_box_for_cipher
                        enabled: is_cipher_page_visible==true ? true : false
                        font{ family: cusfont.name; pixelSize: 18; bold: true }
                        color: Qt.rgba(221,221,221,0.7)
                        wrapMode: TextEdit.WordWrap
                        placeholderText: "Your top secret message here...."
                        placeholderTextColor: Qt.rgba(221,221,221,0.5)
                    }

                }
            }
        }


        // Decipher Page
        Rectangle{
            z: 0
            opacity: 0
            id: page_three
            width: 700
            height: 500
            anchors.centerIn: parent
            radius: 30
            color: "#00000000"

            //Background Image
            Image{
                source: "three/background.png"
                anchors.fill: parent
            }

            // Title
            Image{
                source: "three/title.png"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 7
                anchors.leftMargin: 259
            }

            // Text Box
            Image{
                source: "three/text_box.png"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 70
                anchors.leftMargin: 99
            }

            // Rot Picker Box
            Image{
                source: "three/rot_picker_box.png"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 402
                anchors.leftMargin: 202
            }

            // Rot Picker Box Text
            Image{
                source: "three/rottxt.png"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 409
                anchors.leftMargin: 99
            }


            // Deipher Button
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 396
                anchors.leftMargin: 438
                source: "three/decipher_button.svg"
                scale: decipher_button.containsMouse==true ? 1.1 : 1
                Behavior on scale { NumberAnimation { duration: 100 } }

                MouseArea{
                    id: decipher_button
                    enabled: is_decipher_page_visible==true ? true : false
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: is_decipher_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
                    onClicked: {
                        input_box_for_decipher.text = brain.decipher(input_box_for_decipher.text, rot_num_decipher.text)
                        input_box_for_decipher.moveCursorSelection(0, )
                    }
                }
            }

            //Copy Button
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 141
                anchors.leftMargin: 617
                source: "three/copy_btn.svg"
                scale: copy_button2.containsMouse==true ? 1.1 : 1
                Behavior on scale { NumberAnimation { duration: 100 } }

                MouseArea{
                    id: copy_button2
                    enabled: is_decipher_page_visible==true ? true : false
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: is_decipher_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
                    onClicked: {input_box_for_decipher.selectAll(); input_box_for_decipher.copy(); input_box_for_decipher.text="Copied!!"}
                }
            }

            //Delete Button
            Image{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 261
                anchors.leftMargin: 617
                source: "three/delete_btn.svg"
                scale: delete_button2.containsMouse==true ? 1.1 : 1
                Behavior on scale { NumberAnimation { duration: 100 } }

                MouseArea{
                    id: delete_button2
                    enabled: is_decipher_page_visible==true ? true : false
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: is_decipher_page_visible==true ? Qt.PointingHandCursor : Qt.Arrow
                    onClicked: input_box_for_decipher.remove(0, input_box_for_decipher.length)
                }
            }

            // Rot Picker textinput
            Rectangle{
                width: 100
                height: 39
                radius: 10
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 402
                anchors.leftMargin: 202
                clip: true
                color: "#00000000"

                TextInput{
                    id: rot_num_decipher
                    text: "4"
                    enabled: is_decipher_page_visible==true ? true : false
                    anchors.fill: parent
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    font { family: cusfont.name; pixelSize: 20; bold: true }
                    color: focus == true ? Qt.rgba(221,221,221,0.7) : Qt.rgba(221,221,221,0.5) 
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
                anchors.topMargin: 75
                anchors.leftMargin: 99
                clip: true
                color: "#00000000"

                ScrollView{
                    anchors.fill: parent
                    ScrollBar.vertical.visible: false
                    ScrollBar.horizontal.visible: false

                    TextArea{
                        id: input_box_for_decipher
                        enabled: is_decipher_page_visible==true ? true : false
                        font{ family: cusfont.name; pixelSize: 18; bold: true }
                        color: Qt.rgba(221,221,221,0.7)
                        wrapMode: TextEdit.WordWrap
                        placeholderText: "Your encoded secret message here...."
                        placeholderTextColor: Qt.rgba(221,221,221,0.5)
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

    Connections{
        target: brain
    }
}
