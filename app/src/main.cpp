#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#include "data.hpp"
#include "update.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Data fetcher;
    Ota ota;

    QObject::connect(&fetcher, &Data::dataReady, &app, [&engine]() {
        engine.load(QUrl(QStringLiteral("qrc:/app/Main.qml")));
        if (engine.rootObjects().isEmpty())
            QCoreApplication::exit(-1);
    });

    engine.rootContext()->setContextProperty("dataFetcher", &fetcher);
    engine.rootContext()->setContextProperty("ota", &ota);

    fetcher.fetchData();
    ota.connectToBroker();

    return app.exec();
}
