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
    Q_PROPERTY(QVariantList night READ night NOTIFY warnChanged)
    Q_PROPERTY(int openingSignal READ openingSignal WRITE setopeningSignal NOTIFY openingInitialized)
    Q_PROPERTY(int acel_score READ acel_score NOTIFY dataChanged)
    Q_PROPERTY(int dcel_score READ dcel_score NOTIFY dataChanged)
    Q_PROPERTY(int night_score READ night_score NOTIFY dataChanged)
    Q_PROPERTY(int driving_type READ driving_type NOTIFY dataChanged)

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
    QVariantList night() const;
    int openingSignal() const;
    void setopeningSignal(int openingSignal);
    int acel_score() const;
    int dcel_score() const;
    int night_score() const;
    int driving_type() const;

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
    QVariantList m_night;
    int m_openingSignal = 0;
    int m_acel_score;
    int m_dcel_score;
    int m_night_score;
    int m_driving_type;
};

#endif // DATA_HPP
