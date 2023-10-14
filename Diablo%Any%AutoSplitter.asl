state("DIABLO")
{
    int levelnumber: 0x28647C;
    int startnumber: "DiabloUI.dll", 0x270C0;
    int diablo: 0x251054;
    string20 menupointer: "Storm.dll", 0x3BF14, 0xDBC;
    string20 menupointer2: "Storm.dll", 0x3BF14, 0xFEC;
    int loadremover: "USER32.dll", 0xAAF40;
    int butcher: "Diablo.exe", 0x24D754;
    int leoric: "Diablo.exe", 0x25193C;
    int lazarus: "Diablo.exe", 0x24D754;
}

onReset
{
    vars.completedSplits.Clear();
}

startup
{
    vars.completedSplits = new List<string>();
    settings.Add("Cathedral", true, "Cathedral");
    settings.Add("1", true, "Level 1", "Cathedral");
    settings.Add("2", false, "Level 2", "Cathedral");
    settings.Add("3", false, "Level 3", "Cathedral");
    settings.Add("4", false, "Level 4", "Cathedral");
    settings.Add("Catacombs", true, "Catacombs");
    settings.Add("5", false, "Level 5", "Catacombs");
    settings.Add("6", false, "Level 6", "Catacombs");
    settings.Add("7", false, "Level 7", "Catacombs");
    settings.Add("8", false, "Level 8", "Catacombs");
    settings.Add("Caves", true, "Caves");
    settings.Add("9", false, "Level 9", "Caves");
    settings.Add("10", false, "Level 10", "Caves");
    settings.Add("11", false, "Level 11", "Caves");
    settings.Add("12", true, "Level 12", "Caves");
    settings.Add("12a", true, "Level 12 return", "12");
    settings.Add("Hell", true, "Hell");
    settings.Add("13", false, "Level 13", "Hell");
    settings.Add("14", false, "Level 14", "Hell");
    settings.Add("15", false, "Level 15", "Hell");
    settings.Add("16", false, "Level 16", "Hell");
    settings.Add("Bosses", false, "Bosses");
    settings.Add("Butcher", false, "Butcher", "Bosses");
    settings.Add("Leoric", false, "King Leoric", "Bosses");
    settings.Add("Lazarus", false, "Archbishop Lazarus", "Bosses");
    settings.Add("Read This", true, "Read This");
    settings.SetToolTip("1", "Check this box if you want an automatic split when you reach Level 1");
    settings.SetToolTip("2", "Check this box if you want an automatic split when you reach Level 2");
    settings.SetToolTip("3", "Check this box if you want an automatic split when you reach Level 3");
    settings.SetToolTip("4", "Check this box if you want an automatic split when you reach Level 4");
    settings.SetToolTip("5", "Check this box if you want an automatic split when you reach Level 5");
    settings.SetToolTip("6", "Check this box if you want an automatic split when you reach Level 6");
    settings.SetToolTip("7", "Check this box if you want an automatic split when you reach Level 7");
    settings.SetToolTip("8", "Check this box if you want an automatic split when you reach Level 8");
    settings.SetToolTip("9", "Check this box if you want an automatic split when you reach Level 9");
    settings.SetToolTip("10", "Check this box if you want an automatic split when you reach Level 10");
    settings.SetToolTip("11", "Check this box if you want an automatic split when you reach Level 11");
    settings.SetToolTip("12", "Check this box if you want an automatic split when you reach Level 12");
    settings.SetToolTip("13", "Check this box if you want an automatic split when you reach Level 13");
    settings.SetToolTip("14", "Check this box if you want an automatic split when you reach Level 14");
    settings.SetToolTip("15", "Check this box if you want an automatic split when you reach Level 15");
    settings.SetToolTip("16", "Check this box if you want an automatic split when you reach Level 16");
    settings.SetToolTip("Read This", "If you're running with the default Any% Livesplit from Speedrun.com leave only Level 1 and Level 12 checked");
    settings.SetToolTip("12a", "This box would make a second split after coming back from town to Level 12 (Teleport/Staff of Wizardry Grind)");
    settings.SetToolTip("Bosses", "Check this box if you want an automatic split when you kill a specific boss");
}

start
{
    if(current.startnumber == 0 && old.startnumber != 0){
        return true;
    }
}

reset
{
    if(old.menupointer == "Choose Class" && current.menupointer == "Enter Name"){
        return true;
    }
    if(old.menupointer2 == "Choose Class" && current.menupointer2 == "Enter Name"){
        return true;
    }
}

split
{
    if (current.diablo == 0 && old.diablo != 0){
        return true;
    }
if (current.butcher == 0 && old.butcher > 0 && settings["Butcher"] == true){
        return true;
    }
    if (current.leoric == 0 && old.leoric > 0 && settings["Leoric"] == true){
        return true;
    }
    if (current.lazarus == 0 && old.lazarus > 0 && settings["Lazarus"] == true){
        return true;
    }
    if(current.levelnumber > old.levelnumber && settings[current.levelnumber.ToString()]&& !vars.completedSplits.Contains(current.levelnumber.ToString())){
        vars.completedSplits.Add(current.levelnumber.ToString());
        return true;
    }
    if(current.levelnumber == 12 && old.levelnumber == 0 && settings["12a"] && !vars.completedSplits.Contains("12a")){
        vars.completedSplits.Add("12a");
        return true;
    }
}

isLoading
{
        return (current.loadremover == 3);    
}

