#include "xmlhurtomreader.h"

Xmlhurtomreader::Xmlhurtomreader(Channel* channel)
{
    m_channel = channel;
}

bool Xmlhurtomreader::read(QIODevice *device)
{
    reader.setDevice(device);

    if (reader.readNextStartElement()) {
        if (reader.name() == "rss")
        {
            readRss();
        }
        else
            reader.raiseError(QObject::tr("Not a chennel file"));
    }
    return !reader.error();
}

QString Xmlhurtomreader::errorString() const
{
    return QObject::tr("%1\nLine %2, column %3")
            .arg(reader.errorString())
            .arg(reader.lineNumber())
            .arg(reader.columnNumber());
}

void Xmlhurtomreader::readRss()
{
    while(reader.readNextStartElement()){
        if(reader.name() == "channel")
            readChannel();
    }
}

void Xmlhurtomreader::readChannel()
{
    qDebug() << "read channel:" << reader.name() << endl;

    while(reader.readNextStartElement()){
        //qDebug() << "read channel iter:" << reader.name() << endl;
        if(reader.name() == "title")
            readChannelTitle();
        else if(reader.name() == "link")
            readChannelLink();
        else if(reader.name() == "description")
            readChannelDescription();
        else if(reader.name() == "generator")
            readChannelGenerator();
        else if(reader.name() == "language")
            readChannelLanguage();
        else if(reader.name() == "lastBuildDate")
            readChannelLastBuildDate();
        else if(reader.name() == "item")
            readRelease();
        else
            reader.skipCurrentElement();
    }
}

void Xmlhurtomreader::readChannelTitle()
{
   qDebug() << "read channel title:" << reader.name() << endl;

   QString title = reader.readElementText();
   //qDebug() << "title: " << title << endl;
   m_channel->set_channel_title(title);
}

void Xmlhurtomreader::readChannelLink()
{
    qDebug() << "read channel link:" << reader.name() << endl;

    QString link = reader.readElementText();
    m_channel->set_channel_link(link);
}

void Xmlhurtomreader::readChannelDescription()
{
    QString description = reader.readElementText();
    m_channel->set_channel_description(description);
}

void Xmlhurtomreader::readChannelGenerator()
{
    QString generator = reader.readElementText();
    m_channel->set_channel_generator(generator);
}

void Xmlhurtomreader::readChannelLanguage()
{
    QString language = reader.readElementText();
    m_channel->set_channel_language(language);
}

void Xmlhurtomreader::readChannelLastBuildDate()
{
    QString lastbuilddate = reader.readElementText();
    m_channel->set_channel_last_build_date(lastbuilddate);
}

void Xmlhurtomreader::readRelease()
{
    qDebug() << "read release:" << reader.name() << endl;

    Release* release = new Release;

    //readTitle(release);
    while (reader.readNextStartElement()) {
        if (reader.name() == "title")
            readTitle(release);
        else if (reader.name() == "link")
            readLink(release);
        else if (reader.name() == "pubDate")
            readPubDate(release);
        else if (reader.name() == "guid")
            readGuid(release);
        else if (reader.name() == "description")
            readDescription(release);
        else if (reader.name() == "dc:creator")
            readCreator(release);
        else if (reader.name() == "dc:subject")
            readSubject(release);
        else if (reader.name() == "category")
            readCategory(release);
        else if (reader.name() == "comments")
            readComments(release);
        else
            reader.skipCurrentElement();
    }

    m_channel->addRelease(release);
}

void Xmlhurtomreader::readTitle(Release *release)
{
    QString title = reader.readElementText();
    release->set_title(title);
}

void Xmlhurtomreader::readLink(Release *release)
{
    QString link = reader.readElementText();
    release->set_link(link);
}

void Xmlhurtomreader::readPubDate(Release *release)
{
    QString pubdate = reader.readElementText();
    release->set_pubdate(pubdate);
}

void Xmlhurtomreader::readGuid(Release *release)
{
    QString guid = reader.readElementText();
    release->set_guid(guid);
}

void Xmlhurtomreader::readDescription(Release *release)
{
    QString description = reader.readElementText();
    release->set_description(description);
}

void Xmlhurtomreader::readCreator(Release *release)
{
    QString creator = reader.readElementText();
    release->set_creator(creator);
}

void Xmlhurtomreader::readSubject(Release *release)
{
    QString subject = reader.readElementText();
    release->set_subject(subject);
}

void Xmlhurtomreader::readCategory(Release *release)
{
    QString category = reader.readElementText();
    release->set_category(category);
}

void Xmlhurtomreader::readComments(Release *release)
{
    QString comments = reader.readElementText();
    release->set_comments(comments);
}
