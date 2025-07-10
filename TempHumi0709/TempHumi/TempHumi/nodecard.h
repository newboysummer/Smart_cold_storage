#ifndef NODECARD_H
#define NODECARD_H

#include <QWidget>
#include <QLabel>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <cmath>

class NodeCard : public QWidget
{
    Q_OBJECT
public:
    explicit NodeCard(QString name, QWidget *parent = nullptr);

    void setOnline(bool online);
    void setData(int renewTime, float temp, float humi, float co2);

protected:
    void paintEvent(QPaintEvent *event) override;

private:
    QLabel *dotLabel;
    QLabel *labelName;
    QLabel *labelTemp;
    QLabel *labelHumi;
    QLabel *labelCo2;
    QLabel *labelTime;
    bool isOnline;
};

#endif // NODECARD_H
