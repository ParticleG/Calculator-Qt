import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import QtSensors 5.12

import StatusBar 1.0
import CalculateProcess 1.0

import "functions.js" as Utils

ApplicationWindow {
	readonly property string defaulFontFamily: "Noto Sans CJK SC"
	property alias calculate_process: main_calculate_process
	property alias toastDisplayer: toast_displayer
	property alias hyper_dialog: hyper_dialog
	property alias const_dialog: const_dialog
	id: main_window
	visible: true
	width: 540
	height: 960
	title: qsTr("科学计算器")
	StatusBar {
		theme: "Dark"
		color: "#303030"
	}
	ToastManager {
		id: toast_displayer
	}
	CalculateProcess {
		id: main_calculate_process
		onInputExpressionChanged: {
			console.log(calculate_process.resultExpression)
		}
	}
	OrientationSensor {
		property alias orientation_sensor: orientation_sensor
		id: orientation_sensor
		active: true

		onReadingChanged: {
			if (reading.orientation === OrientationReading.TopUp) {
				console.log("TopUp")
				main_area.state = "Top Portrait"
			} else if (reading.orientation === OrientationReading.RightUp) {
				console.log("RightUp")
				main_area.state = "Clockwise Landscape"
			} else if (reading.orientation === OrientationReading.TopDown) {
				console.log("TopDown")
				main_area.state = "Bottom Portrait"
			} else if (reading.orientation === OrientationReading.LeftUp) {
				console.log("LeftUp")
				main_area.state = "CounterClockwise Landscape"
			} else if (reading.orientation === OrientationReading.FaceUp) {
				console.log("FaceUp")
			} else if (reading.orientation === OrientationReading.FaceDown) {
				console.log("FaceDown")
			}
		}
	}
	Dialog {
		id: hyper_dialog
		width: main_window.width / 3 * 2
		height: main_window.height / 3 * 2
		x: (main_window.width - width) / 2
		y: (main_window.height - height) / 2
		ListView {
			id: hyper_functions
			anchors.fill: parent
			model: ["csc", "sec", "cot", "arcsin", "arccos", "arctan", "arccsc", "arcsec", "arccot", "sinh", "cosh", "tanh", "csch", "sech", "coth", "arcsinh", "arccosh", "arctanh", "arccsch", "arcsech", "arccoth"]
			delegate: ItemDelegate {
				text: modelData
				width: parent.width
				onClicked: {
					hyper_dialog.close()
					expression_text_field.insert(
								expression_text_field.cursorPosition,
								modelData + "(")
				}
			}
		}
	}
	Dialog {
		id: const_dialog
		width: main_window.width / 3 * 2
		height: main_window.height / 3 * 2
		x: (main_window.width - width) / 2
		y: (main_window.height - height) / 2
		ListView {
			id: const_numbers
			anchors.fill: parent
			model: ["mp", "mn", "me", "mμ", "a0", "h", "μN", "μB", "α", "re", "λc", "γp", "λcp", "λcn", "R∞", "u", "μp", "μe", "μn", "μμ", "F", "e", "NA", "k", "Vm", "R", "C0", "C1", "C3", "σ", "ε0", "μ0", "ψ0", "g", "G0", "Z0", "t", "G", "atm"]
			delegate: ItemDelegate {
				text: modelData
				width: parent.width
				onClicked: {
					const_dialog.close()
					console.log(modelData)
				}
			}
		}
	}
	ColumnLayout {
		id: main_area
		anchors.centerIn: parent
		state: "Top Portrait"
		transitions: Transition {
			RotationAnimation {
				duration: 200
				direction: RotationAnimation.Shortest
				easing.type: Easing.OutCubic
			}
			PropertyAnimation {
				properties: "width,height"
				easing.type: Easing.OutCubic
			}
		}
		states: [
			State {
				name: "Top Portrait"
				PropertyChanges {
					target: main_area
					anchors.topMargin: 16
					anchors.leftMargin: 0
					anchors.rightMargin: 0
					anchors.bottomMargin: 0
					width: parent.width
					height: parent.height
					rotation: 0
				}
				PropertyChanges {
					target: basic_keyboard
					visible: true
				}
				PropertyChanges {
					target: advanced_keyboard
					visible: false
				}
			},
			State {
				name: "Bottom Portrait"
				PropertyChanges {
					target: main_area
					anchors.topMargin: 0
					anchors.leftMargin: 0
					anchors.rightMargin: 0
					anchors.bottomMargin: 16
					width: parent.width
					height: parent.height
					rotation: 180
				}
				PropertyChanges {
					target: basic_keyboard
					visible: true
				}
				PropertyChanges {
					target: advanced_keyboard
					visible: false
				}
			},
			State {
				name: "Clockwise Landscape"
				PropertyChanges {
					target: main_area
					anchors.topMargin: 0
					anchors.leftMargin: 0
					anchors.rightMargin: 8
					anchors.bottomMargin: 0
					width: parent.height
					height: parent.width
					rotation: 90
				}
				PropertyChanges {
					target: basic_keyboard
					visible: false
				}
				PropertyChanges {
					target: advanced_keyboard
					visible: true
				}
			},
			State {
				name: "CounterClockwise Landscape"
				PropertyChanges {
					target: main_area
					anchors.topMargin: 0
					anchors.leftMargin: 8
					anchors.rightMargin: 0
					anchors.bottomMargin: 0
					width: parent.height
					height: parent.width
					rotation: -90
				}
				PropertyChanges {
					target: basic_keyboard
					visible: false
				}
				PropertyChanges {
					target: advanced_keyboard
					visible: true
				}
			}
		]
		Item {
			id: display_area
			Layout.fillHeight: true
			Layout.fillWidth: true

			Rectangle {
				property alias expression_text_field: expression_text_field
				id: display_rectangle
				color: "white"
				anchors.verticalCenter: parent.verticalCenter
				height: parent.height - 32
				width: parent.width
				Flickable {
					id: display_flickable
					width: parent.width
					height: parent.height
					contentWidth: expression_text_field.width + parent.width / 2
					contentHeight: parent.height
					boundsMovement: Flickable.StopAtBounds
					boundsBehavior: Flickable.DragAndOvershootBounds
					flickableDirection: Flickable.HorizontalFlick
					TextInput {
						id: expression_text_field
						color: "#ff000000"
						font.pixelSize: 30
						font.family: defaulFontFamily
						readOnly: true
						anchors.top: parent.top
						anchors.topMargin: 0
						onCursorPositionChanged: {
							var previousIndex = 0
							var previousChar = expression_text_field.displayText.charAt(
										expression_text_field.cursorPosition - 1 - previousIndex)

							if (((previousChar >= 'a') && (previousChar <= 'z'))
									|| ((previousChar >= 'A')
										&& (previousChar <= 'Z'))) {
								do {
									previousIndex++
									previousChar = expression_text_field.displayText.charAt(
												expression_text_field.cursorPosition
												- 1 - previousIndex)
								} while (((previousChar >= 'a')
										  && (previousChar <= 'z'))
										 || ((previousChar >= 'A')
											 && (previousChar <= 'Z')))
								expression_text_field.cursorPosition -= previousIndex
							}
							text_length_mask.text = expression_text_field.getText(
										0, expression_text_field.cursorPosition)
						}
					}

					Label {
						id: text_length_mask
						anchors.top: parent.top
						anchors.topMargin: 0
						visible: false
						font.pixelSize: 30
						font.family: defaulFontFamily
					}
					Rectangle {
						id: custom_cursor
						x: text_length_mask.width
						anchors.verticalCenter: text_length_mask.verticalCenter
						width: 2
						height: expression_text_field.font.pixelSize
						color: "#ffff5722"
					}
				}
				TextInput {
					id: result_text_field
					visible: true
					anchors.bottom: parent.bottom
					anchors.right: parent.right
					color: "#ff000000"
					font.pixelSize: 30
					font.family: defaulFontFamily
					readOnly: true
				}
			}
			Image {
				anchors.bottom: display_rectangle.top
				source: "Images/paper-edge-top.png"
				width: parent.width
				fillMode: Image.TileHorizontally
			}
			Image {
				anchors.top: display_rectangle.bottom
				source: "Images/paper-edge-bottpm.png"
				width: parent.width
				fillMode: Image.TileHorizontally
			}
		}
		BasicKeys {
			id: basic_keyboard
			Layout.minimumHeight: parent.width / 5 * 7.5
			Layout.fillWidth: true
		}
		AdvancedKeys {
			id: advanced_keyboard
			Layout.minimumHeight: parent.height / 10 * 6.5
			Layout.fillWidth: true
		}
	}
}
