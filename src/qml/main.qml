import QtQuick 2.5
import QtQuick.Layouts 1.2
import DarkStyle.Controls 1.0
import DarkStyle 1.0
import Meshroom.Job 0.1
import Meshroom.Project 0.1
import Logger 1.0
import "pages"


ApplicationWindow {

    id: _applicationWindow

    // parameters
    width: 800
    height: 500
    visible: true
    color: "#111"
    title: "meshroom"

    // properties
    property variant defaultProject: Project {}
    property variant defaultJob: Job {}
    property variant currentProject: defaultProject
    property variant currentJob: defaultJob

    // actions
    signal selectProject(int id)
    signal closeCurrentProject()
    signal openProjectDialog()
    signal openProjectDirectory()
    signal openProjectSettings()
    signal addProject(string url)
    signal removeProject(int id)
    signal selectJob(int id)
    signal addJob()
    signal duplicateJob()
    signal removeJob()
    signal openJobSubmissionDialog()
    signal submitJob(bool locally)
    signal openJobDirectory()
    signal openJobSettings()
    signal refreshJobStatus()
    signal openImageSelectionDialog(var callback)
    signal openFullscreenImageDialog(string url)

    // connections
    ApplicationConnections { target: _applicationWindow }

    // menus & dialogs
    ApplicationMenu {}
    ApplicationDialogs { id: _applicationDialogs }

    // main content
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        StackView {
            id: _applicationStack
            Layout.fillWidth: true
            Layout.fillHeight: true
            property Component homePage: HomePage {}
            property Component mainPage: MainPage {}
            initialItem: homePage
            focus: true
        }
        LogBar {
            property bool expanded: false
            Layout.fillWidth: true
            Layout.preferredHeight: expanded ? parent.height/3 : 30
            Behavior on Layout.preferredHeight { NumberAnimation {}}
            color: Style.window.color.xdark
            onToggle: expanded = !expanded
        }
    }

}
