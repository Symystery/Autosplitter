// Thanks Kuno for teaching me the entire ASL :D
state("Outlast2", "1.3") {
	int ingame: 0x01F9512C; // Are you in the game
	string100 map: 0x0219B4A8, 0xBAC, 0x8; // Thanks to cheat mods for the game you can find current checkpoint
	float xcoord: 0x0219FF58, 0x250, 0x11C, 0x68, 0x118, 0x220;
	float ycoord: 0x0219FF58, 0x250, 0x11C, 0x68, 0x118, 0x224;
	float zcoord: 0x0219FF58, 0x250, 0x11C, 0x68, 0x118, 0x228;
}

state("Outlast2", "1.2") {
	int ingame: 0x01F950EC; // Are you in the game
	string100 map: 0x0219B468, 0xBAC, 0x8; // Thanks to cheat mods for the game you can find current checkpoint
	float xcoord: 0x0219FF18, 0x250, 0x68, 0x48, 0x124, 0xB0, 0x8, 0x40;
	float ycoord: 0x0219FF18, 0x250, 0x68, 0x48, 0x124, 0xB0, 0x8, 0x44;
	float zcoord: 0x0219FF18, 0x250, 0x68, 0x48, 0x124, 0xB0, 0x8, 0x48;
}

startup {
	vars.Stopwatch = new Stopwatch();
	vars.DelayTime = 0.005;
	vars.black = false;
	vars.mapcomparison = "";
	vars.startermap = "";
	vars.finalsplit = false;
	vars.runover = false;
	settings.Add("il", false, "Individual level start timing (Do not use for full runs!)");
	settings.Add("standard", true, "Standard options");
	settings.Add("genesis", true, "Genesis", "standard");
	settings.Add("crash", true, "The Crash", "genesis");
	settings.Add("compound", true, "The Compound", "genesis");
	settings.Add("music", true, "Saint Sybil School", "genesis");
	settings.Add("field", true, "The Fields", "genesis");
	settings.Add("cave", true, "Heretic Cave", "genesis");
	settings.Add("templegate", true, "Temple Gate Town Square", "genesis");
	settings.Add("vent", true, "Jessica's Death", "genesis");
	settings.Add("chapel", true, "The Chapel", "genesis");
	settings.Add("roadmine", true, "The Road to the Mine", "genesis");
	settings.Add("inner", true, "Inner Demon", "genesis");

	settings.Add("job", true, "Job", "standard");
	settings.Add("scalled", true, "The Scalled", "job");
	settings.Add("sybil", true, "St. Sybil Administration", "job");
	settings.Add("golgotha", true, "Golgotha", "job");
	settings.Add("help", true, "A Call for Help", "job");
	settings.Add("supper", true, "Last Supper", "job");
	settings.Add("roof", true, "The School Roof", "job");

	settings.Add("lamentations", true, "Lamentations", "standard");
	settings.Add("raft", true, "The Lake", "lamentations");
	settings.Add("rainingblood", true, "Raining Blood", "lamentations");

	settings.Add("judges", true, "Judges", "standard");
	settings.Add("welcome", true, "Welcome", "judges");
	settings.Add("lab", true, "Computer Lab", "judges");
	settings.Add("ascension", true, "The Ascension", "judges");
	settings.Add("library", true, "The Library", "judges");
	settings.Add("batm", true, "Blake against the Machine", "judges");
	settings.Add("suicide", true, "Murder Before Suicide", "judges");
	settings.Add("king", true, "King of the Hill", "judges");

	settings.Add("leviticus", true, "Leviticus", "standard");
	settings.Add("decent", true, "The Descent", "leviticus");
	settings.Add("val", true, "Val's Rebirth", "leviticus");
	settings.Add("jess", true, "Father Loutermilch", "leviticus");

	settings.Add("revelations", true, "Revelations", "standard");
	settings.Add("apocalypse", true, "The Apocalypse", "revelations");

	settings.Add("extended", false, "Extended options - Untick Standard options if you use this");
	settings.Add("genesis2", true, "Genesis", "extended");
	settings.Add("crash2", true, "The Crash", "genesis2");
	settings.Add("compound2", true, "The Compound", "genesis2");
	settings.Add("music2", true, "Saint Sybil School", "genesis2");
	settings.Add("field2", true, "The Fields", "genesis2");
	settings.Add("cave2", true, "Heretic Cave", "genesis2");
	settings.Add("templegate2", true, "Temple Gate Town Square", "genesis2");
	settings.Add("vent2", true, "Jessica's Death", "genesis2");
	settings.Add("chapel2", true, "The Chapel", "genesis2");
	settings.Add("roadmine2", true, "The Road to the Mine", "genesis2");
	settings.Add("inner2", true, "Inner Demon", "genesis2");

	settings.Add("job2", true, "Job", "extended");
	settings.Add("scalled2", true, "The Scalled", "job2");
	settings.Add("sybil2", true, "St. Sybil Administration", "job2");
	settings.Add("golgotha2", true, "Golgotha", "job2");
	settings.Add("help2", true, "A Call for Help", "job2");
	settings.Add("supper2", true, "Last Supper", "job2");
	settings.Add("roof2", true, "The School Roof", "job2");

	settings.Add("lamentations2", true, "Lamentations", "extended");
	settings.Add("raft2", true, "The Lake", "lamentations2");
	settings.Add("rainingblood2", true, "Raining Blood", "lamentations2");

	settings.Add("judges2", true, "Judges", "extended");
	settings.Add("welcome2", true, "Welcome", "judges2");
	settings.Add("lab2", true, "Computer Lab", "judges2");
	settings.Add("ascension2", true, "The Ascension", "judges2");
	settings.Add("library2", true, "The Library", "judges2");
	settings.Add("batm2", true, "Blake against the Machine", "judges2");
	settings.Add("suicide2", true, "Murder Before Suicide", "judges2");
	settings.Add("king2", true, "King of the Hill", "judges2");

	settings.Add("leviticus2", true, "Leviticus", "extended");
	settings.Add("decent2", true, "The Descent", "leviticus2");
	settings.Add("val2", true, "Val's Rebirth", "leviticus2");
	settings.Add("jess2", true, "Father Loutermilch", "leviticus2");

	settings.Add("revelations2", true, "Revelations", "extended");
	settings.Add("apocalypse2", true, "The Apocalypse", "revelations2");

	vars.ILStartingList = new List < string > {
		"CP_Crash_PostHaarp",
		"CP_School_Classroom",
		"CP_VS1_Cliff",
		"CP_VS1_Cornfield1_Done",
		"CP_VS1_SecretCave_4",
		"CP_School_Vent",
		"CP_VS2_Pavilion_2",
		"CP_VS3_Torture",
		"CP_School_AdminStart",
		"CP_SY_ToBridge",
		"CP_School_LockerStart",
		"CP_SY_ToTheCrusifix",
		"CP_School_Cafeteria_Start",
		"CP_SY_Compound",
		"CP_School_RooftopStart",
		"CP_RV_Start",
		"CP_School_PoolStart",
		"CP_MF_Start",
		"CP_School_ComputerLab",
		"CP_MF_WaterTank",
		"CP_School_WindowExt",
		"CP_MF_CrankOn",
		"CP_School_DeadJessica",
		"CP_MF_Catwalk",
		"CP_MU_Start",
		"CP_MU_ValChase",
		"CP_School_ToLoutermilch",
		"CP_MU_GoGetLynn",
	};

	var tB = (Func < string, string, string, bool, Tuple < string, string, string, bool >> )((elmt1, elmt2, elmt3, elmt4) => {
		return Tuple.Create(elmt1, elmt2, elmt3, elmt4);
	});
	var sB = new List < Tuple < string,
		string, string, bool >> {
			tB("crash", "CP_Crash_CrashSiteToChopper", "Go to the Helicopter", false),
			tB("crash", "CP_Crash_PostChopper", "Inspected the Helicopter", false),
			tB("crash", "CP_Crash_EnterVillage", "The Village", false),
			tB("crash", "CP_Crash_BurnBabyBurn", "Through the Hole in the Fence", false),
			tB("crash", "CP_Crash_ToMarta", "First Encounter with Marta", true),
			tB("crash", "CP_Crash_Barn", "Inside the Barn", false),
			tB("crash", "CP_Crash_Marta", "Face to Face with Marta", false),
			tB("crash", "CP_Crash_CoreSequence", "Left the Barn", false),
			tB("compound", "CP_Crash_PostHaarp", "The Compound Start", true),
			tB("compound", "CP_Crash_Ceremony", "Through the Hole in the Fence", false),
			tB("compound", "CP_Crash_ToLynn", "Reuniting with Lynn", false),
			tB("compound", "CP_Crash2_PostSlide", "Following Lynn", true),
			tB("compound", "CP_Crash2_Kidnap", "Escaping with Lynn", false),
			tB("compound", "CP_Crash2_KidnapDone", "Lynn is Kidnapped", false),
			tB("compound", "CP_Crash2_Escape", "Entering the Pond", false),
			tB("music", "CP_School_Classroom", "Saint Sybil School Start", true),
			tB("field", "CP_VS1_Cliff", "The Fields Start", true),
			tB("field", "CP_VS1_Ethan_1", "Waking up in Ethan's Basement", false),
			tB("field", "CP_VS1_Ethan_2", "Ethan is Dead", false),
			tB("field", "CP_VS1_Ethan_3", "Leaving Ethan's Cabin", false),
			tB("field", "CP_VS1_Cornfield1_1", "Leaving the River", false),
			tB("field", "CP_VS1_Cornfield1_2", "Entering the Cornfield", false),
			tB("field", "CP_VS1_Cornfield1_3", "Leaving the Cornfield", false),
			tB("field", "CP_VS1_Cornfield1_4", "Entering the Barn", false),
			tB("cave", "CP_VS1_Cornfield1_Done", "Heretic Cave Start", true),
			tB("cave", "CP_VS1_SecretCave_1", "Entering the Cave", false),
			tB("cave", "CP_VS1_SecretCave_2", "The Heretic Temple", false),
			tB("cave", "CP_VS1_SecretCave_3", "Leaving the Heretic Cave", false),
			tB("templegate", "CP_VS1_SecretCave_4", "Temple Gate Town Square Start", true),
			tB("templegate", "CP_VS2_SecretBasement", "Entering the Basement", true),
			tB("templegate", "CP_VS2_Southside_1", "Entering the Town Square", false),
			tB("templegate", "CP_VS2_Southside_2", "Turned on the Generator", false),
			tB("templegate", "CP_VS2_Pavilion_1", "Elevator Ride", true),
			tB("vent", "CP_School_Vent", "Jessica's Death Start", true),
			tB("chapel", "CP_VS2_Pavilion_2", "The Chapel Start", true),
			tB("chapel", "CP_VS2_Pavilion_2_2", "After the First Chase", false),
			tB("chapel", "CP_VS2_Pavilion_2_2B", "The Cultist Breaks Down the Door", false),
			tB("chapel", "CP_VS2_Pavilion_2_3", "Entering the Underground", false),
			tB("chapel", "CP_VS2_Pavilion_2_4", "He's in the House!", true),
			tB("chapel", "CP_VS2_CreaksideEast_1", "After the Second Chase", true),
			tB("chapel", "CP_VS2_CreaksideEast_2", "Fall from the Window", false),
			tB("chapel", "CP_VS2_CreaksideEast_2_2", "Climbed over the First Gate", false),
			tB("chapel", "CP_VS2_CreaksideEast_3", "Marta Blocks the Cart", false),
			tB("chapel", "CP_VS2_ToChapel", "Climbed over the Second Gate", false),
			tB("chapel", "CP_VS2_Chapel_1", "Walkway to the Chapel", false),
			tB("chapel", "CP_VS2_Chapel_2", "Knoth is Coming", false),
			tB("roadmine", "CP_VS3_Torture", "The Road to the Mine Start", true),
			tB("roadmine", "CP_VS3_TortureDone", "Josiah and Mary Are Dead", false),
			tB("roadmine", "CP_VS3_Chapel_3", "Leaving the Chapel", false),
			tB("roadmine", "CP_VS3_Cornfield_2", "Climbed the Tower", false),
			tB("roadmine", "CP_VS3_Cornfield_3", "Entering the Cornfield", false),
			tB("roadmine", "CP_VS3_Watermill_1", "Left the Cornfield", false),
			tB("roadmine", "CP_VS3_Watermill_2", "Grabbed the Crank", true),
			tB("roadmine", "CP_VS3_MartaField", "Leaving the Watermill", false),
			tB("roadmine", "CP_VS3_MartaField_2", "Marta in the Way", false),
			tB("roadmine", "CP_VS3_Hook", "Grabbed the Hook", true),
			tB("roadmine", "CP_VS3_Hook_2", "Marta Breaks through the Gate", false),
			tB("roadmine", "CP_VS3_MartaShowdown", "After Placing the Hook", false),
			tB("roadmine", "CP_VS3_ToOldMine", "Escaped Marta", false),
			tB("inner", "CP_School_AdminStart", "Inner Demon Start", true),
			tB("inner", "CP_School_AdminAcetate", "Unforgivable", false), //wtf is an acetate 
			tB("inner", "CP_School_AdminDemon", "The Spooky Hallway", false),
			tB("scalled", "CP_SY_ToBridge", "Job/The Scalled Start", true),
			tB("scalled", "CP_SY_Bridge", "Walking across the Bridge", false),
			tB("scalled", "CP_SY_BottomBridge", "Taking the Long Way", false),
			tB("scalled", "CP_SY_AfterEboulis", "Ran up the Tree", false),
			tB("scalled", "CP_SY_After1stCrawler", "Crawled through the Tree", false),
			tB("scalled", "CP_SY_PostSlide", "The Scalled Village", false),
			tB("scalled", "CP_SY_OneOfUs", "Falling Down the Hill", false),
			tB("scalled", "CP_SY_NLFacetoFace", "Encountering Nick and Laird", false),
			tB("sybil", "CP_School_LockerStart", "St. Sybil Administration Start", true),
			tB("sybil", "CP_School_ComputerMonitor", "Checked the Computer", false),
			tB("golgotha", "CP_SY_ToTheCrusifix", "Golgotha Start", true),
			tB("golgotha", "CP_SY_Follow_NL", "After the Crucifixion", true),
			tB("golgotha", "CP_SY_Follow_NL_2", "Run through the Pond", false),
			tB("golgotha", "CP_SY_Follow_NL_3", "Getting Around the Gate", false),
			tB("golgotha", "CP_SY_Follow_NL_4", "Hide from Nick and Laird", true),
			tB("help", "CP_School_Cafeteria_Start", "A Call for Help Start", true),
			tB("help", "CP_School_ToPhone", "Encountering the Demon", false),
			tB("help", "CP_School_Phone", "After the Phone Call", true),
			tB("supper", "CP_SY_Compound", "The Last Supper Start", true),
			tB("supper", "CP_SY_Compound_End", "Cross the Fallen Tree", false),
			tB("supper", "CP_SY_Sniping1", "Nick and Laird Sniping", false),
			tB("supper", "CP_SY_Sniping2", "Nick and Laird Sniping II", false),
			tB("supper", "CP_SY_Sniping3", "The Campsite", false),
			tB("supper", "CP_SY_Sniping4", "Surprise Enemy Grab", false),
			tB("supper", "CP_SY_CoffinInside", "Buried Alive Cutscene Start", true),
			tB("supper", "CP_SY_CoffinEscape", "Buried Alive Cutscene End", false),
			tB("supper", "CP_SY_PenduPrez", "The Hanging Man", false),
			tB("supper", "CP_SY_MineFacilityShot", "Facility in the Distance", true),
			tB("supper", "CP_SY_NeedARope", "Climb into the Hut", false),
			tB("supper", "CP_SY_Rope1", "Pull off the Tree Branch", false),
			tB("supper", "CP_SY_Rope2", "Grabbing the Rope", false),
			tB("supper", "CP_SY_SyphiliticEscape", "Using the Rope", false),
			tB("supper", "CP_SY_NicLairdsDeath", "Nick and Laird's Death", false),
			tB("roof", "CP_School_RooftopStart", "The School Roof Start", true),
			tB("roof", "CP_School_ToCourtyard", "Entering the School", true),
			tB("roof", "CP_School_CourtyardStart", "The School Courtyard", false),
			tB("roof", "CP_School_CourtyardTunnel", "School Underground", false),
			tB("raft", "CP_RV_Start", "Lamentations/The Lake Start", true),
			tB("raft", "CP_RV_1stBeach", "The Beach", false),
			tB("raft", "CP_RV_TopStairs", "Top of the Stairs", false),
			tB("raft", "CP_RV_HalfBeach", "The Second Beach", false),
			tB("raft", "CP_RV_RaftStart", "Boarding the Raft", false),
			tB("raft", "CP_RV_MiddleOfLake", "The Big Wave", true),
			tB("raft", "CP_RV_FirstRapid", "Climbing back onto the Raft", false),
			tB("raft", "CP_RV_FloatingCorpses", "Corpses in the River", false),
			tB("raft", "CP_RV_AfterCorpses", "After the Corpses", false),
			tB("raft", "CP_RV_SecondRapid", "The Second Rapids", false),
			tB("raft", "CP_RV_GetToRaft", "Fallen off the Raft", false),
			tB("raft", "CP_RV_TreeBridge", "The Tree Bridge", false),
			tB("raft", "CP_RV_PostTree", "After the Tree Bridge", false),
			tB("raft", "CP_RV_HurrytoRaft", "Found the Raft", false),
			tB("raft", "CP_RV_BackOnRaft", "Boarding the Raft Again", true),
			tB("raft", "CP_RV_ThirdRapid", "The Third Rapids", false),
			tB("raft", "CP_RV_MinePrez", "The Mines Are Ahead", false),
			tB("raft", "CP_RV_FinalChase", "Heretics Chase", false),
			tB("rainingblood", "CP_School_PoolStart", "Raining Blood Start", true),
			tB("rainingblood", "CP_School_SmallPool", "Out of the Pool", false),
			tB("rainingblood", "CP_School_ToRoof", "In the School Hallway", false),
			tB("welcome", "CP_MF_Start", "Judges/Welcome Start", true),
			tB("welcome", "CP_MF_FirstRoomFacility", "Entering the Facility", false),
			tB("lab", "CP_School_ComputerLab", "Computer Lab Start", true),
			tB("lab", "CP_School_LabDone", "End of Blake and Jessica's Exchange", false),
			tB("lab", "CP_School_ToPool", "Encountering the Demon", false),
			tB("ascension", "CP_MF_WaterTank", "The Ascension Start", true),
			tB("ascension", "CP_MF_CrochedBuilding_1", "Entering the Building", false),
			tB("ascension", "CP_MF_CrochedBuilding_1A", "Heretic Drops Down", false),
			tB("ascension", "CP_MF_CrochedBuilding_2", "Escaping the Heretics", false),
			tB("ascension", "CP_MF_ChaseTop", "Escaped the Heretics", false),
			tB("library", "CP_School_WindowExt", "The Library Start", true),
			tB("library", "CP_School_Library", "The Library Maze", true),
			tB("library", "CP_School_Library_2", "Leaving the Library Maze", false),
			tB("library", "CP_School_ToWhiteLight", "Jessica Screams", false),
			tB("batm", "CP_MF_CrankOn", "Blake against the Machine Start", true),
			tB("batm", "CP_MF_PushPull1", "Slide Open the Door", false),
			tB("batm", "CP_MF_PushPull2", "Climb over the Wall", false),
			tB("suicide", "CP_School_DeadJessica", "Murder before Suicide Start", true),
			tB("suicide", "CP_School_StallStart", "The Bathroom Stalls", false),
			tB("king", "CP_MF_Catwalk", "King of The Hill Start", true),
			tB("king", "CP_MF_BeforeSilo", "Climb Up after the Shimmy", false),
			tB("king", "CP_MF_Silo", "Slide Down to the Lower Floor", false),
			tB("king", "CP_MF_Roof_1", "Up to the Roof", true),
			tB("king", "CP_MF_Roof_2", "Pulling the Lever", false),
			tB("king", "CP_MF_Roof_2_2", "Ran from the Heretics", false),
			tB("decent", "CP_MU_Start", "Leviticus/The Descent Start", true),
			tB("decent", "CP_MU_ElevatorBase", "After the Elevator Ride", false),
			tB("decent", "CP_MU_TopLadder", "Before the Ladder", false),
			tB("decent", "CP_MU_ToFirstHeretics", "Before the Heretic Drops Down", false),
			tB("decent", "CP_MU_FirstHeretics", "Run from the Heretics", true),
			tB("decent", "CP_MU_PushDaCart", "The Minecart Puzzle", true), //They really gave up with checkpoint names towards the end
			tB("decent", "CP_MU_TopStairs", "Top of the Staircase", false),
			tB("decent", "CP_MU_BottomStairs", "Bottom of the Staircase", false),
			tB("val", "CP_MU_ValChase", "Val's Rebirth Start", true),
			tB("val", "CP_MU_ValChase2", "Shut off the Electricity/Before Val Skip", true),
			tB("val", "CP_MU_ToCart", "Past the Electric Cables/After Val Skip", true),
			tB("val", "CP_MU_CartBreakWall", "Past the Second Minecart Puzzle", false),
			tB("val", "CP_MU_AfterValChase2", "Val Chase II", false),
			tB("val", "CP_MU_UndergroundLake", "The Underground Lake", false),
			tB("val", "CP_MU_UndergroundLakeDone", "Escaped the Lake", false),
			tB("val", "CP_MU_ClimbinglFiesta", "Bottom of the Ladders", false),
			tB("val", "CP_MU_ClimbinglFiestaDone", "Top of the Ladders", false),
			tB("val", "CP_MU_ToCeremony", "To the Ceremony", false),
			tB("jess", "CP_School_ToLoutermilch", "Father Loutermilch Start", true),
			tB("jess", "CP_School_LoutermilchHasHer", "Blake Leaves the Classroom", false),
			tB("apocalypse", "CP_MU_GoGetLynn", "Revelations/The Apocalypse Start", true),
			tB("apocalypse", "CP_MU_GoGetLynn2", "Escaping the Cultists", false),
			tB("apocalypse", "CP_MU_WithLynnSoGetOut", "Blake Finds Lynn", false),
			tB("apocalypse", "CP_BF_BurntForestStart", "Blake and Lynn Escape", false),
			tB("apocalypse", "CP_BF_BurntRuins", "Blake and Lynn Find Shelter", false),
			tB("apocalypse", "CP_BF_FinalChase", "Blake and Lynn Run from Marta", false),
			tB("apocalypse", "CP_BF_RuinsDone", "Marta's Death", true),
			tB("apocalypse", "CP_BF_Cemetary", "The Cemetary", false),
			tB("apocalypse", "CP_BF_Chapel", "Before the Birth", false),
			tB("apocalypse", "CP_School_TightQuarter", "Jessica and Blake at Close Quarters", false),
			tB("apocalypse", "CP_BF_BaByIsBorn", "Knoth's Final Speech", false),
			// tB("", "", "", false), just incase I need this later
		};

	foreach(var s in sB) {
		if (s.Item4) // default options
			{
				settings.Add(s.Item2, true, s.Item3, s.Item1);
				settings.Add(s.Item2 + "-", true, s.Item3, s.Item1 + "2");
			} else // extra options
		{
			settings.Add(s.Item2 + "-", false, s.Item3, s.Item1 + "2");
		}
	}
	if (timer.CurrentTimingMethod == TimingMethod.RealTime) // stolen from dude simulator 3, basically asks the runner to set their livesplit to game time
		{
			var timingMessage = MessageBox.Show(
			"This game uses Time without Loads (Game Time) as the main timing method.\n" +
			"LiveSplit is currently set to show Real Time (RTA).\n" +
			"Would you like to set the timing method to Game Time? Mods do not retime loading screens for this game, if you do not use this your run will not be retimed",
			"LiveSplit | Outlast 2",
			MessageBoxButtons.YesNo, MessageBoxIcon.Question
		);

		if (timingMessage == DialogResult.Yes) {
			timer.CurrentTimingMethod = TimingMethod.GameTime;
		}
	}
}

init {
	vars.doneMaps = new List < string > ();

	// MD5 code by CptBrian.
	string MD5Hash;
	using(var md5 = System.Security.Cryptography.MD5.Create())
	using(var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
	MD5Hash = md5.ComputeHash(s).Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
	switch (MD5Hash) {
		case "F12C950CAEA7249C9E40A6ED1C8AA26C":
			version = "1.3";
			break;
		case "364FC6291701BA32BB5495126CFA54AB":
			version = "1.2";
			break;
	}
}

isLoading {
	return (current.ingame != 1 || vars.black); //Thanks Timbouton for the load remover
}

update {
	// end timing

	if ((current.map == "CP_BF_BaByIsBorn") && (current.zcoord < -19000.00) && (current.ycoord < -2000.00) && (current.xcoord < 1125.00) && (current.xcoord > 1100.00) && (!vars.runover)) {
		vars.finalsplit = true;
		vars.runover = true;
	}
	
	if((old.ingame != 1) && (current.ingame == 1)) { //either just went to main menu or went back into game
		if ((current.zcoord.ToString("0") == "1985")) { //main menu
			vars.Stopwatch.Start();
			vars.DelayTime = 0.35;
			vars.black = true;
		}
	}

	if (vars.Stopwatch.Elapsed.TotalSeconds >= vars.DelayTime) {
		vars.Stopwatch.Reset();
		vars.black = false;	
	}
}

start {
	if ((current.map == "CP_Crash_CrashSiteWakeUp") && (current.ingame == 1) && (old.ingame != 1) && (current.zcoord != 1985) && (current.ycoord != -5)) {
		vars.doneMaps.Clear();
		vars.startermap = current.map;
		vars.finalsplit = false;
		vars.runover = false;
		vars.loading = false;
		return true;
	}

	if ((settings[("il")]) && (current.ingame == 1) && (old.ingame != 1) && (vars.ILStartingList.Contains(current.map)) && (current.zcoord != 1985) && (current.ycoord != -5)) {
		vars.doneMaps.Clear();
		vars.startermap = current.map;
		vars.finalsplit = false;
		vars.runover = false;
		return true;
	}
}

reset {
	if ((old.ingame == 1) && (current.ingame == 0) && (current.map == vars.startermap)) {
		return true;
	}
}

onStart { // in case the timer is started manually
	vars.doneMaps.Clear();
	vars.startermap = current.map;
	vars.finalsplit = false;
	vars.runover = false;
	vars.loading = false;
}

split {
	// checkpoint splitting
	if ((current.map != old.map) && ((settings[current.map]) || (settings[current.map + "-"])) && (!vars.doneMaps.Contains(current.map)) && (current.map != vars.startermap)) {
		vars.doneMaps.Add(current.map);
		return true;
	}

	if (vars.finalsplit) {
		vars.finalsplit = false;
		return true;
	}
}

// cherry if you're reading this hiiiiii
