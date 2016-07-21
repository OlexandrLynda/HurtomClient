#ifndef CHANNEL_H
#define CHANNEL_H

#include <QList>
#include "release.h"

class Channel
{
public:
    Channel();
    void addRelease(Release* release);

    QString set_channel_title() const {return m_channel_title;}
    QString set_channel_link() const {return m_channel_link;}
    QString set_channel_generator()const {return m_channel_generator;}
    QString set_channel_description() const {return m_channel_description;}
    QString set_channel_language()const {return m_channel_language;}
    QString set_channel_last_build_date() const {return m_channel_last_build_date;}

    void set_channel_title(const QString& title) {this->m_channel_title = title;}
    void set_channel_link(const QString& link) {this->m_channel_link = link;}
    void set_channel_generator(const QString& generator){this->m_channel_generator = generator;}
    void set_channel_description(const QString& description){this->m_channel_description = description;}
    void set_channel_language(const QString& language){this->m_channel_language = language;}
    void set_channel_last_build_date(const QString& last_build_date){this->m_channel_last_build_date = last_build_date;}

    void print() const;

private:
    QList<Release*> m_release;
    QString m_channel_title;
    QString m_channel_link;
    QString m_channel_description;
    QString m_channel_generator;
    QString m_channel_language;
    QString m_channel_last_build_date;
};

#endif // CHANNEL_H
