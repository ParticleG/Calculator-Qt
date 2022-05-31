#ifndef CALCULATE_H
#define CALCULATE_H

#include <QObject>
#include <QString>
#include <QDebug>
//#include <QtAndroid>
//#include <QAndroidIntent>

#include <iostream>
#include <cmath>
#include <ctime>
#include <vector>
#include <queue>
#include <stack>

using namespace std;

class CalculateProcess : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString inputExpression READ inputExpression WRITE setInputExpression NOTIFY inputExpressionChanged)
    Q_PROPERTY(QString resultExpression READ resultExpression NOTIFY resultExpressionChanged)

    public:
        explicit CalculateProcess(QObject * parent = nullptr);
		QString finalResult;
        QString inputExpression();
        void setInputExpression(QString &inputExpression);

        QString resultExpression();

    signals:
        void inputExpressionChanged();
        void resultExpressionChanged();

    private:
        queue<QString> reversePolishNotationQueue;
        stack<QString> operatorStack;
        stack<double> resultStack;

		unsigned short constSteps(QString &rawExpression);
		unsigned short syntaxSteps(QString &rawExpression);
		unsigned short functionSteps(QString &rawExpression, int &recursionTimes);
		double calculateSteps(QString rawExpression);

        bool singleMatched(QChar rawChar, QString maskString);
        bool allMatched(QString rawString, QString maskString);
		double gammaFunction(double n);
};

#endif // CALCULATE_H
