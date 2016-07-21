#ifndef XMLHURTOMREADER_H
#define XMLHURTOMREADER_H

#include <QIODevice>
#include <QXmlStreamReader>
#include <QFile>
#include <QDebug>
#include "release.h"
#include "channel.h"


class Xmlhurtomreader
{
public:
    Xmlhurtomreader(Channel* channel);
    bool read(QIODevice *device);
    QString errorString() const;

private:
    QXmlStreamReader reader;
    Channel* m_channel;

    void readRss();
    void readChannel();
    void readChannelTitle();
    void readChannelLink();
    void readChannelDescription();
    void readChannelGenerator();
    void readChannelLanguage();
    void readChannelLastBuildDate();
    void readRelease();
    void readTitle(Release* release);
    void readLink(Release* release);
    void readPubDate(Release* release);
    void readGuid(Release* release);
    void readDescription(Release* release);
    void readCreator(Release* release);
    void readSubject(Release* release);
    void readCategory(Release* release);
    void readComments(Release* release);

};

#endif // XMLHURTOMREADER_H
