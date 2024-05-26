#ifndef UPDATE_HPP
#define UPDATE_HPP

#include <QObject>
#include <QMqttClient>

class Ota : public QObject
{
    Q_OBJECT

public:
    explicit Ota(QObject *parent = nullptr);
    ~Ota();
    void connectToBroker();
    void subscribeToTopic(const QString &topic);
    Q_INVOKABLE void publishMessage();
    QString url() const;

signals:
    void newUpdate();

private slots:
    void onConnected();
    void onMessageReceived(const QByteArray &message, const QMqttTopicName &topic);
    void onDisconnected();

private:
    QMqttClient *m_client;
    QString m_url;
};

#endif // UPDATE_HPP
