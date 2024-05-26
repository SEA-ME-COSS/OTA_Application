#include "update.hpp"
#include <QDebug>
#include <QSslConfiguration>
#include <QSslSocket>
#include <QLoggingCategory>
#include <QNetworkProxy>

Ota::Ota(QObject *parent) : QObject(parent)
{  
    //qDebug() << "!!!!!!!!!!!!!!!!!!1Device supports OpenSSL: " << QSslSocket::supportsSsl();
    m_client = new QMqttClient(this);
    m_client->setHostname("192.168.0.109");
    m_client->setPort(1883);

    connect(m_client, &QMqttClient::connected, this, &Ota::onConnected);
    connect(m_client, &QMqttClient::messageReceived, this, &Ota::onMessageReceived);
    connect(m_client, &QMqttClient::disconnected, this, &Ota::onDisconnected);
}

Ota::~Ota()
{
    delete m_client;
}

void Ota::connectToBroker()
{
    m_client->connectToHost();
}

void Ota::publishMessage()
{
    if (m_client->state() == QMqttClient::Connected)
    {
        m_client->publish(QMqttTopicName("ota/update_url"), m_url.toUtf8());
    }
    else
    {
        qDebug() << "pub_Client is not connected";
    }
}

void Ota::subscribeToTopic(const QString &topic)
{
    if (m_client->state() == QMqttClient::Connected)
    {
        m_client->subscribe(topic, 0);
        qDebug() << "Subscribed to topic:" << topic;
    }
    else
    {
        qDebug() << "sub_Client is not connected";
    }
}

void Ota::onConnected()
{
    qDebug() << "Connected to broker";
    subscribeToTopic("ota/update");
}

void Ota::onMessageReceived(const QByteArray &message, const QMqttTopicName &topic)
{
    qDebug() << "Received message:" << message << "from topic:" << topic.name();
    m_url = message;

    emit newUpdate();
}

void Ota::onDisconnected()
{
    qDebug() << "Disconnected from broker";
}

QString Ota::url() const {
    return m_url;
}
