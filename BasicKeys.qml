import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12

import "functions.js" as Utils

Item {
	property var basic_button_diameter: (main_window.width / 5) - 5
	ColumnLayout {
		anchors.fill: parent
		GridLayout {
			id: basic_function_panel_1
			Layout.fillHeight: true
			visible: true
			rows: 2
			columns: 5
			RoundButton {
				id: basic_buttons_square
				text: "x²"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "^2")
				}
			}
			RoundButton {
				id: basic_buttons_power
				text: "^"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "^")
				}
			}
			RoundButton {
				id: basic_buttons_sin
				text: "Sin"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "sin(")
				}
			}
			RoundButton {
				id: basic_buttons_cos
				text: "Cos"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "cos(")
				}
			}
			RoundButton {
				id: basic_buttons_tan
				text: "Tan"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "tan(")
				}
			}
			RoundButton {
				id: basic_buttons_square_root
				text: "√"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "sqr(")
				}
			}
			RoundButton {
				id: basic_buttons_square_log_10
				text: "㏒₁₀"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "logt(")
				}
			}
			RoundButton {
				id: basic_buttons_mod
				text: "Mod"
				font.pointSize: basic_button_diameter / 3.5
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "%")
				}
			}
			RoundButton {
				id: basic_buttons_hyper
				text: "Hyp"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					hyper_dialog.open()
				}
			}
			RoundButton {
				id: basic_buttons_pi
				text: "π"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "π")
				}
			}
		}
		GridLayout {
			id: basic_function_panel_2
			visible: false
			Layout.fillHeight: true
			rows: 2
			columns: 5
			RoundButton {
				id: basic_buttons_cube
				text: "x³"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "^3")
				}
			}
			RoundButton {
				id: basic_buttons_log
				text: "㏒"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "logn(")
				}
			}
			RoundButton {
				id: basic_buttons_floor
				text: "Floor"
				font.pointSize: basic_button_diameter / 5
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "flr(")
				}
			}
			RoundButton {
				id: basic_buttons_ceil
				text: "Ceil"
				font.pointSize: basic_button_diameter / 4
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "cl(")
				}
			}
			RoundButton {
				id: basic_buttons_round
				text: "≈"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "abt(")
				}
			}
			RoundButton {
				id: basic_buttons_cube_root
				text: "³√"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "cbr(")
				}
			}
			RoundButton {
				id: basic_buttons_square_ln
				text: "㏑"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "ln(")
				}
			}
			RoundButton {
				enabled: false
				id: basic_buttons_degree
				text: "Deg"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter


				/*
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "'")
				}
				*/
			}
			RoundButton {
				id: basic_buttons_const
				text: "Con"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					const_dialog.open()
				}
			}
			RoundButton {
				id: basic_buttons_natural
				text: "e"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "e")
				}
			}
		}
		GridLayout {
			Layout.minimumHeight: parent.width

			rows: 4
			columns: 5

			RoundButton {
				id: basic_buttons_left_bracket
				text: "("
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "(")
				}
			}
			RoundButton {
				id: basic_buttons_right_bracket
				text: ")"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, ")")
				}
			}
			RoundButton {
				id: basic_buttons_alt
				text: "ALT"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "DeepPurple"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					basic_function_panel_1.visible = !basic_function_panel_1.visible
					basic_function_panel_2.visible = !basic_function_panel_2.visible
				}
			}
			RoundButton {
				id: basic_buttons_left_navigate
				text: "←"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.cursorPosition -= 1
				}
			}
			RoundButton {
				id: basic_buttons_right_navigate
				text: "→"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					var nextIndex = 0
					var nextChar = expression_text_field.displayText.charAt(
								expression_text_field.cursorPosition + nextIndex)

					if (((nextChar >= 'a') && (nextChar <= 'z'))
							|| ((nextChar >= 'A') && (nextChar <= 'Z'))) {
						do {
							nextIndex++
							nextChar = expression_text_field.displayText.charAt(
										expression_text_field.cursorPosition + nextIndex)
						} while (((nextChar >= 'a') && (nextChar <= 'z'))
								 || ((nextChar >= 'A') && (nextChar <= 'Z')))
						expression_text_field.cursorPosition += (nextIndex + 1)
					} else {
						expression_text_field.cursorPosition += 1
					}
				}
			}
			RoundButton {
				id: basic_buttons_plus
				text: "＋"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "+")
				}
			}
			RoundButton {
				id: basic_buttons_7
				text: "7"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "7")
				}
			}
			RoundButton {
				id: basic_buttons_8
				text: "8"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "8")
				}
			}
			RoundButton {
				id: basic_buttons_9
				text: "9"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "9")
				}
			}
			RoundButton {
				id: basic_buttons_del
				text: "DEL"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					if (expression_text_field.getText(
								expression_text_field.cursorPosition,
								expression_text_field.cursorPosition - 1) === "(") {

						var normalFunctions = ["sin", "cos", "tan", "sqr", "cbr", "logt", "ln", "logn", "flr", "cl", "abt", "abs", "RanInt", "fact", "csc", "sec", "cot", "arcsin", "arccos", "arctan", "arccsc", "arcsec", "arccot", "sinh", "cosh", "tanh", "csch", "sech", "coth", "arcsinh", "arccosh", "arctanh", "arccsch", "arcsech", "arccoth"]
						for (var i = 0; i < 35; i++) {
							var tempExpression = expression_text_field.getText(
										expression_text_field.cursorPosition - 1,
										expression_text_field.cursorPosition - 1
										- normalFunctions[i].length)
							//console.log(tempExpression)
							if (tempExpression === normalFunctions[i]) {
								expression_text_field.remove(
											expression_text_field.cursorPosition,
											expression_text_field.cursorPosition
											- 1 - normalFunctions[i].length)
							}
						}
					} else {
						expression_text_field.remove(
									expression_text_field.cursorPosition - 1,
									expression_text_field.cursorPosition)
					}
				}
			}
			RoundButton {
				id: basic_buttons_minus
				text: "－"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "-")
				}
			}
			RoundButton {
				id: basic_buttons_4
				text: "4"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "4")
				}
			}
			RoundButton {
				id: basic_buttons_5
				text: "5"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "5")
				}
			}
			RoundButton {
				id: basic_buttons_6
				text: "6"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "6")
				}
			}
			RoundButton {
				id: basic_buttons_ac
				text: "AC"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.clear()
					result_text_field.clear()
				}
			}
			RoundButton {
				id: basic_buttons_multiply
				text: "×"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "*")
				}
			}
			RoundButton {
				id: basic_buttons_1
				text: "1"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "1")
				}
			}
			RoundButton {
				id: basic_buttons_2
				text: "2"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "2")
				}
			}
			RoundButton {
				id: basic_buttons_3
				text: "3"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "3")
				}
			}
			RoundButton {
				id: basic_buttons_ans
				text: "ANS"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: basic_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "ans")
				}
			}
			RoundButton {
				id: basic_buttons_divide
				text: "÷"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "/")
				}
			}
			RoundButton {
				id: basic_buttons_dot
				text: "."
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, ".")
				}
			}
			RoundButton {
				id: basic_buttons_0
				text: "0"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "0")
				}
			}
			RoundButton {
				id: basic_buttons_equal
				text: "="
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				highlighted: true
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				onClicked: {
					result_text_field.clear()
					calculate_process.inputExpression = expression_text_field.getText(
								0, expression_text_field.length)
					result_text_field.insert(0,
											 calculate_process.resultExpression)
				}
			}
			RoundButton {
				id: basic_buttons_menu
				text: "⋮"
				highlighted: true
				Material.accent: "LightGreen"
				Material.theme: "Light"
				font.pointSize: basic_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: basic_button_diameter
				Layout.preferredHeight: basic_button_diameter
				rotation: 0
				z: 100
				transitions: Transition {
					RotationAnimation {
						duration: 200
						direction: RotationAnimation.Shortest
						easing.type: Easing.OutCubic
					}
				}
				states: [
					State {
						name: "opened"
						PropertyChanges {
							target: basic_buttons_menu
							rotation: 90
						}
					},
					State {
						name: "closed"
						PropertyChanges {
							target: basic_buttons_menu
							rotation: 0
						}
					}
				]

				onClicked: {
					basic_buttons_menu.state
							== "opened" ? basic_buttons_menu.state
										  = "closed" : basic_buttons_menu.state = "opened"
					basic_buttons_menu_option_1.state
							== "opened" ? basic_buttons_menu_option_1.state
										  = "closed" : basic_buttons_menu_option_1.state = "opened"
				}
			}
		}
	}
	RoundButton {
		visible: false
		id: basic_buttons_menu_option_1
		text: "1"
		highlighted: true
		Material.accent: "LightGreen"
		Material.theme: "Light"
		font.pointSize: basic_button_diameter / 3
		font.family: defaulFontFamily
		font.capitalization: Font.MixedCase

		width: basic_buttons_menu.width * 2 / 3
		height: basic_buttons_menu.height * 2 / 3

		x: basic_buttons_menu.x
		y: basic_function_panel_1.height + basic_buttons_menu.y
		z: 90
		transitions: Transition {
			PropertyAnimation {
				properties: "y"
				easing.type: Easing.OutCubic
			}
		}
		states: [
			State {
				name: "opened"
				PropertyChanges {
					target: basic_buttons_menu_option_1
					y: basic_function_panel_1.height + basic_buttons_menu.y
					   - basic_buttons_menu.height * 3 / 2
				}
			},
			State {
				name: "closed"
				PropertyChanges {
					target: basic_buttons_menu_option_1
					y: basic_function_panel_1.height + basic_buttons_menu.y
				}
			}
		]

		onClicked: {
			console.log("Option 1")
		}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

