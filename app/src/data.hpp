#ifndef DATA_HPP
#define DATA_HPP

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QString>
#include <QNetworkRequest>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QDebug>


class Data : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString speed READ speed NOTIFY dataChanged)
    Q_PROPERTY(QString throttle READ throttle NOTIFY dataChanged)
    Q_PROPERTY(QString brake READ brake NOTIFY dataChanged)
    Q_PROPERTY(QString acc READ acc NOTIFY dataChanged)
    Q_PROPERTY(QString steering READ steering NOTIFY dataChanged)
    Q_PROPERTY(QString time READ time NOTIFY dataChanged)
    Q_PROPERTY(QString locationX READ locationX NOTIFY dataChanged)
    Q_PROPERTY(QString locationY READ locationY NOTIFY dataChanged)
    Q_PROPERTY(QString distance READ distance NOTIFY dataChanged)

public:
    Data(QObject *parent = nullptr);
    Q_INVOKABLE void fetchData();

    QString speed() const;
    QString throttle() const;
    QString brake() const;
    QString acc() const;
    QString steering() const;
    QString time() const;
    QString locationX() const;
    QString locationY() const;
    QString distance() const;

signals:
    void dataChanged();

private slots:
    void onFinished(QNetworkReply *reply);

private:
    QNetworkAccessManager *manager;
    QString m_speed;
    QString m_throttle;
    QString m_brake;
    QString m_acc;
    QString m_steering;
    QString m_time;
    QString m_locationX;
    QString m_locationY;
    QString m_distance;
};

#endif // DATA_HPP
