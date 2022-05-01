// Huge thanks to the Dead Space 2 mods for testing (and helping with) this ASL. 
// RegularSteam and NoDLC versions by Cliffs, Origin version by Mattmatt, OriginNoDLC version by AlexisDR
// Thanks Kuno for cleaning up some of my poor coding :) - AlexisDR
// You're welcome alexis :)
// LAST UPDATED 6/25/21 BY ALEXISDR. 

state("deadspace2", "Origin") // Current Patch Origin Version 
{
    int chapter : 0x01C1C0A0, 0x59C, 0x550, 0x80, 0x14, 0xCC; 
    int loading : 0x1C33E5C; 
    float zcord : 0x01CA4610, 0x20, 0xB4;
}

state("deadspace2", "NoDLC") // Downpatched Steam Version 
{
    int chapter : 0x01C00DDC, 0x1C, 0x8, 0x0, 0x38, 0xFFFFF808;
    int loading : 0x1C18B5C;
    float zcord : 0x01C00DDC, 0x1C, 0x8, 0x0, 0x38, 0x9B4;
}

state("deadspace2", "RegularSteam") // Current Patch Steam Version 
{
    int chapter : 0x01C4D554, 0x18, 0xFAC;
    int loading : 0x1C33E5C;
    float zcord : 0x01CA4610, 0x20, 0xB4;
}

state("deadspace2", "OriginNoDLC") // Downpatched Origin Version 
{
    int chapter : 0x01C4C554, 0x18, 0x2C, 0x8, 0x44, 0x64, 0xC, 0x44; 
    int loading : 0x1C32E5C; 
}

startup  
            
{
    settings.Add("ch1", true, "Chapter Splits");
    settings.Add("drill", false, "Split When You Land in Zero-G During Drill Skip"); // Community wants this to help with the timing for "Drill Skip"

    if (timer.CurrentTimingMethod == TimingMethod.RealTime) // Asks the runner to compare against Game Time if they aren't.
        {        
        var timingMessage = MessageBox.Show (
               "This game uses Time Without Loads (Game Time) as the main timing method.\n"+
                "LiveSplit is currently set to show Time With Loads (RTA).\n"+
                "Would you like to set the timing method to Game Time?",
                "LiveSplit | Dead Space 2",
               MessageBoxButtons.YesNo,MessageBoxIcon.Question
            );
        
            if (timingMessage == DialogResult.Yes)
            {
                timer.CurrentTimingMethod = TimingMethod.GameTime;
            }
        }	    
}

onStart
{
    // This is a "cycle fix" that makes sure the timer always starts at 0.00 when starting during a load
    timer.IsGameTimePaused = true;
}

init 
{
    switch (modules.First().ModuleMemorySize) { // This is to know what version you are playing on
        case  33320960: version = "Origin"; 
            break;
        case 54018048: version = "RegularSteam"; 
            break;
        case 54382592: version = "NoDLC"; 
            break;
        case 69615616: version = "OriginNoDLC"; 
            break; 
        default:        version = ""; 
            break;
    }
    vars.counter = 1;
    vars.endCheck = false;
    vars.prevPhase = timer.CurrentPhase;
}

isLoading
{
  return current.loading != 0; // It is intentional that the timer pauses when you pause the game, due to the way the game handles itself when you switch vsync on and off too much
}

update
{
    if (timer.CurrentPhase == TimerPhase.Running && vars.prevPhase == TimerPhase.NotRunning) 
    {
        vars.counter = 1;
        vars.endCheck = false;
    }
    vars.prevPhase = timer.CurrentPhase;
}

split
{
    if (current.chapter > vars.counter && (settings["ch1"])) 
    {
        vars.counter = current.chapter;
        return true;
    }

    if (settings["drill"] && current.chapter == 12 && current.zcord < 85.0 && old.zcord >= 85.0) 
    {
        return true;
    }

}

