#include "release.h"

Release::Release()
{

}

void Release::print() const {
    qDebug("------Title: " + m_title.toLocal8Bit());
    qDebug("------Link: " + m_link.toLocal8Bit());
    qDebug("------PubDate: " + m_pubdate.toLocal8Bit());
    qDebug("------Guid: " + m_guid.toLocal8Bit());
    qDebug("------Description: " + m_description.toLocal8Bit());
    qDebug("------dc::Creator: " + m_creator.toLocal8Bit());
    qDebug("------dc::Subject: " + m_subject.toLocal8Bit());
    qDebug("------Categoty: " + m_category.toLocal8Bit());
    qDebug("------Comments: " + m_comments.toLocal8Bit());
}
