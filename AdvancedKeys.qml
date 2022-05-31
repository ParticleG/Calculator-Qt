import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12

Item {
	property var advanced_button_diameter: main_window.height / 14
	RowLayout {
		anchors.fill: parent
		GridLayout {
			id: advanced_function_panel_1
			visible: true
			Layout.fillWidth: true
			rows: 4
			columns: 5
			RoundButton {
				id: advanced_buttons_sin
				text: "Sin"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "sin(")
				}
			}
			RoundButton {
				id: advanced_buttons_cos
				text: "Cos"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "cos(")
				}
			}
			RoundButton {
				id: advanced_buttons_tan
				text: "Tan"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "tan(")
				}
			}
			RoundButton {
				id: advanced_buttons_left_navigate
				text: "←"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.cursorPosition -= 1
				}
			}
			RoundButton {
				id: advanced_buttons_right_navigate
				text: "→"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
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
				id: advanced_buttons_square
				text: "x²"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "^2")
				}
			}
			RoundButton {
				id: advanced_buttons_power
				text: "^"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "^")
				}
			}
			RoundButton {
				id: advanced_buttons_mod
				text: "Mod"
				font.pointSize: advanced_button_diameter / 3.5
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "%")
				}
			}
			RoundButton {
				id: advanced_buttons_left_bracket
				text: "("
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "(")
				}
			}
			RoundButton {
				id: advanced_buttons_right_bracket
				text: ")"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, ")")
				}
			}
			RoundButton {
				id: advanced_buttons_square_root
				text: "√"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "sqr(")
				}
			}
			RoundButton {
				id: advanced_buttons_square_log_10
				text: "㏒₁₀"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "logt(")
				}
			}
			RoundButton {
				id: advanced_buttons_hyper
				text: "Hyp"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					hyper_dialog.open()
				}
			}
			RoundButton {
				enabled: false
				id: advanced_buttons_summation
				text: "∑"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter


				/*
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "∑(")
				}
				*/
			}
			RoundButton {
				id: advanced_buttons_pi
				text: "π"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "π")
				}
			}
			RoundButton {
				id: advanced_buttons_combination
				text: "nCr"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "C")
				}
			}
			RoundButton {
				id: advanced_buttons_random
				text: "Rand#"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 5
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "Rand#")
				}
			}
			RoundButton {
				id: advanced_buttons_function_1
				text: "F1"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
			}
			RoundButton {
				id: advanced_buttons_factorial
				text: "!"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "fact(")
				}
			}
			RoundButton {
				id: advanced_buttons_alt_1
				text: "ALT"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "DeepPurple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					advanced_function_panel_1.visible = false
					advanced_function_panel_2.visible = true
				}
			}
		}
		GridLayout {
			id: advanced_function_panel_2
			visible: false
			Layout.fillWidth: true
			rows: 4
			columns: 5
			RoundButton {
				id: advanced_buttons_floor
				text: "Floor"
				font.pointSize: advanced_button_diameter / 5
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "flr(")
				}
			}
			RoundButton {
				id: advanced_buttons_ceil
				text: "Ceil"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "cl(")
				}
			}
			RoundButton {
				id: advanced_buttons_round
				text: "≈"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "abt(")
				}
			}
			RoundButton {
				id: advanced_buttons_left_navigate_2
				text: "←"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.cursorPosition -= 1
				}
			}
			RoundButton {
				id: advanced_buttons_right_navigate_2
				text: "→"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.cursorPosition += 1
				}
			}
			RoundButton {
				id: advanced_buttons_cube
				text: "x³"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "^3")
				}
			}
			RoundButton {
				id: advanced_buttons_log
				text: "㏒"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "logn(")
				}
			}
			RoundButton {
				id: advanced_buttons_degree
				text: "Deg"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "'")
				}
			}
			RoundButton {
				id: advanced_buttons_left_bracket_2
				text: "("
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "(")
				}
			}
			RoundButton {
				id: advanced_buttons_right_bracket_2
				text: ")"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, ")")
				}
			}
			RoundButton {
				id: advanced_buttons_cube_root
				text: "³√"
				font.pointSize: advanced_button_diameter / 2.5
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "cbr(")
				}
			}
			RoundButton {
				id: advanced_buttons_square_ln
				text: "㏑"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "ln(")
				}
			}
			RoundButton {
				id: advanced_buttons_const
				text: "Con"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					const_dialog.open()
				}
			}
			RoundButton {
				enabled: false
				id: advanced_buttons_quadrate
				text: "∏"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter


				/*
				onClicked: {
					expression_text_field.insert(expression_text_field.cursorPosition, "∏(")
				}
				*/
			}
			RoundButton {
				id: advanced_buttons_natural
				text: "e"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "e")
				}
			}
			RoundButton {
				id: advanced_buttons_permutation
				text: "nPr"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "P")
				}
			}
			RoundButton {
				id: advanced_buttons_random_Int
				text: "RanInt"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 5.5
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "RanInt(")
				}
			}
			RoundButton {
				id: advanced_buttons_function_2
				text: "F2"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
			}
			RoundButton {
				id: advanced_buttons_absolute
				text: "Abs"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "Purple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "abs(")
					expression_text_field.cursorPosition -= 2
				}
			}
			RoundButton {
				id: advanced_buttons_alt_2
				text: "ALT"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				highlighted: true
				Material.accent: "DeepPurple"
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					advanced_function_panel_1.visible = true
					advanced_function_panel_2.visible = false
				}
			}
		}
		GridLayout {
			Layout.fillWidth: true
			rows: 4
			columns: 5
			RoundButton {
				id: advanced_buttons_plus
				text: "＋"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "+")
				}
			}
			RoundButton {
				id: advanced_buttons_7
				text: "7"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "7")
				}
			}
			RoundButton {
				id: advanced_buttons_8
				text: "8"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "8")
				}
			}
			RoundButton {
				id: advanced_buttons_9
				text: "9"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "9")
				}
			}
			RoundButton {
				id: advanced_buttons_del
				text: "DEL"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
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
				id: advanced_buttons_minus
				text: "－"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "-")
				}
			}
			RoundButton {
				id: advanced_buttons_4
				text: "4"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "4")
				}
			}
			RoundButton {
				id: advanced_buttons_5
				text: "5"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "5")
				}
			}
			RoundButton {
				id: advanced_buttons_6
				text: "6"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "6")
				}
			}
			RoundButton {
				id: advanced_buttons_ac
				text: "AC"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.clear()
					result_text_field.clear()
				}
			}
			RoundButton {
				id: advanced_buttons_multiply
				text: "×"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "*")
				}
			}
			RoundButton {
				id: advanced_buttons_1
				text: "1"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "1")
				}
			}
			RoundButton {
				id: advanced_buttons_2
				text: "2"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "2")
				}
			}
			RoundButton {
				id: advanced_buttons_3
				text: "3"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "3")
				}
			}
			RoundButton {
				id: advanced_buttons_ans
				text: "ANS"
				highlighted: true
				Material.accent: "DeepOrange"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 3
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "ans")
				}
			}
			RoundButton {
				id: advanced_buttons_divide
				text: "÷"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "/")
				}
			}
			RoundButton {
				id: advanced_buttons_dot
				text: "."
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, ".")
				}
			}
			RoundButton {
				id: advanced_buttons_0
				text: "0"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					expression_text_field.insert(
								expression_text_field.cursorPosition, "0")
				}
			}
			RoundButton {
				id: advanced_buttons_equal
				text: "＝"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Material.theme: "Light"
				highlighted: true
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				onClicked: {
					result_text_field.clear()
					calculate_process.inputExpression = expression_text_field.getText(
								0, expression_text_field.length)
					result_text_field.insert(0,
											 calculate_process.resultExpression)
				}
			}
			RoundButton {
				id: advanced_buttons_menu
				text: "⋮"
				highlighted: true
				Material.accent: "LightGreen"
				Material.theme: "Light"
				font.pointSize: advanced_button_diameter / 2
				font.family: defaulFontFamily
				font.capitalization: Font.MixedCase
				Layout.preferredWidth: advanced_button_diameter
				Layout.preferredHeight: advanced_button_diameter
				rotation: 0
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
							target: advanced_buttons_menu
							rotation: 90
						}
					},
					State {
						name: "closed"
						PropertyChanges {
							target: advanced_buttons_menu
							rotation: 0
						}
					}
				]

				onClicked: {
					advanced_buttons_menu.state
							== "opened" ? advanced_buttons_menu.state
										  = "closed" : advanced_buttons_menu.state = "opened"
				}
			}
		}
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

