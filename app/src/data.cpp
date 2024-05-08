#include "data.hpp"

Data::Data(QObject *parent) : QObject(parent) {
    manager = new QNetworkAccessManager(this);
    connect(manager, &QNetworkAccessManager::finished, this, &Data::onFinished);
}

void Data::fetchData() {
    QUrl url("http://192.168.0.109/raw_data");
    QNetworkRequest request(url);
    manager->get(request);
}

void Data::onFinished(QNetworkReply *reply) {
    QByteArray responseData = reply->readAll();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(responseData);

    QJsonArray dataArray = jsonDoc.array();
    if (!dataArray.isEmpty()) {
        QJsonObject obj = dataArray.last().toObject();
        m_speed = QString::number(obj["Speed"].toDouble());
        m_throttle = QString::number(obj["Throttle"].toDouble());
        m_brake = QString::number(obj["Brake"].toDouble());
        m_acc = QString::number(obj["Acc"].toDouble());
        m_steering = QString::number(obj["Steering"].toDouble());
        m_time = QString::number(obj["Time"].toDouble());
        m_locationX = QString::number(obj["LocationX"].toDouble());
        m_locationY = QString::number(obj["LocationY"].toDouble());
        m_distance = QString::number(obj["Distance"].toDouble());

        emit dataChanged();
    }

    reply->deleteLater();
}

QString Data::speed() const {
    return m_speed;
}

QString Data::throttle() const {
    return m_throttle;
}

QString Data::brake() const {
    return m_brake;
}

QString Data::acc() const {
    return m_acc;
}

QString Data::steering() const {
    return m_steering;
}

QString Data::time() const {
    return m_time;
}

QString Data::locationX() const {
    return m_locationX;
}

QString Data::locationY() const {
    return m_locationY;
}

QString Data::distance() const {
    return m_distance;
}
