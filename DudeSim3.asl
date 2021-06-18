/*Dude Simulator 3 Load Remover and Auto Splitter
Written by Radioactiv03 and Meta and a lot of help from Micrologist who is absolutely big brain*/

state("DudeSimulator3")
{
    string50 sceneName: "UnityPlayer.dll", 0x010DB628, 0x28, 0xC, 0x0;
}

startup
{
	
	if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Dude Simulator 3",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }

    refreshRate = 10;

}

isLoading
{
  var loading = (current.sceneName == null);
  print(loading.ToString());
  return loading;
}

update
{
    print(current.sceneName);
    print(old.sceneName);
}

start
{
    return (current.sceneName == ("Assets/Home.unity") && current.sceneName != (old.sceneName));
}

split
{
    return (current.sceneName != (old.sceneName) && current.sceneName != ("Assets/MainMenu.unity") && current.sceneName != null );
}