#pragma once
#include <QObject>
#include <QString>

class Backend : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
public:
    explicit Backend(QObject* parent = nullptr) : QObject(parent) {}

    QString username() const { return m_username; }
    void setUsername(const QString& u) {
        if (u == m_username) return;
        m_username = u;
        emit usernameChanged();
    }

    Q_INVOKABLE QString greet(const QString& name) {
        if (name.trimmed().isEmpty()) return "Please enter your name.";
        emit greeted(name);
        return QString("Hello, %1! 👋").arg(name.trimmed());
    }

signals:
    void usernameChanged();
    void greeted(const QString& whom);

private:
    QString m_username;
};
