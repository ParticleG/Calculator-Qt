#include "calculate.h"
using namespace std;
CalculateProcess::CalculateProcess(QObject * parent) : QObject(parent){}

QString CalculateProcess::inputExpression()
{
    return QString::fromStdString("=");
}

void CalculateProcess::setInputExpression(QString &inputExpression)
{

    QString rawExpression = inputExpression;

	switch (constSteps(rawExpression))
	{
		case 1 :
			finalResult = QString::fromStdString("Invalid const");
			return;
		default:
			break;
	}
	qDebug() << "Const Prosecced: " << rawExpression << endl;
	switch(syntaxSteps(rawExpression))
	{
		case 1 :
			finalResult = QString::fromStdString("Invalid decimal point");
			return;
		case 2 :
			finalResult = QString::fromStdString("Surplus decimal points");
			return;
		case 3 :
			finalResult = QString::fromStdString("Invalid bracket");
			return;
		case 4 :
			finalResult = QString::fromStdString("Unequal brackets");
			return;
		case 5 :
			finalResult = QString::fromStdString("Invalid operand");
			return;
		default:
			break;
	}
	qDebug() << "Syntax Prosecced: " << rawExpression << endl;
	int functionRecursionTimes = 0;
	switch (functionSteps(rawExpression, functionRecursionTimes))
	{
		case 1 :
			finalResult = QString::fromStdString("Invalid function");
			return;
		case 2 :
			finalResult = QString::fromStdString("Missing parameters");
			return;
		default:
			break;
	}
	qDebug() << "Function Prosecced: " << rawExpression << endl;
	switch(syntaxSteps(rawExpression))
	{
		case 1 :
			finalResult = QString::fromStdString("Invalid decimal point");
			return;
		case 2 :
			finalResult = QString::fromStdString("Surplus decimal points");
			return;
		case 3 :
			finalResult = QString::fromStdString("Invalid bracket");
			return;
		case 4 :
			finalResult = QString::fromStdString("Unequal brackets");
			return;
		case 5 :
			finalResult = QString::fromStdString("Invalid operand");
			return;
		default:
			break;
	}
	qDebug() << "Final Expression: " << rawExpression << endl;

	finalResult = QString::number(calculateSteps(rawExpression),10,8);
}

double CalculateProcess::calculateSteps(QString rawExpression)
{
	const QString normalNumbers= "0123456789.", firstLevelOperators = "+-", secondLevelOperators = "*/%", thirdLevelOperators = "^PC";
    const QString specialConsts[64] = {"Rand#","ans"};
    int maxIndex = rawExpression.length() - 1;
    QString tempNumberString = "", tempReversePolishNotationString = "";

	while(!resultStack.empty())
	{
		resultStack.pop();
	}

    for(int i = 0; i <= maxIndex; i++)
    {
        if(singleMatched(rawExpression[i],normalNumbers))
        {
            tempNumberString += rawExpression[i];
            if(i == maxIndex)
            {
                reversePolishNotationQueue.push(tempNumberString);
                tempNumberString = "";
            }
        }
        else if(rawExpression[i] == "(")
        {
            if(tempNumberString != "")
            {
                reversePolishNotationQueue.push(tempNumberString);
                tempNumberString = "";
            }

            operatorStack.push("(");
        }
        else if(rawExpression[i] == ")")
        {
            if(tempNumberString != "")
            {
                reversePolishNotationQueue.push(tempNumberString);
                tempNumberString = "";
            }

            while(operatorStack.top() != "(")
            {
                reversePolishNotationQueue.push(operatorStack.top());
                operatorStack.pop();
            }
            operatorStack.pop();
        }
        else if(singleMatched(rawExpression[i],firstLevelOperators + secondLevelOperators + thirdLevelOperators))
        {
            if(tempNumberString != "")
            {
                reversePolishNotationQueue.push(tempNumberString);
                tempNumberString = "";
            }

            if(operatorStack.empty() || operatorStack.top() == "(" || allMatched(operatorStack.top(),firstLevelOperators))
            {
                operatorStack.push(rawExpression.mid(i,1));
            }
            else if(allMatched(operatorStack.top(),secondLevelOperators))
            {
                if(allMatched(rawExpression.mid(i,1),firstLevelOperators))
                {
                    reversePolishNotationQueue.push(operatorStack.top());
                    operatorStack.pop();
                    while(!operatorStack.empty() && allMatched(operatorStack.top(),secondLevelOperators + thirdLevelOperators))
                    {
                        reversePolishNotationQueue.push(operatorStack.top());
                        operatorStack.pop();
                    }
                    operatorStack.push(rawExpression.mid(i,1));
                }
                else
                {
                    operatorStack.push(rawExpression.mid(i,1));
                }
            }
            else if(allMatched(operatorStack.top(),thirdLevelOperators))
            {
                if(allMatched(rawExpression.mid(i,1),firstLevelOperators))
                {
                    reversePolishNotationQueue.push(operatorStack.top());
                    operatorStack.pop();
                    while(!operatorStack.empty() && allMatched(operatorStack.top(),secondLevelOperators + thirdLevelOperators))
                    {
                        reversePolishNotationQueue.push(operatorStack.top());
                        operatorStack.pop();
                    }
                    operatorStack.push(rawExpression.mid(i,1));
                }
                else if(allMatched(rawExpression.mid(i,1),secondLevelOperators))
                {
                    reversePolishNotationQueue.push(operatorStack.top());
                    operatorStack.pop();
                    while(!operatorStack.empty() && allMatched(operatorStack.top(), thirdLevelOperators))
                    {
                        reversePolishNotationQueue.push(operatorStack.top());
                        operatorStack.pop();
                    }
                    operatorStack.push(rawExpression.mid(i,1));
                }
                else
                {
                    operatorStack.push(rawExpression.mid(i,1));
                }
            }
        }
    }
    while(!operatorStack.empty())
    {
        reversePolishNotationQueue.push(operatorStack.top());
        operatorStack.pop();
    }
    while(!reversePolishNotationQueue.empty())
    {
		if(allMatched(reversePolishNotationQueue.front(),normalNumbers))
		{
			double tempNumber = (reversePolishNotationQueue.front()).toDouble();
			resultStack.push(tempNumber);
		}
		else
		{
			double firstOperand, secondOperand, operandResult;
			QString operatorString = firstLevelOperators + secondLevelOperators + thirdLevelOperators;

			for(int i = 0; i < operatorString.length(); i++)
			{
				if(reversePolishNotationQueue.front() == operatorString.mid(i,1))
				{
					QString tempNumberString;

					secondOperand = resultStack.top();
					resultStack.pop();
					firstOperand = resultStack.top();
					resultStack.pop();

					//operatorString = "+-*/%^PC"
					switch (i)
					{
						case 0 :	//+
							operandResult = firstOperand + secondOperand;
							break;
						case 1 :	//-
							operandResult = firstOperand - secondOperand;
							break;
						case 2 :	//*
							operandResult = firstOperand * secondOperand;
							break;
						case 3 :	///
							operandResult = firstOperand / secondOperand;
							break;
						case 4 :	//%
							operandResult = fmod(firstOperand, secondOperand);
							break;
						case 5 :	//^
							operandResult = pow(firstOperand, secondOperand);
							break;
						case 6 :	//P
							{
								operandResult = gammaFunction(firstOperand + 1.0) / gammaFunction(firstOperand - secondOperand + 1.0);
							}
							break;
						case 7 :	//C
							{
								operandResult = gammaFunction(firstOperand + 1.0) / (gammaFunction(secondOperand + 1.0) * gammaFunction(firstOperand - secondOperand + 1.0));
							}
							break;
						default:
							break;
					}
					resultStack.push(operandResult);
				}
			}
		}

		tempReversePolishNotationString += reversePolishNotationQueue.front() + " ";

		reversePolishNotationQueue.pop();
    }
	qDebug() << "Reverse Polish Notation: " << tempReversePolishNotationString <<endl;
	return resultStack.top();
}

double CalculateProcess::gammaFunction(double n)
{
	double tempAnswer = 0;
	const double natualConst = 2.718281828459, deltaT = 0.0001;
	for (double t = 0; t < 100; t += deltaT)
	{
		tempAnswer += (pow(t, n - 1) * pow(natualConst, -t)) * deltaT;
	}
	return tempAnswer;
}

unsigned short CalculateProcess::constSteps(QString &rawExpression)
{
	const QString normalNumbers = QString::fromLocal8Bit("0123456789"), normalConsts[] = {QString::fromLocal8Bit("e"), QString::fromLocal8Bit("π")}, specialConsts[] = {"Rand#","ans"}, commonBinaryOperators = "*/%^PC", specialBinaryOperators = "+-";

	for(int i = 0; i < 2; i++)
	{
		if(rawExpression.indexOf(specialConsts[i]) != -1)
		{
			int constIndex = rawExpression.indexOf(specialConsts[i]);
			if(singleMatched(rawExpression[constIndex - 1],normalNumbers))
			{
				rawExpression.insert(constIndex,"*");
				constIndex ++;
			}
			else if(singleMatched(rawExpression[constIndex + 1],normalNumbers))
			{
				rawExpression.insert(constIndex + 1,"*");
			}
			switch (i)
			{
				case 0 :	//Rand#
					{
						srand(static_cast<unsigned int>(time(nullptr)));
						rawExpression.replace(constIndex, specialConsts[i].length(), QString::number(rand() % (99999999 + 1) / double(99999999 + 1),10,8));
					}
					break;
				case 1 :	//ans
					rawExpression.replace(constIndex, specialConsts[i].length(), QString::number(resultStack.top(),10,8));
					break;
				default:
					break;
			}
			i--;
		}
	}

	for(int i = 0; i < 2; i++)
	{
		if(rawExpression.indexOf(normalConsts[i]) != -1)
		{
			int constIndex = rawExpression.indexOf(normalConsts[i]);
			if(singleMatched(rawExpression[constIndex - 1],normalNumbers))
			{
				rawExpression.insert(constIndex,"*");
				constIndex ++;
			}
			else if(singleMatched(rawExpression[constIndex + 1],normalNumbers))
			{
				rawExpression.insert(constIndex + 1,"*");
			}
			switch (i)
			{
				case 0 :	//e
					rawExpression.replace(constIndex, 1, "2.718281828459");
					break;
				case 1 :	//π
					rawExpression.replace(constIndex, 1, "3.1415926535898");
					break;
				default:
					break;
			}
			i--;
		}
	}
	return 0;
}
unsigned short CalculateProcess::syntaxSteps(QString &rawExpression)
{
	/*
	 * Error Codes:
     * 1 : Invalid decimal point
     * 2 : Surplus decimal points
     * 3 : Invalid bracket
     * 4 : Unequal brackets
     * 5 : Invalid operand
     * 6 : Invalid function
     */
	const QString normalNumbers = QString::fromLocal8Bit("0123456789"), commonBinaryOperators = "*/%^PC", specialBinaryOperators = "+-";
	const QString normalFunctionEnds = "nsrtlh";
	const QString normalFunctionStarts = "sctlfaR";
    int pairedBrackets = 0, maxIndex = rawExpression.length() - 1;
    if(rawExpression[0] == '.' || rawExpression[maxIndex] == '.')
    {
        return 1;
    }
    if(rawExpression[0] == ')' || rawExpression[maxIndex] == '(')
    {
        return 3;
    }
	if(singleMatched(rawExpression[0],commonBinaryOperators) || singleMatched(rawExpression[maxIndex],commonBinaryOperators + specialBinaryOperators))
    {
        return 5;
    }
	for(int i = 0; i <= maxIndex; i++)
    {
        if(rawExpression[i] == '.')
        {
			if(!(singleMatched(rawExpression[i-1],normalNumbers)))
            {
				rawExpression.insert(i,'0');
				maxIndex++;
            }
			if(!(singleMatched(rawExpression[i+1],normalNumbers)))
			{
				rawExpression.insert(i+1,'0');
				maxIndex++;
			}
            if((rawExpression.mid(i+1)).indexOf(".") != -1)
            {
                QString tempString = rawExpression.mid(i+1,(rawExpression.mid(i+1)).indexOf("."));
                if(allMatched(tempString,normalNumbers))
                {
                    return 2;
                }
            }
        }
        else if(rawExpression[i] == '(')
        {
            //qDebug()<<"(index:"<<i<<endl;
			if(singleMatched(rawExpression[i+1],commonBinaryOperators + ")"))
			{
				return 3;
			}
			else if(i == 0)
            {
				//do nothing
            }
			else if(singleMatched(rawExpression[i-1],normalNumbers))
			{
				rawExpression.insert(i,'*');
				i++;
				maxIndex++;
			}
			else if (!(singleMatched(rawExpression[i-1], normalFunctionEnds + commonBinaryOperators + specialBinaryOperators + "(")))
			{
				return 3;
            }
            pairedBrackets++;
            //qDebug()<<"pairedBrackets:"<<pairedBrackets<<endl;
        }
        else if(rawExpression[i] == ')')
        {
            //qDebug()<<")index:"<<i<<endl;
			if(singleMatched(rawExpression[i-1],commonBinaryOperators + specialBinaryOperators + "("))
			{
				return 3;
			}
			else if(i == maxIndex)
            {
				//do nothing
            }
			else if(singleMatched(rawExpression[i+1],normalNumbers))
			{
				rawExpression.insert(i+1,"*");
				i++;
				maxIndex++;
			}
			else if (!(singleMatched(rawExpression[i+1], normalFunctionStarts + commonBinaryOperators + specialBinaryOperators + ")")))
			{
				return 3;
            }
            pairedBrackets--;
            //qDebug()<<"pairedBrackets:"<<pairedBrackets<<endl;
        }
		else if(singleMatched(rawExpression[i],commonBinaryOperators))
		{
			if(singleMatched(rawExpression[i-1],commonBinaryOperators + specialBinaryOperators) || singleMatched(rawExpression[i+1],commonBinaryOperators))
            {
                return 5;
            }
        }
		else if(singleMatched(rawExpression[i],specialBinaryOperators))
		{
            //qDebug()<<"+-index:"<<i<<endl;
            if(singleMatched(rawExpression[i+1], commonBinaryOperators))
            {
                return 5;
            }
            else if(singleMatched(rawExpression[i-1], specialBinaryOperators + "("))
			{
                //qDebug()<<"+-Mode1"<<endl;
                rawExpression.insert(i,"0");
                i++;
                maxIndex++;
                //qDebug() << "rawExpression:" << rawExpression << "i:" << i << "maxIndex:" << maxIndex << endl;
			}
            else if(i == 0 || singleMatched(rawExpression[i-1], commonBinaryOperators))
            {
                //qDebug()<<"+-Mode2"<<endl;
                rawExpression.insert(i,"(0");
                i += 2;
                maxIndex += 2;
                //qDebug() << "rawExpression:" << rawExpression << "i:" << i << "maxIndex:" << maxIndex << endl;
                bool tempNumberFlag = false;
                while(true)
                {
                    i++;
                    //qDebug()<<"i:"<<i<<endl;
                    if(i == maxIndex)
                    {
                        rawExpression.insert(i+1,")");
                        i++;
                        maxIndex++;
                        break;
                    }
                    else if(tempNumberFlag)
                    {
						if(!singleMatched(rawExpression[i], normalNumbers + "."))
                        {
                            rawExpression.insert(i,")");
                            i++;
                            maxIndex++;
                            break;
                        }
                    }
                    else if(singleMatched(rawExpression[i], specialBinaryOperators))
                    {
                        //qDebug()<<"triggered at:"<<i<<endl;
                        rawExpression.insert(i,"0");
                        i++;
                        maxIndex++;
                        //qDebug() << "rawExpression:" << rawExpression << "i:" << i << "maxIndex:" << maxIndex << endl;
                    }
                    else
                    {
                        //qDebug()<<"end at:"<<i<<endl;
                        tempNumberFlag = true;
                    }
                }
                //qDebug() << "rawExpression:" << rawExpression << "i:" << i << "maxIndex:" << maxIndex << endl;
            }
		}
    }
    if(pairedBrackets != 0)
    {
        return 4;
    }
    return 0;
}
unsigned short CalculateProcess::functionSteps(QString &rawExpression, int &recursionTimes)
{
	const QString normalNumbers = QString::fromLocal8Bit("0123456789"), commonBinaryOperators = "*/%^PC", specialBinaryOperators = "+-";
	const QString normalFunctions[] = {"sin", "cos", "tan", "sqr", "cbr", "logt", "ln", "logn", "flr", "cl", "abt", "abs", "RanInt", "fact", "csc", "sec", "cot", "arcsin", "arccos", "arctan", "arccsc", "arcsec", "arccot", "sinh", "cosh", "tanh", "csch", "sech", "coth", "arcsinh", "arccosh", "arctanh", "arccsch", "arcsech","arccoth"};
	const QString normalFunctionEnds = "nsrtlh";
	recursionTimes ++;
	for(int i = 0; i < 35; i++)
	{
		if(rawExpression.indexOf(normalFunctions[i]) != -1)
		{
			int functionNameIndex = rawExpression.indexOf(normalFunctions[i]);
			if(singleMatched(rawExpression[functionNameIndex-1],normalNumbers + ")"))
			{
				rawExpression.insert(functionNameIndex,'*');
				functionNameIndex ++;
			}
			int functionContentStartIndex = functionNameIndex + normalFunctions[i].length() + 1;
			int functionContentEndIndex = functionContentStartIndex;
			int tempPairedBrackets = 1;
			do
			{
				functionContentEndIndex++;
				if(rawExpression[functionContentEndIndex] == ')')
				{
					tempPairedBrackets --;
				}
				else if(rawExpression[functionContentEndIndex] == '(')
				{
					tempPairedBrackets ++;
				}

			}while(tempPairedBrackets != 0);

			QString subExpression = rawExpression.mid(functionContentStartIndex, functionContentEndIndex - functionContentStartIndex);
			qDebug() << "subExpression:" << subExpression << endl;

			functionSteps(subExpression, recursionTimes);

			double tempAnswer = subExpression.toDouble();
			switch (i)
			{
				case 0 :	//sin
					tempAnswer = sin(tempAnswer);
					break;
				case 1 :	//cos
					tempAnswer = cos(tempAnswer);
					break;
				case 2 :	//tan
					tempAnswer = tan(tempAnswer);
					break;
				case 3 :	//sqr
					tempAnswer = sqrt(tempAnswer);
					break;
				case 4 :	//cbr
					tempAnswer = pow(tempAnswer, 1.0 / 3.0);
					break;
				case 5 :	//logt
					tempAnswer = log10(tempAnswer);
					break;
				case 6 :	//ln
					tempAnswer = log(tempAnswer);
					break;
				case 7 :	//logn
					tempAnswer = log2(tempAnswer);
					break;
				case 8 :	//flr
					tempAnswer = floor(tempAnswer);
					break;
				case 9 :	//cl
					tempAnswer = ceil(tempAnswer);
					break;
				case 10 :	//abt
					tempAnswer = round(tempAnswer);
					break;
				case 11 :	//abs
					tempAnswer = abs(tempAnswer);
					break;
				case 12 :	//RanInt
					{
						srand(static_cast<unsigned int>(time(nullptr)));
						tempAnswer = int(fmod(rand(),tempAnswer));
					}
					break;
				case 13 :	//fact
					tempAnswer = gammaFunction(tempAnswer + 1.0);
					break;
				case 14 :	//csc
					tempAnswer = 1.0 / sin(tempAnswer);
					break;
				case 15 :	//sec
					tempAnswer = 1.0 / cos(tempAnswer);
					break;
				case 16 :	//cot
					tempAnswer = cos(tempAnswer) / sin(tempAnswer);
					break;
				case 17 :	//arcsin
					tempAnswer = asin(tempAnswer);
					break;
				case 18 :	//arccos
					tempAnswer = asin(tempAnswer);
					break;
				case 19 :	//arctan
					tempAnswer = asin(tempAnswer);
					break;
				case 20 :	//ArcCsc
					tempAnswer = asin(1.0 / tempAnswer);
					break;
				case 21 :	//ArcSec
					tempAnswer = acos(1.0 / tempAnswer);
					break;
				case 22 :	//ArcCot
					tempAnswer = atan(1.0 / tempAnswer);
					break;
				case 23 :	//Sinh
					tempAnswer = sinh(tempAnswer);
					break;
				case 24 :	//Cosh
					tempAnswer = cosh(tempAnswer);
					break;
				case 25 :	//Tanh
					tempAnswer = tanh(tempAnswer);
					break;
				case 26 :	//Csch
					tempAnswer = 1.0 / sinh(tempAnswer);
					break;
				case 27 :	//Sech
					tempAnswer = 1.0 / cosh(tempAnswer);
					break;
				case 28 :	//Coth
					tempAnswer = 1.0 / tanh(tempAnswer);
					break;
				case 29 :	//ArcSinh
					tempAnswer = log(tempAnswer + sqrt(pow(tempAnswer, 2.0) + 1.0));
					break;
				case 30 :	//ArcCosh
					tempAnswer = log(tempAnswer + sqrt(pow(tempAnswer, 2.0) - 1.0));
					break;
				case 31 :	//ArcTanh
					tempAnswer = log((1.0 + tempAnswer) / (1.0 - tempAnswer));
					break;
				case 32 :	//ArcCsch
					{
						if(tempAnswer < 0.0)
						{
							tempAnswer = log(1.0 - sqrt(1.0 + pow(tempAnswer, 2.0)) / tempAnswer);
						}
						else
						{
							tempAnswer = log(1.0 + sqrt(1.0 + pow(tempAnswer, 2.0)) / tempAnswer);
						}
					}
					break;
				case 33 :	//ArcSech
					tempAnswer = log(1.0 + sqrt(1.0 - pow(tempAnswer, 2.0)) / tempAnswer);
					break;
				case 34 :	//ArcCoth
					tempAnswer = log((tempAnswer + 1.0) / (tempAnswer - 1.0));
					break;
				default:
					break;
			}
			rawExpression.replace(functionNameIndex, functionContentEndIndex - functionNameIndex + 1, QString::number(tempAnswer,10,8));
			syntaxSteps(rawExpression);
			i--;
		}
	}
	if(recursionTimes != 1)
	{
		rawExpression = QString::number(calculateSteps(rawExpression),10,8);
	}
	recursionTimes--;
	return 0;
}


bool CalculateProcess::singleMatched(QChar rawChar, QString maskString)
{
    for(int i = 0; i < maskString.length(); i++)
    {
        if(rawChar == maskString[i])
        {
            return true;
        }
    }
    return false;
}

bool CalculateProcess::allMatched(QString rawString, QString maskString)
{
    bool Matched;
    for(int i = 0; i < rawString.length(); i++)
    {
        Matched = false;
        for(int j = 0; j < maskString.length(); j++)
        {
            if(rawString[i] == maskString[j])
            {
                Matched = true;
                break;
            }
        }
        if(!Matched)
        {
            return false;
        }
    }
    return true;
}

QString CalculateProcess::resultExpression()
{
	return finalResult;
}
