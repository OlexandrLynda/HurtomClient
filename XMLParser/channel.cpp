#include "channel.h"

Channel::Channel()
{

}

void Channel::addRelease(Release* release){
    m_release.append(release);
}

void Channel::print() const {
    qDebug("---Title: " + m_channel_title.toLocal8Bit());
    qDebug("---Link: " + m_channel_link.toLocal8Bit());
    qDebug("---Description: " + m_channel_description.toLocal8Bit());
    qDebug("---Generator: " + m_channel_generator.toLocal8Bit());
    qDebug("---Language: " + m_channel_language.toLocal8Bit());
    qDebug("---LastBuildDate: " + m_channel_last_build_date.toLocal8Bit());

    foreach(Release* release, m_release)
        release->print();
}
