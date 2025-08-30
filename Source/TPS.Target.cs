// This project uses GPL v3.0 licencing terms

using UnrealBuildTool;
using System.Collections.Generic;

public class TPSTarget : TargetRules 
{ 
	public TPSTarget(TargetInfo Target) : base(Target) 
	{ 
		Type = TargetType.Game; 
		ExtraModuleNames.AddRange( new string[] { "TPS" } ); 
	} 
} 
