state("DIABLO")
{
    int levelnumber: 0x28647C;
    int startnumber: "DiabloUI.dll", 0x270C0;
    int diablo: 0x251054;
    bool loadremover: 0x29CBD0, 0x0, 0x944;
}

start
{
    if(current.startnumber == 0 && old.startnumber != 0){
        return true;
    }
}

split
{
    if(current.levelnumber == 1 && old.levelnumber != 1){
        return true;
    }
    if(current.levelnumber == 12 && old.levelnumber != 12){
        return true;
    }
    if (current.diablo == 0 && old.diablo != 0){
        return true;
    }   
}

isLoading
{
        return (current.loadremover);    
}