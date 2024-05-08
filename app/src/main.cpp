#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "data.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Data fetcher;
    engine.rootContext()->setContextProperty("dataFetcher", &fetcher);

    const QUrl url(QStringLiteral("qrc:/app/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
