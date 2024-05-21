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
    Q_PROPERTY(QString distance READ distance NOTIFY dataChanged)
    Q_PROPERTY(QString distance_available READ distance_available NOTIFY dataChanged)
    Q_PROPERTY(QString battery READ battery NOTIFY dataChanged)
    Q_PROPERTY(int score_fuel READ score_fuel NOTIFY dataChanged)
    Q_PROPERTY(int score_safety READ score_safety NOTIFY dataChanged)
    Q_PROPERTY(int score_time READ score_time NOTIFY dataChanged)
    Q_PROPERTY(QVariantList locations READ locations NOTIFY locationsChanged)
    Q_PROPERTY(QVariantList acceleration READ acceleration NOTIFY warnChanged)
    Q_PROPERTY(QVariantList deceleration READ deceleration NOTIFY warnChanged)
    Q_PROPERTY(int openingSignal READ openingSignal WRITE setopeningSignal NOTIFY openingInitialized)

public:
    Data(QObject *parent = nullptr);
    ~Data();
    Q_INVOKABLE void fetchData();
    QString distance() const;
    QString distance_available() const;
    QString battery() const;
    int score_fuel() const;
    int score_safety() const;
    int score_time() const;
    QVariantList locations() const;
    QVariantList acceleration() const;
    QVariantList deceleration() const;
    int openingSignal() const;
    void setopeningSignal(int openingSignal);

signals:
    void dataChanged();
    void locationsChanged();
    void warnChanged();
    void dataReady();
    void openingInitialized();

private slots:
    void onFinished(QNetworkReply *reply);

private:
    QNetworkAccessManager *manager;
    QString m_distance;
    QString m_distance_available;
    QString m_battery;
    int m_score_fuel;
    int m_score_safety;
    int m_score_time;
    double m_locationX;
    double m_locationY;
    QVariantList m_locations;
    QVariantList m_accel;
    QVariantList m_decel;
    int m_openingSignal = 0;
};

#endif // DATA_HPP
