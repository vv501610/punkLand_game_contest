mainscreen = {}


function mainscreen:ShowPanel()
    self.MainPanel = Panel(Rect(0, 0, Client.width, Client.height))
    self.MainPanel.setOpacity(255)
    self.MainPanel.showOnTop = true

    self.MainText = Text('', Rect(0, 50, Client.width, 50)) {
        autoTranslate = true,
        borderDistance = Point(1, 1),
        borderEnabled = true,
        textAlign = 1,
        textSize = 21,
        text = "머니 도그 서바이벌",
    }
    self.MainPanel.AddChild(self.MainText)
    
end
mainscreen:ShowPanel()